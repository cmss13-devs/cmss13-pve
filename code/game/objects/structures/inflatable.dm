/obj/item/inflatable
	name = "inflatable wall"
	desc = "A folded membrane which rapidly expands into a large cubical shape on activation."
	icon = 'icons/obj/items/inflatable.dmi'
	icon_state = "folded_wall"
	w_class = SIZE_MEDIUM
	var/inflatable_type = /obj/structure/inflatable

/obj/item/inflatable/attack_self(mob/user)
	..()
	var/turf/open/T = user.loc
	if(!(istype(T) && T.allow_construction))
		to_chat(user, SPAN_WARNING("[src] must be inflated on a proper surface!"))
		return
	if(do_after(user, 0.5 SECONDS, INTERRUPT_ALL, BUSY_ICON_BUILD, src))
		playsound(loc, 'sound/items/zip.ogg', 25, TRUE)
		to_chat(user, SPAN_NOTICE(" You inflate [src]."))
		var/obj/structure/inflatable/R = new inflatable_type(usr.loc)
		src.transfer_fingerprints_to(R)
		R.add_fingerprint(user)
		qdel(src)



/obj/item/inflatable/door
	name = "inflatable door"
	desc = "A folded membrane which rapidly expands into a simple door on activation."
	icon = 'icons/obj/items/inflatable.dmi'
	icon_state = "folded_door"
	inflatable_type = /obj/structure/inflatable/door



/obj/structure/inflatable
	name = "inflatable wall"
	desc = "An inflated membrane. Do not puncture."
	density = TRUE
	anchored = TRUE
	opacity = FALSE

	icon = 'icons/obj/items/inflatable.dmi'
	icon_state = "wall"

	health = 50
	var/deflated = FALSE

/obj/structure/inflatable/bullet_act(obj/projectile/Proj)
	health -= Proj.damage
	..()
	if(health <= 0 && !deflated)
		deflate(1)
	return 1


/obj/structure/inflatable/ex_act(severity)
	switch(severity)
		if(0 to EXPLOSION_THRESHOLD_LOW)
			if(prob(50))
				deflate(1)
		if(EXPLOSION_THRESHOLD_LOW to EXPLOSION_THRESHOLD_MEDIUM)
			deflate(1)
		if(EXPLOSION_THRESHOLD_MEDIUM to INFINITY)
			deconstruct(FALSE)

/obj/structure/inflatable/attack_hand(mob/user as mob)
	add_fingerprint(user)
	return


/obj/structure/inflatable/proc/attack_generic(mob/living/user, damage = 0) //used by attack_animal
	health -= damage
	user.animation_attack_on(src)
	if(health <= 0)
		user.visible_message(SPAN_DANGER("[user] tears open [src]!"))
		deflate(1)
	else //for nicer text~
		user.visible_message(SPAN_DANGER("[user] tears at [src]!"))

/obj/structure/inflatable/attack_animal(mob/user as mob)
	if(!isanimal(user)) return
	var/mob/living/simple_animal/M = user
	if(M.melee_damage_upper <= 0) return
	attack_generic(M, M.melee_damage_upper)


/obj/structure/inflatable/attackby(obj/item/W as obj, mob/user as mob)
	if(!istype(W)) return

	if (can_puncture(W))
		visible_message(SPAN_DANGER("<b>[user] pierces [src] with [W]!</b>"))
		deflate(1)
	if(W.damtype == BRUTE || W.damtype == BURN)
		hit(W.force)
		..()
	return

/obj/structure/inflatable/proc/hit(damage, sound_effect = 1)
	health = max(0, health - damage)
	if(sound_effect)
		playsound(loc, 'sound/effects/Glasshit_old.ogg', 25, 1)
	if(health <= 0 && !deflated)
		deflate(1)


/obj/structure/inflatable/proc/deflate(violent=0)
	set waitfor = 0
	if(deflated)
		return
	deflated = TRUE
	playsound(loc, 'sound/machines/hiss.ogg', 25, 1)
	if(violent)
		visible_message("[src] rapidly deflates!")
		flick("wall_popping", src)
		sleep(10)
		deconstruct(FALSE)
	else
		visible_message("[src] slowly deflates.")
		flick("wall_deflating", src)
		spawn(50)
			deconstruct(TRUE)


/obj/structure/inflatable/deconstruct(disassembled = TRUE)
	if(!disassembled)
		new /obj/structure/inflatable/popped(loc)
	else
		var/obj/item/inflatable/R = new /obj/item/inflatable(loc)
		src.transfer_fingerprints_to(R)
	return ..()


/obj/structure/inflatable/verb/hand_deflate()
	set name = "Deflate"
	set category = "Object"
	set src in oview(1)

	if(isobserver(usr)) //to stop ghosts from deflating
		return
	if(isxeno(usr))
		return

	if(!deflated)
		deflate()
	else
		to_chat(usr, "[src] is already deflated.")


/obj/structure/inflatable/popped
	name = "popped inflatable wall"
	desc = "It used to be an inflatable wall, now it's just a mess of plastic."
	density = FALSE
	anchored = TRUE
	deflated = TRUE

	icon = 'icons/obj/items/inflatable.dmi'
	icon_state = "wall_popped"


/obj/structure/inflatable/popped/door
	name = "popped inflatable door"
	desc = "This used to be an inflatable door, now it's just a mess of plastic."

	icon = 'icons/obj/items/inflatable.dmi'
	icon_state = "door_popped"


/obj/structure/inflatable/door //Based on mineral door code
	name = "inflatable door"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

	icon = 'icons/obj/items/inflatable.dmi'
	icon_state = "door_closed"

	var/open = FALSE
	var/isSwitchingStates = FALSE

/obj/structure/inflatable/door/attack_remote(mob/user as mob) //those aren't machinery, they're just big fucking slabs of a mineral
	if(isRemoteControlling(user)) //so the AI can't open it
		return

/obj/structure/inflatable/door/attack_hand(mob/user as mob)
	return TryToSwitchState(user)

/obj/structure/inflatable/door/proc/TryToSwitchState(atom/user)
	if(isSwitchingStates) return
	if(ismob(user))
		var/mob/M = user
		if(world.time - user.last_bumped <= 60) return //NOTE do we really need that?
		if(M.client)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(!C.handcuffed)
					SwitchState()
			else
				SwitchState()

/obj/structure/inflatable/door/proc/SwitchState()
	if(open)
		close()
	else
		open()

/obj/structure/inflatable/door/proc/open()
	isSwitchingStates = TRUE
	//playsound(loc, 'sound/effects/stonedoor_openclose.ogg', 25, 1)
	flick("door_opening",src)
	addtimer(CALLBACK(src, PROC_REF(finish_open)), 1 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_NO_HASH_WAIT)

/obj/structure/inflatable/door/proc/finish_open()
	if(!loc)
		return
	density = FALSE
	opacity = FALSE
	open = TRUE
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/inflatable/door/proc/close()
	isSwitchingStates = TRUE
	//playsound(loc, 'sound/effects/stonedoor_openclose.ogg', 25, 1)
	flick("door_closing",src)
	addtimer(CALLBACK(src, PROC_REF(finish_close)), 1 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_NO_HASH_WAIT)

/obj/structure/inflatable/door/proc/finish_close()
	if(!loc)
		return
	density = TRUE
	opacity = FALSE
	open = FALSE
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/inflatable/door/update_icon()
	if(open)
		icon_state = "door_open"
	else
		icon_state = "door_closed"

/obj/structure/inflatable/door/deflate(violent=0)
	set waitfor = 0
	playsound(loc, 'sound/machines/hiss.ogg', 25, 1)
	if(violent)
		visible_message("[src] rapidly deflates!")
		flick("door_popping",src)
		sleep(10)
		new /obj/structure/inflatable/popped/door(loc)
		//var/obj/item/inflatable/door/torn/R = new /obj/item/inflatable/door/torn(loc)
		//src.transfer_fingerprints_to(R)
		qdel(src)
	else
		//to_chat(user, SPAN_NOTICE(" You slowly deflate the inflatable wall."))
		visible_message("[src] slowly deflates.")
		flick("door_deflating", src)
		spawn(50)
			var/obj/item/inflatable/door/R = new /obj/item/inflatable/door(loc)
			src.transfer_fingerprints_to(R)
			qdel(src)






/obj/item/storage/briefcase/inflatable
	name = "inflatable barrier box"
	desc = "Contains inflatable walls and doors."
	icon = 'icons/obj/items/storage/boxes.dmi'
	icon_state = "inf_box"
	item_state = "syringe_kit"
	max_storage_space = 21

/obj/item/storage/briefcase/inflatable/Initialize()
	. = ..()
	new /obj/item/inflatable/door(src)
	new /obj/item/inflatable/door(src)
	new /obj/item/inflatable/door(src)
	new /obj/item/inflatable(src)
	new /obj/item/inflatable(src)
	new /obj/item/inflatable(src)
	new /obj/item/inflatable(src)
