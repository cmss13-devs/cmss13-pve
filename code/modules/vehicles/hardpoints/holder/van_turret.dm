
//UPP VAN TURRET
/obj/item/hardpoint/holder/tank_turret/uppvanturret
	name = "\improper Van Turret"
	desc = null
	icon = 'icons/obj/vehicles/uppvan.dmi'
	icon_state = "van_turret_0"
	disp_icon = "uppvan"
	disp_icon_state = "van_turret"
	activation_sounds = list('sound/weapons/vehicles/smokelauncher_fire.ogg')
	pixel_x = -65
	pixel_y = -65

	ammo = new /obj/item/ammo_magazine/hardpoint/turret_smoke/uppapc
	max_clips = 5
	use_muzzle_flash = FALSE

	allowed_seat = VEHICLE_DRIVER

	health = 3000
	damage_multiplier = 0.05

	accepted_hardpoints = list(
		// secondaries
		/obj/item/hardpoint/secondary/t60p3m,
	)
	hdpt_layer = HDPT_LAYER_TURRET
	px_offsets = list(
		"1" = list(0, 8),
		"2" = list(0, 10),
		"4" = list(-5, 19),
		"8" = list(5, 19)
	)

/obj/item/hardpoint/holder/tank_turret/uppvanturret/get_tgui_info()
	var/list/data = list()

	data += list(list( // turret smokescreen data
		"name" = "VT/CZ Turret Smoke Screen",
		"health" = health <= 0 ? null : floor(get_integrity_percent()),
		"uses_ammo" = TRUE,
		"current_rounds" = ammo.current_rounds / 5,
		"max_rounds"= ammo.max_rounds / 5,
		"mags" = LAZYLEN(backup_clips),
		"max_mags" = max_clips,
	))

	for(var/obj/item/hardpoint/H in hardpoints)
		data += list(H.get_tgui_info())

	return data
