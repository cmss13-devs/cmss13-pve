/area/zorka
	name = "\improper Zorka Fortress"
	icon_state = "ice_colony"
	icon_state = "cliff_blocked"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

/area/zorka/exterior
	name = "\improper Snow Desert"
	requires_power = 1
	always_unpowered = 1
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	temperature = ICE_COLONY_TEMPERATURE
	soundscape_playlist = SCAPE_PL_WIND

/area/zorka/fortress
	icon_state = "clear"
	ceiling = CEILING_METAL
