GLOBAL_VAR_INIT(driller_c4_freq, rand(SIGNALLER_FREQ_MIN, SIGNALLER_FREQ_MAX))

/****************************************/
/*
			Satchel Charge
*/
/****************************************/

/obj/item/explosive/grenade/custom/drg_driller_c4
	name = "satchel charge"
	icon = 'icons/obj/items/assemblies.dmi'
	icon_state = "custom_plastic_explosive_sensing"
	base_icon_state = "custom_plastic_explosive"

	underslug_launchable = FALSE
	det_time = 0.5 SECONDS

	assembly_stage = ASSEMBLY_LOCKED
	throw_range = 5

	arm_sound = 'void-marines/sound/drg/DetpackBeepEndA_1.ogg'
	var/beep_sounds = list('void-marines/sound/drg/DetpackBeepA_1.ogg', \
		'void-marines/sound/drg/DetpackBeepA_2.ogg', \
		'void-marines/sound/drg/DetpackBeepA_3.ogg', \
		'void-marines/sound/drg/DetpackBeepA_4.ogg')

/obj/item/explosive/grenade/custom/drg_driller_c4/Initialize()
	. = ..()
	detonator = new /obj/item/device/assembly_holder/signaller_igniter(src, GLOB.driller_c4_freq)
	det_time = initial(det_time) // to prevent parent timer randomizer

	RegisterSignal(src, COMSIG_MOVABLE_FORCEMOVED, PROC_REF(on_update_pos))
	START_PROCESSING(SSobj, src)

/obj/item/explosive/grenade/custom/drg_driller_c4/proc/on_update_pos(atom/NewLoc)
	SIGNAL_HANDLER
	update_icon()

/obj/item/explosive/grenade/custom/drg_driller_c4/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/explosive/grenade/custom/drg_driller_c4/process()
	if(isturf(loc) && !active)
		playsound(loc, pick(beep_sounds), 15, FALSE, 8)

/obj/item/explosive/grenade/custom/drg_driller_c4/attack_self(mob/user)
	SHOULD_CALL_PARENT(FALSE)
	toggle_blast_dampener(user)

/obj/item/explosive/grenade/custom/drg_driller_c4/activate(mob/user, hand_throw)
	return

/obj/item/explosive/grenade/custom/drg_driller_c4/prime(force = FALSE)
	if(!isturf(loc))
		return

	w_class = SIZE_MASSIVE // We cheat a little, primed nades become massive so they cant be stored anywhere
	active = TRUE

	playsound(loc, arm_sound, 75)
	update_icon()

	spawn(det_time)
		cell_explosion(get_turf(src), 350, 80, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
		qdel(src)

/obj/item/explosive/grenade/custom/drg_driller_c4/update_icon()
	if(active && dangerous)
		dangerous = FALSE
		overlays+=new/obj/effect/overlay/danger
		icon_state = base_icon_state + "_active"
		return

	if(isturf(loc))
		icon_state = base_icon_state + "_sensing"
		return

	icon_state = base_icon_state + "_locked"

/*
	Signaller Detonator
*/
/obj/item/device/assembly/signaller/drg_driller_detonator/Initialize(mapload, ...)
	. = ..()
	set_frequency(GLOB.driller_c4_freq)

/*
	Signaller Assembly
*/
/obj/item/device/assembly_holder/signaller_igniter
	name = "signaller-igniter assembly"

/obj/item/device/assembly_holder/signaller_igniter/Initialize(mapload, signaller_freq = 1457, signaller_code = 30)
	. = ..()

	var/obj/item/device/assembly/igniter/ign = new(src)
	ign.secured = 1
	ign.holder = src

	var/obj/item/device/assembly/signaller/sig = new(src)
	sig.set_frequency(signaller_freq)
	sig.code = signaller_code
	sig.secured = 1
	sig.holder = src

	a_right = ign
	a_left = sig
	secured = 1

	update_icon()
