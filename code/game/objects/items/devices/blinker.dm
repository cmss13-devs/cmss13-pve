/obj/item/device/blinker
	name = "IR blinker"
	desc = "Emits an infra-red AND radio signal that allows for near-instant communication with whatever ship is supposed to provide air support for you."
	icon_state = "blinker"
	item_state = null
	w_class = SIZE_TINY
	var/datum/action/item_action/activation
	var/obj/item/attached_item

/obj/item/device/blinker/on_enter_storage(obj/item/storage/internal/S)
	..()

	if(!istype(S))
		return

	remove_attached_item()

	attached_item = S.master_object
	RegisterSignal(attached_item, COMSIG_PARENT_QDELETING, PROC_REF(remove_attached_item))
	activation = new /datum/action/item_action/toggle(src, S.master_object)

	if(ismob(S.master_object.loc))
		activation.give_to(S.master_object.loc)

/obj/item/device/blinker/on_exit_storage(obj/item/storage/S)
	remove_attached_item()
	return ..()

/obj/item/device/blinker/proc/remove_attached_item()
	SIGNAL_HANDLER
	if(!attached_item)
		return

	UnregisterSignal(attached_item, COMSIG_PARENT_QDELETING)
	UnregisterSignal(attached_item, COMSIG_ITEM_EQUIPPED)
	qdel(activation)
	attached_item = null

/obj/item/device/blinker/ui_action_click(mob/owner, obj/item/holder)
	attack_self(owner)

/obj/item/device/blinker/attack_self(mob/user)
	..()
	user.visible_message(SPAN_NOTICE("[user] activates \his blinker, sending a signal."))
	playsound(src.loc, 'sound/effects/zzzt.ogg', 25, 1)

	message_admins("<font size=5>[key_name(user)] blinked the blinker! [ADMIN_JMP(user)]</font>")
