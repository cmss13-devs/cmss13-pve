// smg
/obj/item/weapon/gun/energy/laz_uzi/alien
	name = "weapon of unknown design"
	desc = "A strange alien weapon."
	icon = 'void-marines/icons/energy64.dmi'
	icon_state = "ter"
	item_state = "ter"

	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/energy_left_1.dmi',
		WEAR_R_HAND = 'void-marines/icons/energy_right_1.dmi'
		)

	charge_cost = 25
	charge_icon = ""

	gun_category = GUN_CATEGORY_SMG
	flags_equip_slot = SLOT_WAIST

/obj/item/weapon/gun/energy/laz_uzi/alien/handle_fire(atom/target, mob/living/carbon/human/user, params, reflex, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		visible_message(SPAN_DANGER("[src] explodes right in the hands of [user]!"))
		cell_explosion(get_turf(src), 30, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("weapon explosion", user))
		if(!QDELETED(src))
			qdel(src)
		return NONE
	. = ..()

// pistol
/datum/ammo/energy/rxfm_eva // OVERRIDE
	flags_ammo_behavior = AMMO_ENERGY

/obj/item/weapon/gun/energy/rxfm5_eva/alien
	name = "weapon of unknown design"
	desc = "A strange alien weapon."
	icon = 'void-marines/icons/energy64.dmi'
	icon_state = "tep"
	item_state = "tep"

	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/energy_left_1.dmi',
		WEAR_R_HAND = 'void-marines/icons/energy_right_1.dmi'
		)

	w_class = SIZE_SMALL

	muzzle_flash = "muzzle_laser"
	fire_sound = 'sound/weapons/Laser4.ogg'

	attachable_allowed = list()
	starting_attachment_types = list()

	charge_cost = 150
	charge_icon = ""

	flags_item = null
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER

/obj/item/weapon/gun/energy/rxfm5_eva/alien/update_icon()
	icon_state = "tep"
	item_state = "tep"
	return

/obj/item/weapon/gun/energy/rxfm5_eva/alien/handle_fire(atom/target, mob/living/carbon/human/user, params, reflex, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		visible_message(SPAN_DANGER("[src] explodes right in the hands of [user]!"), SPAN_DANGER("[src] explodes right in the hands of [user]!"))
		cell_explosion(get_turf(src), 30, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("weapon explosion", user))
		if(!QDELETED(src))
			qdel(src)
		return NONE
	. = ..()
