#define DEFAULT_HEADSET_SLOT WEAR_L_EAR
#define ICON_HEADSET_SUFFIX "_hs"

/datum/component/attached_headset
	dupe_mode = COMPONENT_DUPE_UNIQUE

	/// The slot the parent is equipped to that activates the headset
	var/parent_activation_slot

	/// The headset that is attached to the parent
	var/obj/item/device/radio/headset/headset

	/// The version of our parent that is actually useful
	var/obj/item/item_parent

	/// Holds the variables initial icon state before adding the headset
	var/parent_initial_icon_state

/datum/component/attached_headset/Initialize(mob/user, obj/item/device/radio/headset/headset, activation_slot)
	. = ..()

	if(!istype(parent, /obj))
		return COMPONENT_INCOMPATIBLE

	item_parent = parent

	if(!icon_exists(item_parent.icon, item_parent.icon_state + "_hs", FALSE))
		return COMPONENT_INCOMPATIBLE_NO_ERROR

	if(!activation_slot)
		return COMPONENT_INCOMPATIBLE

	src.headset = headset
	parent_activation_slot = activation_slot

	if(user)
		user.drop_inv_item_on_ground(headset)

	headset.moveToNullspace()

	parent_initial_icon_state = item_parent.icon_state
	item_parent.icon_state = parent_initial_icon_state + ICON_HEADSET_SUFFIX

/datum/component/attached_headset/Destroy()
	. = ..()
	if(!QDELETED(headset) && !headset.loc)
		qdel(headset)

	headset = null

	item_parent.icon_state = parent_initial_icon_state

	item_parent = null

/datum/component/attached_headset/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_ITEM_ATTEMPTING_HUMAN_EQUIP, PROC_REF(on_attempted_equip))
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equipped))
	RegisterSignal(parent, COMSIG_ITEM_ATTACKED, PROC_REF(attackby))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(dropped))
	RegisterSignal(headset, COMSIG_PARENT_QDELETING, PROC_REF(headset_deletion))

/datum/component/attached_headset/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_ITEM_ATTEMPTING_HUMAN_EQUIP)
	UnregisterSignal(parent, COMSIG_ITEM_EQUIPPED)
	UnregisterSignal(parent, COMSIG_ITEM_ATTACKED)
	UnregisterSignal(parent, COMSIG_ITEM_DROPPED)
	UnregisterSignal(headset, COMSIG_PARENT_QDELETING)
	. = ..()

/datum/component/attached_headset/InheritComponent(datum/component/C, i_am_original)
	if(!istype(item_parent.loc, /mob))
		return

	var/mob/user = item_parent.loc
	to_chat(user, SPAN_NOTICE("[parent] already has [headset] attached to it. Looks like you could remove it with a screwdriver."))

/// Cancels equipping parent if there's a headset already on the left ear
/datum/component/attached_headset/proc/on_attempted_equip(obj/item/equipping_item, mob/living/carbon/human/user, slot)
	SIGNAL_HANDLER

	if(slot != parent_activation_slot)
		return

	if(user.wear_l_ear || istype(user.wear_r_ear, /obj/item/device/radio/headset))
		to_chat(user, SPAN_NOTICE("[equipping_item] has [headset] attached to it. It can't fit while you're wearing [user.wear_l_ear ? user.wear_l_ear : user.wear_r_ear]."))
		return COMPONENT_ITEM_CANCEL_ATTEMPTING_HUMAN_EQUIP

/// When parent is equipped we check if it's the right slot, if so then we deploy our headset
/datum/component/attached_headset/proc/on_equipped(obj/item/equipping_item, mob/user, slot)
	SIGNAL_HANDLER

	if(slot != parent_activation_slot)
		return

	if(!user.equip_to_slot_if_possible(headset, DEFAULT_HEADSET_SLOT))
		to_chat(user, SPAN_NOTICE("[headset] breaks off of [equipping_item] due to being unable to fit."))
		headset.forceMove(user.loc)
		qdel(src)
		return

	headset.flags_item |= NODROP

/// When parent is dropped we make sure the headset is where it should be
/datum/component/attached_headset/proc/dropped(obj/item/dropped_item, mob/user)
	if(!(headset in user))
		if(headset.loc)
			qdel(headset)
			qdel(src)
			stack_trace("An attached headset was not on a mob but somehow not in nullspace.")
		return

	headset.flags_item &= ~NODROP
	user.drop_inv_item_on_ground(headset)
	headset.moveToNullspace()

/// When attacked by a screwdriver and the parent is in the user's hands then we remove our headset and delete the component
/datum/component/attached_headset/proc/attackby(obj/item/attacked_item, obj/item/attacking_item, mob/user)
	SIGNAL_HANDLER

	if(!HAS_TRAIT(attacking_item, TRAIT_TOOL_SCREWDRIVER))
		return

	if(parent != user.r_hand && parent != user.l_hand)
		return

	to_chat(user, SPAN_NOTICE("You use [attacking_item] to take [headset] off of [parent]."))
	user.put_in_hands(headset)
	qdel(src)

	return COMPONENT_CANCEL_ITEM_ATTACK


/datum/component/attached_headset/proc/headset_deletion()
	SIGNAL_HANDLER

	qdel(src)

#undef ICON_HEADSET_SUFFIX
#undef DEFAULT_HEADSET_SLOT
