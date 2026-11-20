//rxm machine

/obj/item/attachable/reddot/eva/pve
	name = "RXF-M5 EVA sight"
	icon_state = "rxfm5_eva_scope"
	attach_icon = "rxfm5_eva_scope_a"
	desc = "A basic laser pistol sight for accurate shooting. The RXF is best pointfired but it could shoot an IPSC match in a pinch with this."

/obj/item/attachable/reddot/New()
	..()

/obj/item/attachable/flashlight/eva
	name = "RXF-M5 EVA underbarrel flashlight"
	desc = "Standard white light. Works well for point shooting; if the circle's fully inside the tango's chest pull the trigger."
	icon = 'icons/obj/items/weapons/guns/attachments/under.dmi'
	icon_state = "rxfm5_eva_doodad"
	attach_icon = "rxfm5_eva_doodad_a"
	slot = "under"
	original_state = "rxfm5_eva_doodad"
	original_attach = "rxfm5_eva_doodad_a"

/obj/item/attachable/flashlight/eva/New()
	..()
	accuracy_mod = HIT_ACCURACY_MULT_TIER_2
	accuracy_unwielded_mod = HIT_ACCURACY_MULT_TIER_4
