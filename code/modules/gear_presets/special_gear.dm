
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
	name = "Green Banner Ambusher"

/datum/equipment_preset/other/ecoterrorist/ambusher/load_gear(mob/living/carbon/human/new_human)
	var/obj/item/facepaint/asphalt/paint = new()
	paint.paint_face(new_human, new_human)
	qdel(paint)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/bone(new_human), WEAR_WAIST)
	qdel(new_human.wear_id)

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
	ai_looting = FALSE

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
