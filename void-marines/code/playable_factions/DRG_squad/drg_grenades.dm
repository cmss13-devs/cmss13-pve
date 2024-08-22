/****************************************/
/*
			L.U.R.E. grenade
*/
/****************************************/

/obj/item/explosive/grenade/drg_decoy
	name = "L.U.R.E. grenade"
	desc = "The Laser Utility Refraction Emitter (aka L.U.R.E.) is the default Throwable for the Engineer. \
	It is a miniature projector device that creates holograms of a pretty woman, \
	dancing enough to distract primitive creatures, or entertain very 'hungry' men."
	icon_state = "flashbang2"
	item_state = "flashbang"

	antigrief_protection = FALSE
	dangerous = TRUE
	harmful = FALSE

	var/decoy_type = /obj/effect/drg/hologramm
	var/work_duration = 16 SECONDS
	var/max_attracted = 10

/obj/item/explosive/grenade/drg_decoy/prime()
	. = ..()

	if(!isturf(loc))
		return

	anchored = TRUE // You have the right to be deadass nailed, mr. nade
	overlays.Cut() // Remove danger warnings

	var/turf/T = get_turf(src)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)

	for(var/mob/living/L in viewers(T, null))
		L.flash_eyes(bypass_checks = TRUE, type = /atom/movable/screen/fullscreen/flash, flash_timer = 0.5 SECONDS)

	new decoy_type(T, src, max_attracted, work_duration)

	QDEL_IN(src, work_duration)

/*
	Temporary hologramm which forces some amount of bugs to chew it
*/
/obj/effect/drg/hologramm
	desc = "Just a fancy hologram, enough to distract a primitive creature, such as tired miners."
	name = "decoy"
	icon = 'void-marines/icons/holograms.dmi'
	icon_state = "type2"

	unacidable = TRUE
	layer = ABOVE_FLY_LAYER
	plane = HUD_PLANE

	var/animation_time = 1 SECONDS

/obj/effect/drg/hologramm/Initialize(mapload, atom/grenade, max_attracted, duration)
	. = ..()

	pixel_x = grenade.pixel_x
	pixel_y = grenade.pixel_y + 10

	RegisterSignal(grenade, COMSIG_PARENT_QDELETING, PROC_REF(remove))

	AddComponent(/datum/component/ai_behavior_override/attack)
	var/datum/component/ai_behavior_override/override = datum_components[/datum/component/ai_behavior_override/attack]
	override.max_assigned = max_attracted

	addtimer(CALLBACK(src, PROC_REF(disappear)), duration - animation_time)

/obj/effect/drg/hologramm/proc/disappear()
	sleep(animation_disappear(src, animation_time))
	qdel(src)

/obj/effect/drg/hologramm/proc/remove()
	SIGNAL_HANDLER
	qdel(src)

/*
	Neat fade-out animation for hologramm
*/
/proc/animation_disappear(atom/A, speed = 10)
	var/quarter = speed * 0.25
	animate(A, transform = matrix(2, 0.75, MATRIX_SCALE), time = quarter, easing = SINE_EASING|EASE_OUT)
	sleep(quarter)
	animate(A, transform = matrix(0, 4, MATRIX_SCALE), alpha = 0, time = speed-quarter, easing = BACK_EASING)
	return speed
