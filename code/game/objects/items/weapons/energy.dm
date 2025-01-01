/obj/item/weapon/energy
	var/active = 0
	flags_atom = FPRINT|QUICK_DRAWABLE|NOBLOODY

/obj/item/weapon/energy/axe
	name = "energy axe"
	desc = "An energised battle axe."
	icon_state = "axe0"
	force = MELEE_FORCE_VERY_STRONG
	throwforce = MELEE_FORCE_NORMAL
	throw_speed = SPEED_FAST
	throw_range = 5
	w_class = SIZE_MEDIUM
	flags_atom = FPRINT|CONDUCT|QUICK_DRAWABLE|NOBLOODY
	flags_item = NOSHIELD

	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	sharp = IS_SHARP_ITEM_BIG
	edge = 1

/obj/item/weapon/energy/axe/attack_self(mob/user)
	..()

	active = !active
	if(active)
		to_chat(user, SPAN_NOTICE(" The axe is now energised."))
		force = 150
		icon_state = "axe1"
		w_class = SIZE_HUGE
		heat_source = 3500
	else
		to_chat(user, SPAN_NOTICE(" The axe can now be concealed."))
		force = 40
		icon_state = "axe0"
		w_class = SIZE_HUGE
		heat_source = 0
	add_fingerprint(user)



/obj/item/weapon/energy/sword
	name = "energy sword"
	desc = "May the force be within you."
	icon_state = "sword0"
	force = 3
	throwforce = 5
	throw_speed = SPEED_FAST
	throw_range = 5
	w_class = SIZE_SMALL
	flags_atom = FPRINT|QUICK_DRAWABLE|NOBLOODY
	flags_item = NOSHIELD

	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	sharp = IS_SHARP_ITEM_BIG
	edge = 1
	var/base_sword_icon = "sword"
	var/sword_color

/obj/item/weapon/energy/sword/IsShield()
	if(active)
		return 1
	return 0

/obj/item/weapon/energy/sword/New()
	if(!sword_color)
		sword_color = pick("red","blue","green","purple")

/obj/item/weapon/energy/sword/attack_self(mob/living/user)
	..()

	active = !active
	if (active)
		force = 30
		heat_source = 3500
		if(base_sword_icon != "sword")
			icon_state = "[base_sword_icon]1"
		else
			icon_state = "sword[sword_color]"
		w_class = SIZE_LARGE
		playsound(user, 'sound/weapons/saberon.ogg', 25, 1)
		to_chat(user, SPAN_NOTICE(" [src] is now active."))

	else
		force = 3
		heat_source = 0
		icon_state = "[base_sword_icon]0"
		w_class = SIZE_SMALL
		playsound(user, 'sound/weapons/saberoff.ogg', 25, 1)
		to_chat(user, SPAN_NOTICE(" [src] can now be concealed."))

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand(0)
		H.update_inv_r_hand()

	add_fingerprint(user)
	return


/obj/item/weapon/energy/sword/pirate
	name = "energy cutlass"
	desc = "Arrrr matey."
	icon_state = "cutlass0"
	base_sword_icon = "cutlass"

/obj/item/weapon/energy/sword/green
	sword_color = "green"


/obj/item/weapon/energy/sword/green/attack_self()
	..()
	force = active ? 80 : 3

/obj/item/weapon/energy/sword/red
	sword_color = "red"

/obj/structure/flora/pottedplant/pinksakura
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-34"

/obj/structure/sign/safety/bathunisex/fancy
	icon = 'icons/obj/signs.dmi'
	icon_state = "bathroom_unisex"

/obj/item/weapon/gun/energy/overhaul_plasmacutter
	name = "overhauled plasma cutter"
	desc = "A rock cutter that uses bursts of hot plasma. You could use it to cut limbs off of xenos! Or, you know, mine stuff. This one has had a milled focusing lens attached to it, and the power limiter removed, making it viable as a laser weapon at short ranges."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "plasmacutter"
	item_state = "gun"
	charge_cost = 50
	muzzle_flash = "muzzle_laser"
	fire_sound = 'sound/weapons/Laser4.ogg'
	w_class = SIZE_LARGE
	gun_category = GUN_CATEGORY_SMG
	flags_equip_slot = SLOT_WAIST|SLOT_BACK
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ONE_HAND_WIELDED
	flags_item = IGNITING_ITEM
	ammo = /datum/ammo/energy/overhaul_plasmacutter
	attachable_allowed = null
	has_charge_meter = FALSE
	start_automatic = TRUE

/obj/item/weapon/gun/energy/overhaul_plasmacutter/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_SMG)
	set_burst_delay(FIRE_DELAY_TIER_SMG)
	set_burst_amount(0)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	scatter = SCATTER_AMOUNT_TIER_7
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_4
	recoil_unwielded = RECOIL_AMOUNT_TIER_3

/datum/ammo/energy/overhaul_plasmacutter
	name = "laser blast"
	icon_state = "laser_new"
	flags_ammo_behavior = AMMO_LASER
	accurate_range = 6
	max_range = 8
	damage = 70
	shell_speed = AMMO_SPEED_TIER_1
	penetration = ARMOR_PENETRATION_TIER_6
	damage_armor_punch = 1

/datum/ammo/energy/overhaul_plasmacutter/on_hit_mob(mob/living/M, obj/projectile/P)
	..()
	if(prob(80)) //small chance for one to ignite on hit
		M.fire_act()

/area/freeship
	icon = 'icons/turf/area_almayer.dmi'
	icon_state = "almayer"
	ceiling = CEILING_METAL
	powernet_name = "freeship"
	sound_environment = SOUND_ENVIRONMENT_ROOM
	soundscape_interval = 30
	ambience_exterior = AMBIENCE_ALMAYER
	ceiling_muffle = FALSE

/area/freeship/afthallway
	name = "Aft Hallway"
	icon_state = "aft"

/area/freeship/aftportmaint
	name = "Aft Port Maintenance"
	icon_state = "upperhull"

/area/freeship/aftstarmaint
	name = "Aft Starboard Maintenance"
	icon_state = "upperhull"

/area/freeship/atmos
	name = "Atmospherics"

	icon_state = "selfdestruct"

/area/freeship/atmosconnect
	name = "Atmospherics Connector"
	icon = 'icons/turf/areas.dmi'
	icon_state = "atmos"

/area/freeship/powerstore
	name = "Power Stores"
	icon_state = "lowerengineering"

/area/freeship/bridgeland
	name = "Bridge Landing"
	icon_state = "airoom"

/area/freeship/bridge
	name = "Bridge"
	icon_state = "cic"

/area/freeship/combustinternals
	name = "Combustion Internals"
	icon = 'icons/turf/areas.dmi'
	icon_state = "engine"
	color = "#ffe28a"


/area/freeship/combustchamber
	name = "Combustion Chamber"
	icon = 'icons/turf/areas.dmi'
	icon_state = "engine"

/area/freeship/connector
	name = "Connector Hallway"
	icon_state = "lifeboat_pump"

/area/freeship/cryo
	name = "Cryogenics"
	icon_state = "cryo"

/area/freeship/disposal
	name = "Disposals"
	icon = 'icons/turf/areas.dmi'
	icon_state = "disposal"

/area/freeship/equipstorage
	name = "Equipment Storage"
	icon = 'icons/turf/areas.dmi'
	icon_state = "primarystorage"

/area/freeship/extconnector
	name = "Exterior Connector"
	icon = 'icons/turf/areas.dmi'
	icon_state = "unknown"

/area/freeship/extlights
	name = "Exterior Lights"
	icon = 'icons/turf/areas.dmi'
	icon_state = "unknown"

/area/freeship/foreairlock
	name = "Fore Airlock"
	icon_state = "fore"

/area/freeship/foremaint
	name = "Fore Maintenance"
	icon_state = "upperhull"

/area/freeship/foreportmaint
	name = "Fore Port Maintenance"
	icon_state = "upperhull"

/area/freeship/gasstorage
	name = "Gas Equipment Storage"
	icon = 'icons/turf/hybrisareas.dmi'
	icon_state = "power0"

/area/freeship/hanger
	name = "Hangar"
	icon_state = "hangar"


/area/freeship/eva
	name = "EVA Equipment Storage"
	icon_state = "exoarmor"

/area/freeship/lounge
	name = "Lounge"
	icon_state = "gruntrnr"

/area/freeship/medical
	name = "Medical Bay"
	icon_state = "medical"

/area/freeship/cabins
	name = "Crew Cabins"
	icon = 'icons/turf/areas.dmi'
	icon_state = "crew_quarters"

/area/freeship/prison
	name = "Prisoner Management"
	icon_state = "brig"

/area/freeship/reactoroverlook
	name = "Reactor Overlook"
	icon_state = "workshop"

/obj/item/ammo_box/rounds/boltaction
	name = "\improper Basira-Armstrong ammunition box (6.5mm)"
	desc = "A 6.5mm ammunition box. Used to refill Basira-Armstrong magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_reg"
	default_ammo = /datum/ammo/bullet/sniper/crude
	caliber = "6.5mm"
	bullet_amount = 400
	max_bullet_amount = 400

#define DROPSHIP_FREESHIP "dropship_freeship"
#define FREESHIP_LZ "freeship lz"

/datum/map_template/shuttle/freeship
	name = "Little Boy"
	shuttle_id = DROPSHIP_FREESHIP

/obj/docking_port/mobile/marine_dropship/freeship
	name = "Little Boy"
	id = DROPSHIP_FREESHIP
	width = 5
	height = 7
	dwidth = 4
	dheight = 8


/area/shuttle/freeship
	name = "shuttle Little Boy"
	icon_state = "shuttlered"
	base_muffle = MUFFLE_HIGH
	soundscape_interval = 30
	is_landing_zone = TRUE
	ceiling = CEILING_REINFORCED_METAL

/area/shuttle/freeship/Enter(atom/movable/O, atom/oldloc)
	if(istype(O, /obj/structure/barricade))
		return FALSE
	return TRUE

#define JOB_SQUAD_MARINE_FREESHIP "Civilian"

/datum/skills/civilian/freeship
	name = "Civilian"
	additional_skills = list(
		SKILL_ENGINEER = SKILL_ENGINEER_ENGI,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_FIREARMS = SKILL_FIREARMS_TRAINED,
		SKILL_CQC = SKILL_CQC_SKILLED,
		SKILL_POWERLOADER = SKILL_POWERLOADER_MASTER,
		SKILL_VEHICLE = SKILL_VEHICLE_SMALL,
	)

/datum/equipment_preset/colonist/freeship
	skills = /datum/skills/civilian/freeship

/datum/job/civilian/freeship
	gear_preset = /datum/equipment_preset/colonist/freeship

/obj/item/explosive/grenade/metal_foam/iron
	foam_metal_type = 2

/obj/item/storage/belt/grenade/large/metalfoam/fill_preset_inventory()
	new /obj/item/explosive/grenade/custom/metal_foam(src)
	new /obj/item/explosive/grenade/custom/metal_foam(src)
	new /obj/item/explosive/grenade/custom/metal_foam(src)
	new /obj/item/explosive/grenade/custom/metal_foam(src)
	new /obj/item/explosive/grenade/custom/metal_foam(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/high_explosive/holy_hand_grenade(src)
	new /obj/item/explosive/grenade/nerve_gas/xeno(src)
	new /obj/item/explosive/grenade/nerve_gas/xeno(src)
	new /obj/item/explosive/grenade/high_explosive/super(src)
	new /obj/item/explosive/grenade/high_explosive/super(src)
	new /obj/item/explosive/grenade/high_explosive/super(src)
	new /obj/item/explosive/grenade/high_explosive/super(src)
	new /obj/item/explosive/grenade/high_explosive/super(src)
	new /obj/item/explosive/grenade/high_explosive/super(src)


/obj/effect/spawner/random/trash
	name = "Random Trash"
	desc = "This is random trash"
	icon_state = "random_kit"

/obj/effect/spawner/random/trash/item_to_spawn()
	return pick(/obj/item/trash/barcardine,\
				/obj/item/trash/boonie,\
				/obj/item/trash/burger,\
				/obj/item/trash/buritto,\
				/obj/item/trash/c_tube,\
				/obj/item/trash/candy,\
				/obj/item/trash/ceramic_plate,\
				/obj/item/trash/cheesie,\
				/obj/item/trash/chunk,\
				/obj/item/trash/chunk/hunk,\
				/obj/item/trash/cigbutt,\
				/obj/item/trash/cigbutt/bcigbutt,\
				/obj/item/trash/cigbutt/cigarbutt,\
				/obj/item/trash/cigbutt/ucigbutt,\
				/obj/item/trash/crushed_cup,\
				/obj/item/trash/eat,\
				/obj/item/trash/hotdog,\
				/obj/item/trash/kepler,\
				/obj/item/trash/kepler/flamehot,\
				/obj/item/trash/liquidfood,\
				/obj/item/trash/pistachios,\
				/obj/item/trash/plate,\
				/obj/item/trash/popcorn,\
				/obj/item/trash/candle)


/obj/structure/sign/double/map
	name = "map"
	desc = "A framed map."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/monkey_painting
	name = "\improper Mr. Deempisi portrait"
	desc = "Under the painting a plaque reads: 'While the meat grinder may not have spared you, fear not. Not one part of you has gone to waste... You were delicious.'"
	icon_state = "monkey_painting"

/obj/structure/sign/warning
	name = "\improper WARNING"
	icon_state = "securearea"

/obj/structure/sign/warning/detailed
	icon_state = "securearea2"

/obj/structure/sign/warning/New()
	..()
	desc = "A warning sign which reads '[sanitize(name)]'."

/obj/structure/sign/thera
	icon_state = "thera"
	name = "\improper THERA SAFE ROOM"
	desc = "A detailed sign that reads 'Temporary Housing for Emergency, Radioactive, Atmospheric. This location is unsuitable for extended Habitation. Do not shelter here beyond immediate need.'"

/obj/structure/sign/warning/airlock
	name = "\improper EXTERNAL AIRLOCK"
	icon_state = "doors"

/obj/structure/sign/warning/biohazard
	name = "\improper BIOHAZARD"
	icon_state = "bio"

/obj/structure/sign/warning/bomb_range
	name = "\improper BOMB RANGE"
	icon_state = "blast"

/obj/structure/sign/warning/caution
	name = "\improper CAUTION"

/obj/structure/sign/warning/compressed_gas
	name = "\improper COMPRESSED GAS"
	icon_state = "hikpa"

/obj/structure/sign/warning/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	icon_state = "deathsposal"

/obj/structure/sign/warning/docking_area
	name = "\improper KEEP CLEAR: DOCKING AREA"

/obj/structure/sign/warning/engineering_access
	name = "\improper ENGINEERING ACCESS"

/obj/structure/sign/warning/fall
	name = "\improper FALL HAZARD"
	icon_state = "falling"

/obj/structure/sign/warning/fire
	name = "\improper DANGER: FIRE"
	icon_state = "fire"

/obj/structure/sign/warning/high_voltage
	name = "\improper HIGH VOLTAGE"
	icon_state = "shock"

/obj/structure/sign/warning/hot_exhaust
	name = "\improper HOT EXHAUST"
	icon_state = "fire"

/obj/structure/sign/warning/internals_required
	name = "\improper INTERNALS REQUIRED"

/obj/structure/sign/warning/lethal_turrets
	name = "\improper LETHAL TURRETS"
	icon_state = "turrets"

/obj/structure/sign/warning/lethal_turrets/New()
	..()
	desc += " Enter at own risk!"

/obj/structure/sign/warning/mail_delivery
	name = "\improper MAIL DELIVERY"
	icon_state = "mail"

/obj/structure/sign/warning/moving_parts
	name = "\improper MOVING PARTS"
	icon_state = "movingparts"

/obj/structure/sign/warning/nosmoking_1
	name = "\improper NO SMOKING"
	icon_state = "nosmoking"

/obj/structure/sign/warning/nosmoking_2
	name = "\improper NO SMOKING"
	icon_state = "nosmoking2"

/obj/structure/sign/warning/nosmoking_burned
	name = "\improper NO SMOKING"
	icon_state = "nosmoking2_b"

/obj/structure/sign/warning/nosmoking_burned/Initialize()
	. = ..()
	desc += " It looks charred."

/obj/structure/sign/warning/smoking
	name = "\improper SMOKING"
	icon_state = "smoking"

/obj/structure/sign/warning/smoking/Initialize()
	. = ..()
	desc += " Hell yeah."

/obj/structure/sign/warning/pods
	name = "\improper ESCAPE PODS"
	icon_state = "podsnorth"

/obj/structure/sign/warning/pods/south
	name = "\improper ESCAPE PODS"
	icon_state = "podssouth"

/obj/structure/sign/warning/pods/east
	name = "\improper ESCAPE PODS"
	icon_state = "podseast"

/obj/structure/sign/warning/pods/west
	name = "\improper ESCAPE PODS"
	icon_state = "podswest"

/obj/structure/sign/warning/radioactive
	name = "\improper RADIOACTIVE AREA"
	icon_state = "radiation"

/obj/structure/sign/warning/secure_area
	name = "\improper SECURE AREA"

/obj/structure/sign/warning/secure_area/armory
	name = "\improper ARMORY"
	icon_state = "armory"

/obj/structure/sign/warning/server_room
	name = "\improper SERVER ROOM"
	icon_state = "server"

/obj/structure/sign/warning/siphon_valve
	name = "\improper SIPHON VALVE"

/obj/structure/sign/warning/vacuum
	name = "\improper HARD VACUUM AHEAD"
	icon_state = "space"

/obj/structure/sign/warning/vent_port
	name = "\improper EJECTION/VENTING PORT"

/obj/structure/sign/redcross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "redcross"

/obj/structure/sign/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross"

/obj/structure/sign/bluecross_1
	name = "infirmary"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross"

/obj/structure/sign/bluecross_2
	name = "infirmary"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross2"

/obj/structure/sign/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/goldenplaque/security
	name = "motivational plaque"
	desc = "A plaque engraved with a generic motivational quote and picture. ' Greater love hath no man than this, that a man lay down his life for his friends. John 15:13 "

/obj/structure/sign/goldenplaque/medical
	name = "medical certificate"
	desc = "A picture next to a long winded description of medical certifications and degrees."

/obj/structure/sign/kiddieplaque
	name = "\improper AI developers plaque"
	desc = "An extremely long list of names and job titles and a picture of the design team responsible for building this AI Core."
	icon_state = "kiddieplaque"

/obj/structure/sign/atmosplaque
	name = "\improper engineering memorial plaque"
	desc = "This plaque memorializes those engineers and technicians who made the ultimate sacrifice to save their vessel and its crew."
	icon_state = "atmosplaque"

/obj/structure/sign/emergonly
	name = "\improper EMERGENCY ONLY"
	desc = "A warning sign which reads 'EMERGENCY ONLY!'."
	icon_state = "emerg"

/obj/structure/sign/noidle
	name = "\improper NO IDLING"
	desc = "A warning sign which reads 'NO IDLING!'."
	icon_state = "noidle"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/warning/science
	name = "\improper SCIENCE!"
	icon_state = "science"

/obj/structure/sign/warning/science/anomalous_materials
	name = "\improper ANOMALOUS MATERIALS"

/obj/structure/sign/warning/science/mass_spectrometry
	name = "\improper MASS SPECTROMETRY"

/obj/structure/sign/science_1
	name = "\improper RESEARCH WING"
	desc = "A sign labelling the research wing."
	icon_state = "science"

/obj/structure/sign/science_2
	name = "\improper RESEARCH"
	desc = "A sign labelling an area where research is performed."
	icon_state = "science2"

/obj/structure/sign/xenobio_1
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio"

/obj/structure/sign/xenobio_2
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio2"

/obj/structure/sign/xenobio_3
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio3"

/obj/structure/sign/xenobio_4
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio4"

/obj/structure/sign/xenoarch
	name = "\improper XENOARCHAEOLOGY"
	desc = "A sign labelling an area as a place where xenoarchaeological finds are researched."
	icon_state = "xenobio4"

/obj/structure/sign/chemistry
	name = "\improper CHEMISTRY"
	desc = "A sign labelling an area containing chemical equipment."
	icon_state = "chemistry"

/obj/structure/sign/xenoflora
	name = "\improper XENOFLORA"
	desc = "A sign labelling an area as a place where xenobiological plants are researched."
	icon_state = "hydro4"

/obj/structure/sign/botany
	name = "\improper BOTANY"
	desc = "A warning sign which reads 'BOTANY!'."
	icon_state = "hydro3"

/obj/structure/sign/hydro
	name = "\improper HYDROPONICS"
	desc = "A sign labelling an area as a place where plants are grown."
	icon_state = "hydro"

/obj/structure/sign/hydrostorage
	name = "\improper HYDROPONICS STORAGE"
	desc = "A sign labelling an area as a place where plant growing supplies are kept."
	icon_state = "hydro3"

/obj/structure/sign/directions
	name = "direction sign"
	desc = "A direction sign, claiming to know the way."
	icon_state = "direction"

/obj/structure/sign/directions/New()
	..()
	desc = "A direction sign, pointing out which way \the [src] is."

/obj/structure/sign/directions/science
	name = "\improper Research Division"
	icon_state = "direction_sci"

/obj/structure/sign/directions/janitor
	name = "\improper Custodial Closet"
	icon_state = "direction_jan"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering Bay"
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security Wing"
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical Bay"
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Evacuation Wing"
	icon_state = "direction_evac"

/obj/structure/sign/directions/bridge
	name = "\improper Bridge"
	icon_state = "direction_bridge"

/obj/structure/sign/directions/supply
	name = "\improper Supply Office"
	icon_state = "direction_supply"

/obj/structure/sign/directions/infirmary
	name = "\improper Infirmary"
	icon_state = "direction_infirm"

/obj/structure/sign/directions/virology
	name = "\improper Virology"
	icon_state = "direction_viro"

/obj/structure/sign/directions/examroom
	name = "\improper Exam Room"
	icon_state = "examroom"

/obj/structure/sign/directions/infm
	name = "\improper Infirmary"
	icon_state = "infm"

/obj/structure/sign/directions/med
	name = "\improper Medbay"
	icon_state = "med"

/obj/structure/sign/deck/bridge
	name = "\improper Bridge Deck"
	icon_state = "deck-b"

/obj/structure/sign/deck/first
	name = "\improper First Deck"
	icon_state = "deck-1"

/obj/structure/sign/deck/second
	name = "\improper Second Deck"
	icon_state = "deck-2"

/obj/structure/sign/deck/third
	name = "\improper Third Deck"
	icon_state = "deck-3"

/obj/structure/sign/deck/fourth
	name = "\improper Fourth Deck"
	icon_state = "deck-4"

/obj/structure/sign/deck/fifth
	name = "\improper Fifth Deck"
	icon_state = "deck-5"

/obj/item/sign/medipolma
	name = "medical diploma"
	desc = "A fancy print laminated paper that certifies that its bearer is indeed a Doctor of Medicine, graduated from a medical school in one of fringe systems. You don't recognize the name though, and half of latin words they used do not actually exist."
	icon = 'icons/obj/decals.dmi'
	icon_state = "goldenplaque"
	sign_state = "goldenplaque"
	var/claimant

/obj/item/sign/medipolma/attack_self(mob/user)
	if(!claimant)
		to_chat(user, SPAN_NOTICE("You fill in your name in the blanks with a permanent marker."))
		claimant = user.real_name
	..()

/obj/item/sign/medipolma/examine(mob/user)
	. = ..()
	if(claimant)
		to_chat(user,"This one belongs to Dr.[claimant], MD.")
	else
		to_chat(user,"The name is left blank for some reason.")

/obj/structure/sign/osha/radiationsignyellow
	name = "RADIATION WARNING!"
	desc = "A warning sign advising you of a radioactive area."
	icon_state = "radiationsign"

/obj/structure/sign/osha/secureareasign
	name = "SECURE AREA"
	desc = "A warning sign against tresspassing."
	icon_state = "securesign"

/obj/structure/sign/osha/electricalsign
	name = "DANGER HIGH-VOLTAGE!"
	desc = "A warning sign that displays a large bolt. Underneath you can read 'BEWARE OF ELECTRIC SHOCK'."
	icon_state = "electricalsign"

/obj/structure/sign/osha/cyrogenicsign
	name = "WARNING COLD TEMPERATURES."
	desc = "A warning sign which suggests this environment may contain sub-zero elements."
	icon_state = "cyrogenicsign"

/obj/structure/sign/osha/containernotice
	name = "USE SAFETY CONTAINERS"
	desc = "A sign that advises the use of safety containers such as beakers."
	icon_state = "containersign"

/obj/structure/sign/osha/highflame
	name = "CAUTION HIGHLY FLAMMABLE!"
	desc = "A warning sign that suggests this area contains highly flammable materials."
	icon_state = "oxidizersign"

/obj/structure/sign/osha/biohazardous
	name = "DANGER BIOHAZARDOUS MATERIALS."
	desc = "A warning sign that tells you this area contains biohazardous materials. It advises wearing internals."
	icon_state = "biohazardous"

/obj/structure/sign/osha/commonsenseplease
	name = "USE COMMON SENSE."
	desc = "A stark-yellow sign showing a brain. Underneath it states to use common sense, who would do that?"
	icon_state = "commonsense"

/obj/structure/sign/osha/biohazardsigns
	name = "BIOHAZARD PRESENT!"
	desc = "A sign which warns you that biohazardous material may be in use."
	icon_state = "biohazardsign"

/obj/structure/sign/osha/dangercorrosive
	name = "CORROSIVE MATERIALS PRESENT!"
	desc = "A sign warning that corrosive reagents may be present. It advises wearing gloves to prevent chemical burns."
	icon_state = "corrosivematerial"

/obj/structure/sign/osha/explosivematsign
	name = "DANGER! EXPLOSIVE MATERIAL!"
	desc = "A sign warning that highly explosive material may be used."
	icon_state = "explosives"

/obj/structure/sign/osha/alertlasersign
	name = "WEAR EYE-PROTECTION, LASERS IN USE."
	desc = "A warning sign advising you to wear eye protection."
	icon_state = "laserssign"

/obj/structure/sign/osha/poisonsign
	name = "RESPIRATOR REQUIRED BEFORE ENTRY."
	desc = "A warning sign stating that respirators are needed due to poisonous materials being handled."
	icon_state = "poisonous"

/obj/structure/sign/osha/magneticsign
	name = "MAGNETIC MATERIALS PRESENT."
	desc = "A warning sign which reads 'MAGNETIC MATERIALS PRESENT'."
	icon_state = "magnetic"

/obj/structure/sign/osha/opticssign
	name = "WEAR EYE-PROTECTION BEFORE ENTRY"
	desc = "A warning sign which advises wearing equipment to prevent eye damage."
	icon_state = "optics"

/obj/structure/sign/osha/vigilsign
	name = "REMAIN VIGILANT."
	desc = "A sign that advises you to remain vigilant to your surrondings. Someone has scratched out 'Trust No-one' at the bottom of the sign."
	icon_state = "awaresign"

/obj/structure/sign/osha/ssdhelpsign
	name = "SECURE SLEEPING CREW."
	desc = "A sign advising you to return crew suffering from Sleep Sickness Disorder (SSD) to the Cyrogenics or Dorm area."
	icon_state = "ssdsign"

/area/ship/scrap
	name = "Bearcat"
	icon = 'icons/turf/area_almayer.dmi'
	icon_state = "almayer"
	ceiling = CEILING_METAL
	powernet_name = "bearcat"
	sound_environment = SOUND_ENVIRONMENT_ROOM
	soundscape_interval = 30
	ambience_exterior = AMBIENCE_ALMAYER
	ceiling_muffle = FALSE

/area/ship/scrap/crew
	name = "Crew Compartements"
	icon = 'icons/turf/areas.dmi'
	icon_state = "crew_quarters"
	color = "#00FFFF"

/area/ship/scrap/crew/hallway/port
	name = "Crew Hallway - Port"

/area/ship/scrap/crew/hallway/starboard
	name = "Crew Hallway - Starboard"

/area/ship/scrap/crew/kitchen
	name = "Galley"
	icon = 'icons/turf/area_almayer.dmi'
	icon_state = "gruntrnr"

/area/ship/scrap/crew/cryo
	name = "Cryo Storage"
	icon_state = "cryo"

/area/ship/scrap/crew/dorms1
	name = "Crew Cabin #1"
	icon = 'icons/turf/areas.dmi'
	icon_state = "crew_quarters"

/area/ship/scrap/crew/dorms2
	name = "Crew Cabin #2"

/area/ship/scrap/crew/dorms3
	name = "Crew Cabin #3"

/area/ship/scrap/crew/saloon
	name = "Saloon"
	icon_state = "brig"

/area/ship/scrap/crew/toilets
	name = "Bathrooms"
	icon = 'icons/turf/area_almayer.dmi'
	icon_state = "briefing"
	color = "#00FFFF"

/area/ship/scrap/crew/wash
	name = "Washroom"
	icon = 'icons/turf/area_almayer.dmi'
	icon_state = "briefing"
	color = "#964B00"

/area/ship/scrap/crew/medbay
	name = "Medical Bay"
	icon_state = "med"

/area/ship/scrap/cargo
	name = "Cargo Hold"
	icon_state = "req"

/area/ship/scrap/cargo/lower
	name = "Lower Cargo Hold"

/area/ship/scrap/dock
	name = "Docking Bay"
	icon_state = "exoarmor"

/area/ship/scrap/fire
	name = "Firefighting Equipment Comparment"
	icon_state = "red"

/area/ship/scrap/unused
	name = "Compartment 2-B"
	icon = 'icons/turf/hybrisareas.dmi'
	icon_state = "power0"

/area/ship/scrap/hidden
	icon_state = "yellow"

/area/ship/scrap/escape_port
	name = "Port Escape Pods"
	icon_state = "yellow"

/area/ship/scrap/escape_star
	name = "Starboard Escape Pods"
	icon_state = "yellow"

/area/ship/scrap/broken1
	name = "Robotic Maintenance"
	icon_state = "livingspace"

/area/ship/scrap/broken2
	name = "Compartment 1-B"
	icon_state = "yellow"

/area/ship/scrap/gambling
	name = "Compartment 1-C"
	icon_state = "livingspace"

/area/ship/scrap/maintenance
	name = "Maintenance Compartments"
	icon_state = "upperhull"

/area/ship/scrap/maintenance/hallway
	name = "Maintenance Corridors"

/area/ship/scrap/maintenance/lower
	name = "Lower Deck Maintenance Compartments"
	icon_state = "upperhull"

/area/ship/scrap/maintenance/storage
	name = "Tools Storage"
	icon_state = "selfdestruct"

/area/ship/scrap/maintenance/techstorage
	name = "Parts Storage"
	icon_state = "lowerengineering"

/area/ship/scrap/maintenance/eva
	name = "EVA Storage"
	icon = 'icons/turf/areas.dmi'
	icon_state = "disposal"

/area/ship/scrap/maintenance/engineering
	name = "Engineering Bay"
	icon_state = "lifeboat_pump"

/area/ship/scrap/maintenance/atmos
	name = "Atmospherics Comparment"
	icon = 'icons/turf/areas.dmi'
	icon_state = "engine"

/area/ship/scrap/maintenance/power
	name = "Power Compartment"
	icon_state = "lowerengineering"

/area/ship/scrap/maintenance/engine
	icon_state = "engine"

/area/ship/scrap/maintenance/engine/aft
	name = "Main Engine Bay"
	icon = 'icons/turf/areas.dmi'
	icon_state = "engine"
	color = "#F13F3F"

/area/ship/scrap/maintenance/engine/port
	name = "Port Thruster"
	icon = 'icons/turf/areas.dmi'
	icon_state = "engine"
	color = "#Ffa500"

/area/ship/scrap/maintenance/engine/starboard
	name = "Starboard Thruster"
	icon = 'icons/turf/areas.dmi'
	icon_state = "engine"
	color = "#FFC0CB"

/area/ship/scrap/command/hallway
	name = "Command Deck"
	icon_state = "airoom"

/area/ship/scrap/command/bridge
	name = "Bridge"
	icon_state = "cic"

/area/ship/scrap/command/captain
	name = "Captain's Quarters"
	icon_state = "livingspace"

/area/ship/scrap/comms
	name = "Communications Relay"
	icon_state = "tcomms"

#define DROPSHIP_BEARCAT "dropship_bearcat"
#define BEARCAT_LZ "bearcat lz"

/datum/map_template/shuttle/bearcat
	name = "Grasshopper"
	shuttle_id = DROPSHIP_BEARCAT

/obj/docking_port/mobile/marine_dropship/bearcat
	name = "Grasshopper"
	id = DROPSHIP_BEARCAT
	width = 10
	height = 10
	dwidth = 4
	dheight = 3


/area/shuttle/bearcat
	name = "shuttle Grasshopper"
	icon_state = "shuttlered"
	base_muffle = MUFFLE_HIGH
	soundscape_interval = 30
	is_landing_zone = TRUE
	ceiling = CEILING_REINFORCED_METAL

/area/shuttle/bearcat/Enter(atom/movable/O, atom/oldloc)
	if(istype(O, /obj/structure/barricade))
		return FALSE
	return TRUE