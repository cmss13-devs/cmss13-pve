
/datum/equipment_preset/jovian
	name = "Jovian Insurgent"
	languages = list(LANGUAGE_ENGLISH)
	assignment = "##MODIFIED##"
	rank = "Jovian Insurgent"
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	faction = FACTION_CLF
	flags = EQUIPMENT_PRESET_EXTRA
	origin_override = ORIGIN_CIVILIAN
	idtype = /obj/item/card/id/data
	skills = /datum/skills/pfc

/datum/equipment_preset/jovian/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/color/yellow(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)
	//head
	var/color = pick(1, 2, 3)
	switch(color)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/orange(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/orange(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/red(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/red(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/yellow(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/yellow(new_human), WEAR_JACKET)
	//uniform

	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/mar40(new_human), WEAR_J_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/mar40/carbine(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)

/datum/equipment_preset/jovian/sniper
	name = "Jovian Sniper"

/datum/equipment_preset/jovian/sniper/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/color/yellow(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)
	//head
	var/color = pick(1, 2, 3)
	switch(color)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/orange(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/orange(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/red(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/red(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/yellow(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/yellow(new_human), WEAR_JACKET)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/l42a/abr40(new_human), WEAR_J_STORE)

	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/svd(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)

/datum/equipment_preset/jovian/rocket
	name = "Jovian RPG"

/datum/equipment_preset/jovian/rocket/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/color/yellow(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)
	//head
	var/color = pick(1, 2, 3)
	switch(color)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/orange(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/orange(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/red(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/red(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/yellow(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/yellow(new_human), WEAR_JACKET)
	//uniform

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/launcher/rocket/upp/incen(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/m1911(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)

/datum/equipment_preset/jovian/shotgunner
	name = "Jovian Shotgunner"

/datum/equipment_preset/jovian/shotgunner/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/color/yellow(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)
	//head
	var/color = pick(1, 2, 3)
	switch(color)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/orange(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/orange(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/red(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/red(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/pressure/yellow(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/space/pressure/yellow(new_human), WEAR_JACKET)
	//uniform

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/dual_tube/cmb/slug(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	for(var/i in 1 to 5)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)

/datum/equipment_preset/other/ecoterrorist
	name = "Green Banner Movement"
	languages = list(LANGUAGE_ENGLISH)
	assignment = "##MODIFIED##"
	rank = "Green Banner"
	faction = FACTION_ECOTERROR
	flags = EQUIPMENT_PRESET_EXTRA
	origin_override = ORIGIN_CIVILIAN
	idtype = /obj/item/card/id
	skills = /datum/skills/pfc
	faction_group = list(FACTION_ECOTERROR)
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/other/ecoterrorist/load_name(mob/living/carbon/human/new_human, randomise)
	..()
	new_human.h_style = "Bald"
	new_human.f_style = "Shaved"
	new_human.undershirt = null
	new_human.underwear = null
	new_human.regenerate_icons()
	var/obj/limb/head = new_human.get_limb("head")
	var/obj/item/implant/gmb/implant = new()
	head.embed(implant, 1)


/datum/equipment_preset/other/ecoterrorist/soldier
	name = "Green Banner Cultist"

/datum/equipment_preset/other/ecoterrorist/soldier/load_gear(mob/living/carbon/human/new_human)
	var/uniform = pick(/obj/item/clothing/under/colonist/boilersuit/cyan, /obj/item/clothing/under/colonist/boilersuit/darkblue, /obj/item/clothing/under/colonist/boilersuit/khaki, /obj/item/clothing/under/colonist/boilersuit/grey)
	new_human.equip_to_slot_or_del(new uniform(new_human), WEAR_BODY)

	var/mask = rand(1, 3)
	switch(mask)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/echo(new_human), WEAR_FACE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather(new_human), WEAR_FACE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
	//head
	if(prob(66))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/echo(new_human), WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/ua_riot(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/camocover/desert/nohole, WEAR_IN_HELMET)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/echo, WEAR_IN_HELMET)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	if(prob(75))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/ballistic(new_human), WEAR_JACKET)
	else
		var/jacket = rand(1, 3)
		switch(jacket)
			if(1)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_green(new_human), WEAR_JACKET)
			if(2)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_gray(new_human), WEAR_JACKET)
			if(3)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	var/gun = rand(1, 4)
	switch(gun)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/mar40(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended(new_human), WEAR_IN_BELT)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m20a(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/fp9000(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000(new_human), WEAR_IN_BELT)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/boltaction/noscope(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/boltaction(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/boltaction(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/boltaction(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/boltaction(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/joe(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/skillless(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_IN_BACK)


/datum/equipment_preset/other/ecoterrorist/flamer
	name = "Green Banner Flamer"

/datum/equipment_preset/other/ecoterrorist/flamer/load_gear(mob/living/carbon/human/new_human)
	var/uniform = pick(/obj/item/clothing/under/colonist/boilersuit/cyan, /obj/item/clothing/under/colonist/boilersuit/darkblue, /obj/item/clothing/under/colonist/boilersuit/khaki, /obj/item/clothing/under/colonist/boilersuit/grey)
	new_human.equip_to_slot_or_del(new uniform(new_human), WEAR_BODY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/ua_riot(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/echo, WEAR_IN_HELMET)

	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/smoke/acid(new_human), WEAR_WAIST)
	var/jacket = rand(1, 2)
	switch(jacket)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_green(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_gray(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/acid(new_human), WEAR_J_STORE)

	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/joe(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/skillless(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_IN_BACK)

/datum/equipment_preset/other/ecoterrorist/ambusher
	name = "Green Banner Ambusher (Asphalt)"

/datum/equipment_preset/other/ecoterrorist/ambusher/load_gear(mob/living/carbon/human/new_human)
	var/obj/item/facepaint/asphalt/paint = new()
	paint.paint_face(new_human, new_human)
	qdel(paint)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/bone(new_human), WEAR_WAIST)
	qdel(new_human.wear_id)
	new_human.plane = -7

/datum/equipment_preset/other/ecoterrorist/ambusher/sand
	name = "Green Banner Ambusher (Sand)"

/datum/equipment_preset/other/ecoterrorist/ambusher/sand/load_gear(mob/living/carbon/human/new_human)
	var/obj/item/facepaint/sand/paint = new()
	paint.paint_face(new_human, new_human)
	qdel(paint)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/bone(new_human), WEAR_WAIST)
	qdel(new_human.wear_id)
	new_human.plane = -7

/datum/equipment_preset/other/ecoterrorist/shotgunner
	name = "Green Banner Shotgunner"

/datum/equipment_preset/other/ecoterrorist/shotgunner/load_gear(mob/living/carbon/human/new_human)
	var/uniform = pick(/obj/item/clothing/under/colonist/boilersuit/cyan, /obj/item/clothing/under/colonist/boilersuit/darkblue, /obj/item/clothing/under/colonist/boilersuit/khaki, /obj/item/clothing/under/colonist/boilersuit/grey)
	new_human.equip_to_slot_or_del(new uniform(new_human), WEAR_BODY)

	var/mask = rand(1, 3)
	switch(mask)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/echo(new_human), WEAR_FACE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather(new_human), WEAR_FACE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
	//head
	if(prob(66))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/echo(new_human), WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/ua_riot(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/camocover/desert/nohole, WEAR_IN_HELMET)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/echo, WEAR_IN_HELMET)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	if(prob(75))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/ballistic(new_human), WEAR_JACKET)
	else
		var/jacket = rand(1, 3)
		switch(jacket)
			if(1)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_green(new_human), WEAR_JACKET)
			if(2)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_gray(new_human), WEAR_JACKET)
			if(3)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	var/gun = rand(1, 3)
	switch(gun)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/mou53(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/sawn(new_human), WEAR_J_STORE)

		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/with_stock(new_human), WEAR_J_STORE)
	for(var/i in 1 to 5)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/incendiary(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/joe(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/skillless(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_IN_BACK)

/datum/equipment_preset/other/ecoterrorist/sniper
	name = "Green Banner Sniper"

/datum/equipment_preset/other/ecoterrorist/sniper/load_gear(mob/living/carbon/human/new_human)
	var/uniform = pick(/obj/item/clothing/under/colonist/boilersuit/cyan, /obj/item/clothing/under/colonist/boilersuit/darkblue, /obj/item/clothing/under/colonist/boilersuit/khaki, /obj/item/clothing/under/colonist/boilersuit/grey)
	new_human.equip_to_slot_or_del(new uniform(new_human), WEAR_BODY)


	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/echo(new_human), WEAR_FACE)


	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/echo(new_human), WEAR_HEAD)

	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	var/jacket = rand(1, 3)
	switch(jacket)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_green(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_gray(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/l42a/abr40(new_human), WEAR_J_STORE)

	for(var/i in 1 to 5)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/l42a/abr40(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/joe(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/skillless(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_IN_BACK)

/datum/equipment_preset/other/ecoterrorist/grenadier
	name = "Green Banner Grenadier"
	ai_disallow_looting = TRUE

/datum/equipment_preset/other/ecoterrorist/grenadier/load_gear(mob/living/carbon/human/new_human)
	var/uniform = pick(/obj/item/clothing/under/colonist/boilersuit/cyan, /obj/item/clothing/under/colonist/boilersuit/darkblue, /obj/item/clothing/under/colonist/boilersuit/khaki, /obj/item/clothing/under/colonist/boilersuit/grey)
	new_human.equip_to_slot_or_del(new uniform(new_human), WEAR_BODY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/echo(new_human), WEAR_FACE)


	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/echo(new_human), WEAR_HEAD)

	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/ballistic(new_human), WEAR_JACKET)


	for(var/i in 1 to 5)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/acid(new_human), WEAR_IN_BACK)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/joe(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/skillless(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_IN_BACK)

/datum/equipment_preset/upp/revanchist
	faction = FACTION_REVANCHISTS
	faction_group = list(FACTION_REVANCHISTS)

/datum/equipment_preset/upp/revanchist/add_upp_uniform(mob/living/carbon/human/new_human)
	var/pick_uniform = pick(/obj/item/clothing/under/marine/veteran/UPP, /obj/item/clothing/under/marine/veteran/UPP/boiler, /obj/item/clothing/under/marine/veteran/UPP/naval)
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new pick_uniform()
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)

/datum/equipment_preset/upp/revanchist/rifleman
	name = "Revanchist (Type 71)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_SQUAD_MARINE
	role_comm_title = "RFN"
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_UE1 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc
	access = list(ACCESS_UPP_GENERAL)

/datum/equipment_preset/upp/revanchist/rifleman/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp/territorial, WEAR_L_EAR)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava/threehole, WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp/black, WEAR_HEAD)
	//uniform
	add_upp_uniform(new_human)
	//jacket
	var/pocket_item = pick(/obj/item/device/radio, /obj/item/tool/crowbar/red, /obj/item/stack/medical/ointment, /obj/item/device/binoculars/range/designator/upp, /obj/item/explosive/grenade/smokebomb/upp)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/light/black, WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/black, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/preloaded, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/scarce, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new pocket_item, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/prop, WEAR_L_STORE)

/datum/equipment_preset/upp/revanchist/rifleman/cryo
	name = "Revanchist (Cryo)"

/datum/equipment_preset/upp/revanchist/rifleman/cryo/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"

	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp/territorial, WEAR_L_EAR)
	//head
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp/black, WEAR_HEAD)
	//uniform
	add_upp_uniform(new_human)
	//jacket
	var/pocket_item = pick(/obj/item/device/radio, /obj/item/tool/crowbar/red, /obj/item/stack/medical/ointment, /obj/item/device/binoculars/range/designator/upp, /obj/item/explosive/grenade/smokebomb/upp)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/light/black, WEAR_JACKET)

	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/preloaded, WEAR_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/scarce, WEAR_WAIST)
		else
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_WAIST)
	else
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92, WEAR_WAIST)
		else
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73, WEAR_WAIST)
	//limbs
	var/list/feet = pick(/obj/item/clothing/shoes/marine/upp, /obj/item/clothing/shoes/marine/upp/guard, /obj/item/clothing/shoes/slippers_worn, /obj/item/clothing/shoes/sandal)
	if(prob(90))
		new_human.equip_to_slot_or_del(new feet, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new pocket_item, WEAR_R_STORE)

/datum/equipment_preset/upp/revanchist/sl
	name = "Revanchist SL (Revolver)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_SQUAD_TEAM_LEADER
	role_comm_title = "SL"
	rank = JOB_SQUAD_TEAM_LEADER
	paygrades = list(PAY_SHORT_UE4 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc
	access = list(ACCESS_UPP_GENERAL)

/datum/equipment_preset/upp/revanchist/sl/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp/territorial, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	add_upp_uniform(new_human)
	//jacket
	var/pocket_item = pick(/obj/item/device/radio, /obj/item/tool/crowbar/red, /obj/item/stack/medical/ointment, /obj/item/device/binoculars/range/designator/upp, /obj/item/explosive/grenade/smokebomb/upp)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/light/black, WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/black, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new pocket_item, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/prop, WEAR_L_STORE)

/datum/equipment_preset/upp/revanchist/shotgunner
	name = "Revanchist (Shotgun)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_SQUAD_MARINE
	role_comm_title = "SHT"
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc
	access = list(ACCESS_UPP_GENERAL)

/datum/equipment_preset/upp/revanchist/shotgunner/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp/territorial, WEAR_L_EAR)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava/threehole, WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp/black, WEAR_HEAD)
	//uniform
	add_upp_uniform(new_human)
	//jacket
	var/pocket_item = pick(/obj/item/device/radio, /obj/item/tool/crowbar/red, /obj/item/stack/medical/ointment, /obj/item/device/binoculars/range/designator/upp, /obj/item/explosive/grenade/smokebomb/upp)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/black, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/type23/unloaded, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp, WEAR_WAIST)
	for(var/i in 1 to 3)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/buckshot(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new pocket_item, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/prop, WEAR_L_STORE)

/datum/equipment_preset/upp/revanchist/flamer
	name = "Revanchist (Flamer)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_SQUAD_MARINE
	role_comm_title = "FLM"
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc
	access = list(ACCESS_UPP_GENERAL)

/datum/equipment_preset/upp/revanchist/flamer/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	//face
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/military/upp, WEAR_FACE)
	//head
	//uniform
	add_upp_uniform(new_human)
	//jacket
	var/pocket_item = pick(/obj/item/device/radio, /obj/item/tool/crowbar/red, /obj/item/stack/medical/ointment, /obj/item/device/binoculars/range/designator/upp, /obj/item/explosive/grenade/smokebomb/upp)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/black, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/upp/weak, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/upp/weak, WEAR_WAIST)

	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new pocket_item, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/prop, WEAR_L_STORE)

/datum/equipment_preset/upp/revanchist/machinegunner
	name = "Revanchist (Machinegunner)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = "Machinegunner"
	role_comm_title = "MG"
	rank = JOB_SQUAD_SMARTGUN_UPP
	paygrades = list(PAY_SHORT_UE3 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/smartgunner
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_MACHINEGUN)

/datum/equipment_preset/upp/revanchist/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp/territorial, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava/threehole, WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp/black, WEAR_HEAD)
	//uniform
	add_upp_uniform(new_human)
	//jacket
	var/pocket_item = pick(/obj/item/device/radio, /obj/item/tool/crowbar/red, /obj/item/stack/medical/ointment, /obj/item/device/binoculars/range/designator/upp, /obj/item/explosive/grenade/smokebomb/upp)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/black, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pkp/ap, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/upp, WEAR_WAIST)
	for(var/i in 1 to 2)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp/ap(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new pocket_item, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/prop, WEAR_L_STORE)
	//waist
	var/uppvetsidearm = prob(50) ? /obj/item/storage/belt/gun/type47/t73 : /obj/item/storage/belt/gun/type47/np92
	new_human.equip_to_slot_or_del(new uppvetsidearm, WEAR_WAIST) // 50/50 np92 or t73