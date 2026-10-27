// PVE tech-man compliant mini scope, planned to have togglable vision modes for shitty night-vision when scoped in

/obj/item/attachable/scope/pve
	name = "AN/RVS-52 CCD television sight system"
	desc = "An ARMAT designed 3x magnification weapon sight, allows for greater accuracy at range and under low-light conditions. The mounting brackets are designed to fit on the most commonly-used rifles of the USCM. This one looks like it's been in service since the start of the Linna 349 campaign."
	icon = 'modular_pve/icons/obj/items/weapons/guns/attachments/rail.dmi'
	icon_state = "pvescope"
	zoom_offset = 3
	zoom_viewsize = 7
	allows_movement = TRUE
	var/dynamic_aim_slowdown = SLOWDOWN_ADS_MINISCOPE_DYNAMIC

/obj/item/attachable/scope/pve/New()
	..()
	damage_falloff_scoped_buff = -0.2

/obj/item/attachable/scope/pve/apply_scoped_buff(obj/item/weapon/gun/G, mob/living/carbon/user)
	. = ..()
	if(G.zoom)
		G.slowdown += dynamic_aim_slowdown

/obj/item/attachable/scope/pve/remove_scoped_buff(mob/living/carbon/user, obj/item/weapon/gun/G)
	G.slowdown -= dynamic_aim_slowdown
	..()
