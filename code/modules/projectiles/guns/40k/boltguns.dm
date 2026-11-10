//-------------------------------------------------------
//Boltpistol - Guard
/obj/item/weapon/gun/pistol/boltpistol
	name = "godwyn-branx mk.IV bolt pistol"
	desc = "The boltpistol is a short-ranged, high-caliber firearm that fires explosive rounds. It is the irregular sidearm of the Imperial Guard and is often used by officers and commissars."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi'
	icon_state = "boltpistol"
	item_state = "boltpistol"
	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_ONE_HAND_WIELDED|GUN_AUTO_EJECT_CASINGS
	fire_sound = 'sound/weapons/gun_boltpistol.ogg'
	current_mag = /obj/item/ammo_magazine/pistol/boltpistol
	w_class = SIZE_SMALL
	force = 5
	attachable_allowed = null

/obj/item/weapon/gun/pistol/boltpistol/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 28, "muzzle_y" = 20,"rail_x" = 10, "rail_y" = 21, "under_x" = 21, "under_y" = 17, "stock_x" = 21, "stock_y" = 17, "side_rail_x" = 20, "side_rail_y" = 15)

/obj/item/weapon/gun/pistol/boltpistol/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_6)
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	burst_scatter_mult = SCATTER_AMOUNT_TIER_5
	scatter_unwielded = SCATTER_AMOUNT_TIER_8
	scatter = SCATTER_AMOUNT_TIER_9
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_2
	recoil_unwielded = RECOIL_AMOUNT_TIER_1
