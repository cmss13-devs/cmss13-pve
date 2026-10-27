//---------SOFT PACKS---------
/obj/item/storage/firstaid/softpack
	name = "standard-issue first-aid pack"
	desc = "A soft first-aid pack typically containing essential medical supplies for use in the field."
	icon = 'modular_pve/icons/obj/items/storage/medical.dmi'
	icon_state = "softpack"
	w_class = SIZE_MEDIUM
	var/open_state = "softpack_empty"
	use_sound = 'sound/items/zip.ogg'

/obj/item/storage/firstaid/softpack/Initialize()
	. = ..()

	if(possible_icons_full)
		icon_full = pick(possible_icons_full)
	else
		icon_full = initial(icon_state)

	update_icon()

/obj/item/storage/firstaid/softpack/update_icon()
	if(content_watchers || !length(contents))
		icon_state = open_state
	else
		icon_state = icon_full

/obj/item/storage/firstaid/softpack/fill_preset_inventory()
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_container/hypospray/autoinjector/oxycodone(src)
	new /obj/item/reagent_container/hypospray/autoinjector/dexalinp(src)

/obj/item/storage/firstaid/softpack/upp
	icon_state = "softpack_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/regular
	name = "general first-aid pack"
	desc = "A soft first-aid pack containing basic medication and equipment for use in the field."

/obj/item/storage/firstaid/softpack/regular/fill_preset_inventory()
	new /obj/item/reagent_container/blood/saline(src)
	new /obj/item/reagent_container/hypospray/autoinjector/skillless(src)
	new /obj/item/reagent_container/hypospray/autoinjector/skillless/tramadol(src)
	new /obj/item/reagent_container/hypospray/autoinjector/inaprovaline(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/splint(src)

/obj/item/storage/firstaid/softpack/regular/upp
	icon_state = "softpack_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/adv
	name = "advanced first-aid pack"
	desc = "A soft first-aid pack containing sophisticated equipment for all-around treatment in the field."
	icon_state = "softpack_darkred"

/obj/item/storage/firstaid/softpack/adv/fill_preset_inventory()
	new /obj/item/reagent_container/hypospray/autoinjector/tricord(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/reagent_container/blood/saline(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/splint(src)

/obj/item/storage/firstaid/softpack/adv/upp
	icon_state = "softpack_darkred_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/brute
	name = "brute first-aid pack"
	desc = "A soft first-aid pack containing equipment for physical treatment in the field."
	icon_state = "softpack_purple"

/obj/item/storage/firstaid/softpack/brute/fill_preset_inventory()
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/tool/surgery/surgical_line(src)
	new /obj/item/reagent_container/hypospray/autoinjector/iron(src)
	new /obj/item/reagent_container/hypospray/autoinjector/bicaridine(src)

/obj/item/storage/firstaid/softpack/brute/upp
	icon_state = "softpack_purple_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/fire
	name = "fire first-aid pack"
	desc = "A soft first-aid pack containing basic equipment for light burns treatment in the field."
	icon_state = "softpack_orange"

/obj/item/storage/firstaid/softpack/fire/fill_preset_inventory()
	new /obj/item/reagent_container/syringe/leporazine_dermaline(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_container/hypospray/autoinjector/kelotane(src)
	new /obj/item/reagent_container/hypospray/autoinjector/kelotane(src)
	new /obj/item/reagent_container/hypospray/autoinjector/skillless/tramadol(src)

/obj/item/storage/firstaid/softpack/fire/upp
	icon_state = "softpack_orange_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/burn
	name = "burn first-aid pack"
	desc = "A soft first-aid pack containing equipment for burns treatment in the field."
	icon_state = "softpack_darkorange"

/obj/item/storage/firstaid/softpack/burn/fill_preset_inventory()
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/reagent_container/hypospray/kilodermlipo(src)
	new /obj/item/tool/surgery/synthgraft(src)
	new /obj/item/reagent_container/hypospray/autoinjector/oxycodone(src)
	new /obj/item/reagent_container/hypospray/autoinjector/kelotane(src)

/obj/item/storage/firstaid/softpack/burn/upp
	icon_state = "softpack_darkorange_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/toxin
	name = "toxin first-aid pack"
	desc = "A soft first-aid pack containing equipment for toxin treatment in the field."
	icon_state = "softpack_green"

/obj/item/storage/firstaid/softpack/toxin/fill_preset_inventory()
	new /obj/item/storage/pill_bottle/antitox(src)
	new /obj/item/storage/pill_bottle/nitrogenwater(src)
	new /obj/item/storage/pill_bottle/russianRed/skillless(src)
	new /obj/item/reagent_container/blood/saline(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/reagent_container/hypospray/autoinjector/tricord(src)

/obj/item/storage/firstaid/softpack/toxin/upp
	icon_state = "softpack_green_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/o2
	name = "oxygen deprivation first-aid pack"
	desc = "A soft first-aid pack containing equipment for reoxygenating treatment in the field."
	icon_state = "softpack_blue"

/obj/item/storage/firstaid/softpack/o2/fill_preset_inventory()
	new /obj/item/reagent_container/pill/peridaxon(src)
	new /obj/item/reagent_container/pill/dexalin(src)
	new /obj/item/reagent_container/pill/dexalin(src)
	new /obj/item/reagent_container/hypospray/autoinjector/dexalinp(src)
	new /obj/item/reagent_container/blood/saline(src)
	new /obj/item/reagent_container/pill/iron(src)
	new /obj/item/reagent_container/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/firstaid/softpack/o2/upp
	icon_state = "softpack_blue_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/synth
	name = "synthetic repair pack"
	desc = "A soft first-aid pack containing equipment to repair a damaged synthetic in the field."
	icon_state = "softpack_gray"
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/reagent_container/dropper,
		/obj/item/reagent_container/pill,
		/obj/item/reagent_container/glass/bottle,
		/obj/item/reagent_container/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/reagent_container/hypospray,
		/obj/item/storage/syringe_case,
		/obj/item/tool/surgery/surgical_line,
		/obj/item/tool/surgery/synthgraft,
		/obj/item/stack/nanopaste,
		/obj/item/stack/cable_coil,
		/obj/item/tool/weldingtool,
	)

/obj/item/storage/firstaid/softpack/synth/fill_preset_inventory()
	new /obj/item/stack/nanopaste(src)
	new /obj/item/stack/nanopaste(src)
	new /obj/item/stack/nanopaste(src)
	new /obj/item/stack/nanopaste(src)
	new /obj/item/stack/cable_coil/white(src)
	new /obj/item/stack/cable_coil/white(src)
	new /obj/item/tool/weldingtool(src)

/obj/item/storage/firstaid/softpack/synth/upp
	icon_state = "softpack_gray_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/rad
	name = "radiation first-aid pack"
	desc = "A soft first-aid pack containing equipment to treat radiation exposure in the field."
	icon_state = "softpack_darkgreen"

/obj/item/storage/firstaid/softpack/rad/fill_preset_inventory()
	new /obj/item/reagent_container/pill/russianRed(src)
	new /obj/item/reagent_container/pill/russianRed(src)
	new /obj/item/reagent_container/pill/russianRed(src)
	new /obj/item/reagent_container/pill/imidazoline(src)
	new /obj/item/reagent_container/pill/antitox(src)
	new /obj/item/reagent_container/hypospray/autoinjector/bicaridine(src)

/obj/item/storage/firstaid/softpack/rad/upp
	icon_state = "softpack_darkgreen_upp"
	open_state = "softpack_empty_upp"

/obj/item/storage/firstaid/softpack/surgical
	name = "basic field surgery pack"
	desc = "A soft first-aid pack containing tools and equipment necessary for surgically tending to wounds in the field."
	icon_state = "softpack_gray"
	storage_slots = 8
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/reagent_container/dropper,
		/obj/item/reagent_container/pill,
		/obj/item/reagent_container/glass/bottle,
		/obj/item/reagent_container/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/reagent_container/hypospray,
		/obj/item/storage/syringe_case,
		/obj/item/tool/surgery,
	)

/obj/item/storage/firstaid/softpack/surgical/fill_preset_inventory()
	new /obj/item/reagent_container/hypospray/autoinjector/iron(src)
	new /obj/item/tool/surgery/surgical_line(src)
	new /obj/item/tool/surgery/synthgraft(src)
	new /obj/item/tool/surgery/cautery(src)
	new /obj/item/tool/surgery/scalpel(src)
	new /obj/item/tool/surgery/hemostat(src)
	new /obj/item/tool/surgery/retractor(src)
	new /obj/item/reagent_container/hypospray/autoinjector/oxycodone(src)

/obj/item/storage/firstaid/softpack/surgical/upp
	icon_state = "softpack_gray_upp"
	open_state = "softpack_empty_upp"

//---------PILL BOTTLES---------

/obj/item/storage/pill_bottle/imialk
	name = "\improper Imidazoline-Alkysine pill bottle"
	icon_state = "pill_canister14"
	pill_type_to_fill = /obj/item/reagent_container/pill/imialk
	maptext_label = "IA"

/obj/item/storage/pill_bottle/nitrogenwater
	name = "\improper Nitrogen-Water pill bottle"
	icon_state = "pill_canister12"
	pill_type_to_fill = /obj/item/reagent_container/pill/nitrogenwater
	maptext_label = "NW"

/obj/item/storage/pill_bottle/merabica
	name = "\improper Meralyne-Bicaridine pill bottle"
	icon_state = "pill_canister8"
	pill_type_to_fill = /obj/item/reagent_container/pill/merabica
	maptext_label = "MB"

/obj/item/storage/pill_bottle/dexalinplus
	name = "\improper Dexalin+ pill bottle"
	icon_state = "pill_canister13"
	pill_type_to_fill = /obj/item/reagent_container/pill/dexalinplus
	maptext_label = "D+"

/obj/item/storage/pill_bottle/keloderm
	name = "\improper Kelotane-Dermaline pill bottle"
	icon_state = "pill_canister15"
	pill_type_to_fill = /obj/item/reagent_container/pill/keloderm
	maptext_label = "KD"

/obj/item/storage/pill_bottle/iron
	name = "\improper Iron pill bottle"
	icon_state = "pill_canister4"
	pill_type_to_fill = /obj/item/reagent_container/pill/iron
	maptext_label = "FE"
