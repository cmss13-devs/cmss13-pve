/obj/effect/landmark/freed_mob_spawner
	name = "Naked Human"
	icon_state = "freed_mob_spawner"
	var/equipment_path = /datum/equipment_preset/strip
	var/count_participant = FALSE

/obj/effect/landmark/freed_mob_spawner/Initialize()
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(spawn_freed_mob))
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/freed_mob_spawner/Destroy()
	equipment_path = null
	return ..()

/obj/effect/landmark/freed_mob_spawner/proc/spawn_freed_mob()
	var/mob/living/carbon/human/H = new(loc)
	H.setDir(dir)
	if(!H.hud_used)
		H.create_hud()
	arm_equipment(H, equipment_path, TRUE, count_participant)
	H.free_for_ghosts()

