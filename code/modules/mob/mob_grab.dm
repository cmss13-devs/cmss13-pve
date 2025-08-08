#define UPGRADE_COOLDOWN 2 SECONDS

/obj/item/grab
	name = "grab"
	icon_state = "reinforce"
	icon = 'icons/mob/hud/screen1.dmi'
	flags_atom = NO_FLAGS
	flags_item = NOBLUDGEON|DELONDROP|ITEM_ABSTRACT
	layer = ABOVE_HUD_LAYER
	plane = ABOVE_HUD_PLANE
	item_state = "nothing"
	w_class = SIZE_HUGE
	var/atom/movable/grabbed_thing
	var/last_upgrade = 0 //used for cooldown between grab upgrades.


/obj/item/grab/Initialize()
	. = ..()
	last_upgrade = world.time

/obj/item/grab/dropped(mob/user)
	user.stop_pulling()
	. = ..()

/obj/item/grab/Destroy()
	grabbed_thing = null
	var/mob/M = loc
	if(istype(M))
		/// If a mob is qdeleted while grabbing, the stack will call for stop_pulling(), which will call for this item to be deleted on drop.
		/// But it is already being deleted through previous procs in the stack; so we don't want to call the function again when it is dropped.
		if(M.gc_destroyed == GC_CURRENTLY_BEING_QDELETED) flags_item &= ~DELONDROP
		M.grab_level = 0
		M.stop_pulling()
	. = ..()

/obj/item/grab/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!user)
		return
	if(user.pulling == user.buckled) return //can't move the thing you're sitting on.
	if(user.grab_level >= GRAB_CARRY)
		return
	if(istype(target, /obj/effect))//if you click a blood splatter with a grab instead of the turf,
		target = get_turf(target) //we still try to move the grabbed thing to the turf.
	if(isturf(target))
		var/turf/T = target
		if(!T.density && T.Adjacent(user))
			var/move_dir = get_dir(user.pulling.loc, T)
			step(user.pulling, move_dir)
			var/mob/living/pmob = user.pulling
			if(istype(pmob))
				SEND_SIGNAL(pmob, COMSIG_MOB_MOVE_OR_LOOK, TRUE, move_dir, move_dir)


/obj/item/grab/attack_self(mob/user)
	..()
	var/grab_delay = UPGRADE_COOLDOWN
	var/list/grabdata = list("grab_delay" = grab_delay)
	SEND_SIGNAL(user, COMSIG_MOB_GRAB_UPGRADE, grabdata)
	grab_delay = grabdata["grab_delay"]

	if(!ismob(grabbed_thing) || world.time < (last_upgrade + grab_delay * user.get_skill_duration_multiplier(SKILL_CQC)))
		return

	if(!ishuman(user)) //only humans can reinforce a grab.
		if (isxeno(user))
			var/mob/living/carbon/xenomorph/xeno = user
			xeno.pull_power(grabbed_thing)
		return


	var/mob/victim = grabbed_thing
	last_upgrade = world.time

	switch(user.grab_level)
		if(GRAB_PASSIVE)
			progress_passive(user, victim)
		if(GRAB_AGGRESSIVE)
			progress_aggressive(user, victim)

	if(user.grab_level >= GRAB_AGGRESSIVE)
		ADD_TRAIT(victim, TRAIT_FLOORED, CHOKEHOLD_TRAIT)

/obj/item/grab/proc/progress_passive(mob/living/carbon/human/user, mob/living/victim)
	if(SEND_SIGNAL(victim, COMSIG_MOB_AGGRESSIVELY_GRABBED, user) & COMSIG_MOB_AGGRESIVE_GRAB_CANCEL)
		to_chat(user, SPAN_WARNING("You can't grab [victim] aggressively!"))
		return

	user.grab_level = GRAB_AGGRESSIVE
	playsound(src.loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)
	user.visible_message(SPAN_WARNING("[user] has grabbed [victim] aggressively!"), null, null, 5)

/obj/item/grab/proc/progress_aggressive(mob/living/carbon/human/user, mob/living/victim)
	user.grab_level = GRAB_CHOKE
	playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)
	user.visible_message(SPAN_WARNING("[user] holds [victim] by the neck and starts choking them!"), null, null, 5)
	msg_admin_attack("[key_name(user)] started to choke [key_name(victim)] at [get_area_name(victim)]", victim.loc.x, victim.loc.y, victim.loc.z)
	victim.Move(user.loc, get_dir(victim.loc, user.loc))
	victim.update_transform(TRUE)

/obj/item/grab/attack(mob/living/dragged_mob, mob/living/user)
	if(dragged_mob == grabbed_thing)
		attack_self(user)
	else if(dragged_mob == user && user.pulling && isxeno(user))
		var/mob/living/carbon/xenomorph/xeno = user
		var/mob/living/carbon/pulled = xeno.pulling
		if(!istype(pulled))
			return
		if(isxeno(pulled) || issynth(pulled))
			to_chat(xeno, SPAN_WARNING("That wouldn't serve a purpose."))
			return 0
		if(pulled.buckled)
			to_chat(xeno, SPAN_WARNING("[pulled] is buckled to something."))
			return 0
		if(pulled.stat == DEAD && !pulled.chestburst)
			to_chat(xeno, SPAN_WARNING("Ew, [pulled] is already starting to rot."))
			return 0
		if(xeno.hauled_mob?.resolve()) // We can't carry more than one mob
			to_chat(xeno, SPAN_WARNING("You are already carrying something, there's no way that will work."))
			return 0
		if(HAS_TRAIT(pulled, TRAIT_HAULED))
			to_chat(xeno, SPAN_WARNING("They are already being hauled by someone else."))
			return 0
			/* Saving this in case we want to allow hauling of dead bodies UNLESS their client is still online somewhere
			if(pulled.client) //The client is still inside the body
			else // The client is observing
				for(var/mob/dead/observer/G in player_list)
					if(ckey(G.mind.original.ckey) == pulled.ckey)
						to_chat(src, "You start to haul [pulled] but realize \he is already dead.")
						return */
		if(user.action_busy)
			to_chat(xeno, SPAN_WARNING("We are already busy with something."))
			return
		SEND_SIGNAL(xeno, COMSIG_MOB_EFFECT_CLOAK_CANCEL)
		xeno.visible_message(SPAN_DANGER("[xeno] starts to restrain [pulled]!"),
		SPAN_DANGER("We start restraining [pulled]!"), null, 5)
		if(HAS_TRAIT(xeno, TRAIT_CLOAKED)) //cloaked don't show the visible message, so we gotta work around
			to_chat(pulled, FONT_SIZE_HUGE(SPAN_DANGER("[xeno] is trying to restrain you!")))
		if(do_after(xeno, 50, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
			if((isxeno(pulled.loc) && !xeno.hauled_mob) || HAS_TRAIT(pulled, TRAIT_HAULED))
				to_chat(xeno, SPAN_WARNING("Someone already took \the [pulled]."))
				return 0
			if(xeno.pulling == pulled && !pulled.buckled && (pulled.stat != DEAD || pulled.chestburst) && !xeno.hauled_mob?.resolve()) //make sure you've still got them in your claws, and alive
				if(SEND_SIGNAL(pulled, COMSIG_MOB_HAULED, xeno) & COMPONENT_CANCEL_HAUL)
					return FALSE
				xeno.haul(pulled)
				xeno.stop_pulling()

