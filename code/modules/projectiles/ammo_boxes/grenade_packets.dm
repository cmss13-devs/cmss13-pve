/obj/item/storage/box/packet
	icon = 'icons/obj/items/storage/packets.dmi'
	icon_state = "general_packet"
	w_class = SIZE_MEDIUM//fits into bags
	storage_slots = 5	//Baseline amount the mk1 UGL holds
	can_hold = list(/obj/item/explosive/grenade)
	foldable = TRUE
	var/content_type
	var/base_icon
	var/packet_icon
	has_gamemode_skin = FALSE

/obj/item/storage/box/packet/post_skin_selection()
	base_icon = icon_state

/obj/item/storage/box/packet/update_icon()
	overlays.Cut()
	if(!length(contents))
		icon_state = "[base_icon]_e"
	else
		icon_state = base_icon
		if(packet_icon)
			overlays += image(icon, packet_icon)


/obj/item/storage/box/packet/Initialize()
	if(!content_type)
		return INITIALIZE_HINT_QDEL

	. = ..()

	update_icon()

/obj/item/storage/box/packet/fill_preset_inventory()
	for(var/i in 1 to storage_slots)
		new content_type(src)

GLOBAL_LIST_INIT(grenade_packets, list(
	/obj/item/storage/box/packet/high_explosive,
	/obj/item/storage/box/packet/high_explosive/upp,
	/obj/item/storage/box/packet/baton,
	/obj/item/storage/box/packet/flare,
	/obj/item/storage/box/packet/canister,
	/obj/item/storage/box/packet/incendiary,
	/obj/item/storage/box/packet/smoke,
	/obj/item/storage/box/packet/phosphorus,
	/obj/item/storage/box/packet/heap,
	/obj/item/storage/box/packet/bfab,
	/obj/item/storage/box/packet/phosphorus/upp,
	/obj/item/storage/box/packet/m15,
	))

/obj/item/storage/box/packet/high_explosive
	name = "\improper M40 HEDP grenade packet"
	desc = "It contains five M40 HEDP high explosive grenades."
	packet_icon = "hedp-p"
	content_type = /obj/item/explosive/grenade/high_explosive

/obj/item/storage/box/packet/high_explosive/upp
	name = "\improper Type 6 fragmentation grenade packet"
	desc = "It contains six Type 6 fragmentation grenades."
	storage_slots = 6
	icon_state = "nadeboxupp"
	packet_icon = "upp-p" //Just so it doesn't come with the HEDP packet icon on it
	content_type = /obj/item/explosive/grenade/high_explosive/upp

/obj/item/storage/box/packet/high_explosive/upp/impact
	name = "\improper VOG-73 fragmentation grenade packet"
	desc = "It contains six VOG-73 fragmentation grenades."
	content_type = /obj/item/explosive/grenade/high_explosive/impact/upp

/obj/item/storage/box/packet/high_explosive/upp/smoke
	name = "\improper RDG-17 smoke grenade packet"
	desc = "It contains six RDG-17 smoke grenades."
	content_type = /obj/item/explosive/grenade/smokebomb/upp

/obj/item/storage/box/packet/baton
	name = "\improper M230 LLRB grenade packet"
	desc = "It contains five M230 LLRB (Less-than-Lethal Rubber Baton) grenade-launched rounds."
	packet_icon = "hirr-p"
	content_type = /obj/item/explosive/grenade/slug/baton

/obj/item/storage/box/packet/flare
	name = "\improper M72A2 HIPF starshell grenade packet"
	desc = "It contains five M72A2 HIPF starshell grenades. Used for illumination."
	packet_icon = "hiaf-p"
	content_type = /obj/item/explosive/grenade/high_explosive/impact/flare

/obj/item/storage/box/packet/canister
	name = "\improper M108 canister grenade packet"
	desc = "It contains five M108 canister grenades. Can only be used via a grenade launcher."
	packet_icon = "cani-p"
	content_type = /obj/item/explosive/grenade/high_explosive/airburst/canister

/obj/item/storage/box/packet/incendiary
	name = "\improper M77 HIAM grenade packet"
	desc = "It contains five M77 HIAM incendiary grenades."
	packet_icon = "hiam-p"
	content_type = /obj/item/explosive/grenade/incendiary

/obj/item/storage/box/packet/smoke
	name = "\improper M47 HSDP grenade packet"
	desc = "It contains five M47 HSDP smoke grenades."
	packet_icon = "hsdp-p"
	content_type = /obj/item/explosive/grenade/smokebomb

/obj/item/storage/box/packet/phosphorus
	name = "\improper M60 WPSI grenade packet"
	desc = "It contains five M60 WPSI chemical compound grenades."
	packet_icon = "wpsi-p"
	content_type = /obj/item/explosive/grenade/phosphorus

/obj/item/storage/box/packet/phosphorus/upp
	name = "\improper Type 8 WP grenade packet"
	desc = "It contains three type 8 white phosphorus grenades."
	storage_slots = 3
	icon = 'icons/obj/items/storage/kits.dmi'
	icon_state = "cryo_defense_kit"
	content_type = /obj/item/explosive/grenade/phosphorus/upp

/obj/item/storage/box/packet/hefa/toy
	name = "toy HEFA grenade packet"
	desc = "These little packets of joy were distributed in the 100th (Season 2) Issue of the Boots! magazine as commemorative rewards for subscribers. Nobody knows how anyone, at any point, never asked 'wait, is this a terrible idea?' during the process."
	packet_icon = "hefa-p"
	content_type = /obj/item/explosive/grenade/high_explosive/frag/toy

/obj/item/storage/box/packet/m15
	name = "\improper M15 fragmentation grenade packet"
	desc = "It contains three M15 fragmentation grenades. Handle with care."
	storage_slots = 3
	packet_icon = "m15-p"
	content_type = /obj/item/explosive/grenade/high_explosive/m15

/obj/item/storage/box/packet/m15/rubber
	name = "M15 rubber pellet grenade packet"
	desc = "It contains three M15 rubber pellet grenades, for riot control or combat exercises."
	storage_slots = 3
	packet_icon = "m15r-p"
	content_type = /obj/item/explosive/grenade/high_explosive/m15/rubber

/obj/item/storage/box/packet/sebb
	name = "\improper G2 Electroshock grenade packet"
	desc = "It contains three G2 Electroshock grenades. Handle with care."
	storage_slots = 3
	packet_icon = "sebb-p"
	content_type = /obj/item/explosive/grenade/sebb

/obj/item/storage/box/packet/bfab
	name = "\improper M51A BFAB grenade packet"
	desc = "It contains five M51A BFAB airburst-fragmentation grenades. Exercise extreme caution when using in confined spaces."
	packet_icon = "bfab-p"
	content_type = /obj/item/explosive/grenade/high_explosive/tmfrag

/obj/item/storage/box/packet/heap
	name = "\improper M38 HEAP blast grenade packet"
	desc = "It contains five M38 HEAP blast grenades."
	packet_icon = "heap-p"
	content_type = /obj/item/explosive/grenade/high_explosive/impact/heap

/obj/item/storage/box/packet/airburst_smoke
	name = "\improper M74 airburst smoke grenade packet"
	desc = "It contains three M74 airburst smoke grenades. This end towards the enemy."
	packet_icon = "hsdp-p"
	content_type = /obj/item/explosive/grenade/smokebomb/airburst

/obj/item/storage/box/packet/rmc/he
	name = "\improper R2175/A HEDP grenade packet"
	desc = "It contains three R2175/A HEDP grenades. Handle with care."
	storage_slots = 3
	packet_icon = "hedp-p"
	content_type = /obj/item/explosive/grenade/high_explosive/rmc

/obj/item/storage/box/packet/rmc/incin
	name = "\improper R2175/B HIDP grenade packet"
	desc = "It contains three R2175/B HIDP grenades. Handle with care."
	storage_slots = 3
	packet_icon = "hiam-p"
	content_type = /obj/item/explosive/grenade/incendiary/rmc
