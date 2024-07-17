//------------VEHICLE MODULES VENDOR---------------

/obj/structure/machinery/cm_vending/gear/vehicle_crew
	name = "ColMarTech Vehicle Parts Delivery System"
	desc = "An automated delivery system unit hooked up to the underbelly of the ship. Allows the crewmen to choose one set of free equipment for their vehicle at the start of operation and order more spare parts if provided with additional budget by Command. Can be accessed only by the Vehicle Crewmen."
	icon = 'icons/obj/structures/machinery/vending_64x32.dmi'
	icon_state = "vehicle_gear"

	req_access = list(ACCESS_MARINE_CREWMAN)
	vendor_role = list(JOB_CREWMAN)
	bound_width = 64

	unslashable = TRUE

	vend_delay = 4 SECONDS
	vend_sound = 'sound/machines/medevac_extend.ogg'

	var/selected_vehicle
	var/budget_points = 0
	var/available_categories = VEHICLE_ALL_AVAILABLE

	available_points_to_display = 0

	vend_flags = VEND_CLUTTER_PROTECTION|VEND_CATEGORY_CHECK|VEND_TO_HAND|VEND_USE_VENDOR_FLAGS

/obj/structure/machinery/cm_vending/gear/vehicle_crew/Initialize(mapload, ...)
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_VEHICLE_ORDERED, PROC_REF(populate_products))
	if(!VehicleGearConsole)
		VehicleGearConsole = src

/obj/structure/machinery/cm_vending/gear/vehicle_crew/Destroy()
	UnregisterSignal(SSdcs, COMSIG_GLOB_VEHICLE_ORDERED)
	VehicleGearConsole = null
	return ..()

/obj/structure/machinery/cm_vending/gear/vehicle_crew/get_appropriate_vend_turf(mob/living/carbon/human/H)
	var/turf/T = loc
	T = get_step(T, SOUTH)
	return T

/obj/structure/machinery/cm_vending/gear/vehicle_crew/tip_over() //we don't do this here
	return

/obj/structure/machinery/cm_vending/gear/vehicle_crew/flip_back()
	return

/obj/structure/machinery/cm_vending/ex_act(severity)
	if(severity > EXPLOSION_THRESHOLD_LOW)
		if(prob(25))
			malfunction()
			return

/obj/structure/machinery/cm_vending/gear/vehicle_crew/proc/populate_products(datum/source, obj/vehicle/multitile/V)
	SIGNAL_HANDLER
	UnregisterSignal(SSdcs, COMSIG_GLOB_VEHICLE_ORDERED)

	if(!selected_vehicle)
		selected_vehicle = "APC" // The whole thing seems to be based upon the assumption you unlock tank as an override, defaulting to APC
	if(selected_vehicle == "APC")
		available_categories &= ~(VEHICLE_ARMOR_AVAILABLE|VEHICLE_INTEGRAL_AVAILABLE) //APC lacks these, so we need to remove these flags to be able to access spare parts section

/obj/structure/machinery/cm_vending/gear/vehicle_crew/get_listed_products(mob/user)
	var/list/display_list = list()

	if(!user)
		display_list += GLOB.cm_vending_vehicle_crew_tank
		display_list += GLOB.cm_vending_vehicle_crew_tank_spare
		display_list += GLOB.cm_vending_vehicle_crew_apc
		display_list += GLOB.cm_vending_vehicle_crew_apc_spare
		return display_list

	if(selected_vehicle == "TANK")
		if(available_categories)
			display_list = GLOB.cm_vending_vehicle_crew_tank
		else
			display_list = GLOB.cm_vending_vehicle_crew_tank_spare

	else if(selected_vehicle == "APC")
		if(available_categories)
			display_list = GLOB.cm_vending_vehicle_crew_apc
		else //APC stuff costs more to prevent 4000 points spent on shitton of ammunition
			display_list = GLOB.cm_vending_vehicle_crew_apc_spare
	return display_list

/obj/structure/machinery/cm_vending/gear/vehicle_crew/ui_data(mob/user)
	. = list()
	. += ui_static_data(user)

	if(supply_controller.tank_points) //we steal points from supply_controller, meh-he-he. Solely to be able to modify amount of points in vendor if needed by just changing one var.
		available_points_to_display = supply_controller.tank_points
		supply_controller.tank_points = 0
	.["current_m_points"] = available_points_to_display

	var/list/ui_listed_products = get_listed_products(user)
	var/list/stock_values = list()
	for (var/i in 1 to length(ui_listed_products))
		var/list/myprod = ui_listed_products[i] //we take one list from listed_products
		var/prod_available = FALSE
		var/p_cost = myprod[2]
		var/avail_flag = myprod[4]
		if(budget_points >= p_cost && (!avail_flag || available_categories & avail_flag))
			prod_available = TRUE
		stock_values += list(prod_available)

	.["stock_listing"] = stock_values

/obj/structure/machinery/cm_vending/gear/vehicle_crew/handle_points(mob/living/carbon/human/H, list/L)
	. = TRUE
	if(available_categories)
		if(!(available_categories & L[4]))
			to_chat(usr, SPAN_WARNING("Module from this category is already taken."))
			vend_fail()
			return FALSE
		available_categories &= ~L[4]
	else
		if(available_points_to_display < L[2])
			to_chat(H, SPAN_WARNING("Not enough points."))
			vend_fail()
			return FALSE
		budget_points -= L[2]

/obj/structure/machinery/cm_vending/gear/vehicle_crew/get_appropriate_vend_turf(mob/living/carbon/human/H)
	var/turf/T = get_turf(src)
	T = get_step(T, SOUTH)
	return T

GLOBAL_LIST_INIT(cm_vending_vehicle_crew_tank, list(
	list("STARTING KIT SELECTION:", 0, null, null, null),

	list("INTEGRAL PARTS", 0, null, null, null),
	list("M34A2-A Multipurpose Turret", 0, /obj/effect/essentials_set/tank/turret, VEHICLE_INTEGRAL_AVAILABLE, VENDOR_ITEM_MANDATORY),

	list("PRIMARY WEAPON", 0, null, null, null),
	list("AC3-E Autocannon", 0, /obj/effect/essentials_set/tank/autocannon, VEHICLE_PRIMARY_AVAILABLE, VENDOR_ITEM_RECOMMENDED),
	list("DRG-N Offensive Flamer Unit", 0, /obj/effect/essentials_set/tank/dragonflamer, VEHICLE_PRIMARY_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("LTAA-AP Minigun", 0, /obj/effect/essentials_set/tank/gatling, VEHICLE_PRIMARY_AVAILABLE, VENDOR_ITEM_REGULAR),

	list("SECONDARY WEAPON", 0, null, null, null),
	list("M92T Grenade Launcher", 0, /obj/effect/essentials_set/tank/tankgl, VEHICLE_SECONDARY_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("M56 Cupola", 0, /obj/effect/essentials_set/tank/m56cupola, VEHICLE_SECONDARY_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("LZR-N Flamer Unit", 0, /obj/effect/essentials_set/tank/tankflamer, VEHICLE_SECONDARY_AVAILABLE, VENDOR_ITEM_RECOMMENDED),

	list("SUPPORT MODULE", 0, null, null, null),
	list("Artillery Module", 0, /obj/item/hardpoint/support/artillery_module, VEHICLE_SUPPORT_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("Integrated Weapons Sensor Array", 0, /obj/item/hardpoint/support/weapons_sensor, VEHICLE_SUPPORT_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("Overdrive Enhancer", 0, /obj/item/hardpoint/support/overdrive_enhancer, VEHICLE_SUPPORT_AVAILABLE, VENDOR_ITEM_RECOMMENDED),

	list("ARMOR", 0, null, null, null),
	list("Ballistic Armor", 0, /obj/item/hardpoint/armor/ballistic, VEHICLE_ARMOR_AVAILABLE, VENDOR_ITEM_RECOMMENDED),
	list("Caustic Armor", 0, /obj/item/hardpoint/armor/caustic, VEHICLE_ARMOR_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("Concussive Armor", 0, /obj/item/hardpoint/armor/concussive, VEHICLE_ARMOR_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("Paladin Armor", 0, /obj/item/hardpoint/armor/paladin, VEHICLE_ARMOR_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("Snowplow", 0, /obj/item/hardpoint/armor/snowplow, VEHICLE_ARMOR_AVAILABLE, VENDOR_ITEM_REGULAR),

	list("TREADS", 0, null, null, null),
	list("Reinforced Treads", 0, /obj/item/hardpoint/locomotion/treads/robust, VEHICLE_TREADS_AVAILABLE, VENDOR_ITEM_REGULAR),
	list("Treads", 0, /obj/item/hardpoint/locomotion/treads, VEHICLE_TREADS_AVAILABLE, VENDOR_ITEM_RECOMMENDED)))

GLOBAL_LIST_INIT(cm_vending_vehicle_crew_tank_spare, list(
	list("SPARE PARTS SELECTION:", 0, null, null, null),

	list("INTEGRAL PARTS", 0, null, null, null),
	list("M34A2-A Multipurpose Turret", 500, /obj/item/hardpoint/holder/tank_turret, null, VENDOR_ITEM_REGULAR),

	list("SUPPORT AMMUNITION", 0, null, null, null),
	list("Turret Smoke Screen Magazine", 50, /obj/item/ammo_magazine/hardpoint/turret_smoke, null, VENDOR_ITEM_REGULAR),

	list("PRIMARY WEAPON", 0, null, null, null),
	list("AC3-E Autocannon", 200, /obj/item/hardpoint/primary/autocannon, null, VENDOR_ITEM_REGULAR),
	list("DRG-N Offensive Flamer Unit", 200, /obj/item/hardpoint/primary/flamer, null, VENDOR_ITEM_REGULAR),
	list("LTAA-AP Minigun", 200, /obj/item/hardpoint/primary/minigun, null, VENDOR_ITEM_REGULAR),
	list("LTB Cannon", 400, /obj/item/hardpoint/primary/cannon, null, VENDOR_ITEM_RECOMMENDED),

	list("PRIMARY AMMUNITION", 0, null, null, null),
	list("AC3-E Autocannon Magazine", 100, /obj/item/ammo_magazine/hardpoint/ace_autocannon, null, VENDOR_ITEM_REGULAR),
	list("DRG-N Offensive Flamer Unit Fuel Tank", 100, /obj/item/ammo_magazine/hardpoint/primary_flamer, null, VENDOR_ITEM_REGULAR),
	list("LTAA-AP Minigun Magazine", 100, /obj/item/ammo_magazine/hardpoint/ltaaap_minigun, null, VENDOR_ITEM_REGULAR),
	list("LTB Cannon Magazine", 100, /obj/item/ammo_magazine/hardpoint/ltb_cannon, null, VENDOR_ITEM_REGULAR),

	list("SECONDARY WEAPON", 0, null, null, null),
	list("M92T Grenade Launcher", 200, /obj/item/hardpoint/secondary/grenade_launcher, null, VENDOR_ITEM_REGULAR),
	list("M56 Cupola", 200, /obj/item/hardpoint/secondary/m56cupola, null, VENDOR_ITEM_REGULAR),
	list("LZR-N Flamer Unit", 200, /obj/item/hardpoint/secondary/small_flamer, null, VENDOR_ITEM_REGULAR),
	list("TOW Launcher", 300, /obj/item/hardpoint/secondary/towlauncher, null, VENDOR_ITEM_REGULAR),

	list("SECONDARY AMMUNITION", 0, null, null, null),
	list("M92T Grenade Launcher Magazine", 50, /obj/item/ammo_magazine/hardpoint/tank_glauncher, null, VENDOR_ITEM_REGULAR),
	list("M56 Cupola Magazine", 50, /obj/item/ammo_magazine/hardpoint/m56_cupola, null, VENDOR_ITEM_REGULAR),
	list("LZR-N Flamer Unit Fuel Tank", 50, /obj/item/ammo_magazine/hardpoint/secondary_flamer, null, VENDOR_ITEM_REGULAR),
	list("TOW Launcher Magazine", 50, /obj/item/ammo_magazine/hardpoint/towlauncher, null, VENDOR_ITEM_REGULAR),

	list("SUPPORT MODULE", 0, null, null, null),
	list("Artillery Module", 300, /obj/item/hardpoint/support/artillery_module, null, VENDOR_ITEM_REGULAR),
	list("Integrated Weapons Sensor Array", 200, /obj/item/hardpoint/support/weapons_sensor, null, VENDOR_ITEM_REGULAR),
	list("Overdrive Enhancer", 200, /obj/item/hardpoint/support/overdrive_enhancer, null, VENDOR_ITEM_REGULAR),

	list("ARMOR", 0, null, null, null),
	list("Ballistic Armor", 300, /obj/item/hardpoint/armor/ballistic, null, VENDOR_ITEM_REGULAR),
	list("Caustic Armor", 300, /obj/item/hardpoint/armor/caustic, null, VENDOR_ITEM_REGULAR),
	list("Concussive Armor", 300, /obj/item/hardpoint/armor/concussive, null, VENDOR_ITEM_REGULAR),
	list("Paladin Armor", 300, /obj/item/hardpoint/armor/paladin, null, VENDOR_ITEM_REGULAR),
	list("Snowplow", 200, /obj/item/hardpoint/armor/snowplow, null, VENDOR_ITEM_REGULAR),

	list("TREADS", 0, null, null, null),
	list("Reinforced Treads", 200, /obj/item/hardpoint/locomotion/treads/robust, null, VENDOR_ITEM_REGULAR),
	list("Treads", 200, /obj/item/hardpoint/locomotion/treads, null, VENDOR_ITEM_REGULAR)))

GLOBAL_LIST_INIT(cm_vending_vehicle_crew_apc, list(
	list("STARTING KIT SELECTION:", 0, null, null, null),

	list("PRIMARY WEAPON", 0, null, null, null),
	list("PARS-159 Boyars Dualcannon", 0, /obj/effect/essentials_set/apc/dualcannon, VEHICLE_PRIMARY_AVAILABLE, VENDOR_ITEM_MANDATORY),

	list("SECONDARY WEAPON", 0, null, null, null),
	list("RE-RE700 Frontal Cannon", 0, /obj/effect/essentials_set/apc/frontalcannon, VEHICLE_SECONDARY_AVAILABLE, VENDOR_ITEM_MANDATORY),

	list("SUPPORT MODULE", 0, null, null, null),
	list("M-97F Flare Launcher", 0, /obj/effect/essentials_set/apc/flarelauncher, VEHICLE_SUPPORT_AVAILABLE, VENDOR_ITEM_MANDATORY),

	list("WHEELS", 0, null, null, null),
	list("APC Wheels", 0, /obj/item/hardpoint/locomotion/apc_wheels, VEHICLE_TREADS_AVAILABLE, VENDOR_ITEM_MANDATORY)))

GLOBAL_LIST_INIT(cm_vending_vehicle_crew_apc_spare, list(
	list("SPARE PARTS SELECTION:", 0, null, null, null),

	list("PRIMARY WEAPON", 0, null, null, null),
	list("PARS-159 Boyars Dualcannon", 500, /obj/item/hardpoint/primary/dualcannon, null, VENDOR_ITEM_REGULAR),

	list("PRIMARY AMMUNITION", 0, null, null, null),
	list("PARS-159 Dualcannon Magazine", 150, /obj/item/ammo_magazine/hardpoint/ace_autocannon, null, VENDOR_ITEM_REGULAR),

	list("SECONDARY WEAPON", 0, null, null, null),
	list("RE-RE700 Frontal Cannon", 400, /obj/item/hardpoint/secondary/frontalcannon, null, VENDOR_ITEM_REGULAR),

	list("SECONDARY AMMUNITION", 0, null, null, null),
	list("RE-RE700 Frontal Cannon Magazine", 150, /obj/item/ammo_magazine/hardpoint/tank_glauncher, null, VENDOR_ITEM_REGULAR),

	list("SUPPORT MODULE", 0, null, null, null),
	list("M-97F Flare Launcher", 300, /obj/item/hardpoint/support/flare_launcher, null, VENDOR_ITEM_REGULAR),

	list("SUPPORT AMMUNITION", 0, null, null, null),
	list("M-97F Flare Launcher Magazine", 50, /obj/item/ammo_magazine/hardpoint/flare_launcher, null, VENDOR_ITEM_REGULAR),

	list("WHEELS", 0, null, null, null),
	list("APC Wheels", 200, /obj/item/hardpoint/locomotion/apc_wheels, null, VENDOR_ITEM_REGULAR)))

//------------ESSENTIAL SETS---------------

//Not essentials sets but fuck it the code's here
/obj/effect/essentials_set/tank/ltb
	spawned_gear_list = list(
		/obj/item/hardpoint/primary/cannon,
		/obj/item/ammo_magazine/hardpoint/ltb_cannon,
		/obj/item/ammo_magazine/hardpoint/ltb_cannon,
		/obj/item/ammo_magazine/hardpoint/ltb_cannon,
		/obj/item/ammo_magazine/hardpoint/ltb_cannon,
		/obj/item/ammo_magazine/hardpoint/ltb_cannon,
	)

/obj/effect/essentials_set/tank/gatling
	spawned_gear_list = list(
		/obj/item/hardpoint/primary/minigun,
		/obj/item/ammo_magazine/hardpoint/ltaaap_minigun,
		/obj/item/ammo_magazine/hardpoint/ltaaap_minigun,
	)

/obj/effect/essentials_set/tank/dragonflamer
	spawned_gear_list = list(
		/obj/item/hardpoint/primary/flamer,
		/obj/item/ammo_magazine/hardpoint/primary_flamer,
		/obj/item/ammo_magazine/hardpoint/primary_flamer,
	)

/obj/effect/essentials_set/tank/autocannon
	spawned_gear_list = list(
		/obj/item/hardpoint/primary/autocannon,
		/obj/item/ammo_magazine/hardpoint/ace_autocannon,
		/obj/item/ammo_magazine/hardpoint/ace_autocannon,
		/obj/item/ammo_magazine/hardpoint/ace_autocannon,
		/obj/item/ammo_magazine/hardpoint/ace_autocannon,
	)

/obj/effect/essentials_set/tank/tankflamer
	spawned_gear_list = list(
		/obj/item/hardpoint/secondary/small_flamer,
		/obj/item/ammo_magazine/hardpoint/secondary_flamer,
	)

/obj/effect/essentials_set/tank/tow
	spawned_gear_list = list(
		/obj/item/hardpoint/secondary/towlauncher,
		/obj/item/ammo_magazine/hardpoint/towlauncher,
		/obj/item/ammo_magazine/hardpoint/towlauncher,
	)

/obj/effect/essentials_set/tank/m56cupola
	spawned_gear_list = list(
		/obj/item/hardpoint/secondary/m56cupola,
		/obj/item/ammo_magazine/hardpoint/m56_cupola,
	)

/obj/effect/essentials_set/tank/tankgl
	spawned_gear_list = list(
		/obj/item/hardpoint/secondary/grenade_launcher,
		/obj/item/ammo_magazine/hardpoint/tank_glauncher,
		/obj/item/ammo_magazine/hardpoint/tank_glauncher,
		/obj/item/ammo_magazine/hardpoint/tank_glauncher,
		/obj/item/ammo_magazine/hardpoint/tank_glauncher,
	)

/obj/effect/essentials_set/tank/turret
	spawned_gear_list = list(
		/obj/item/hardpoint/holder/tank_turret,
		/obj/item/ammo_magazine/hardpoint/turret_smoke,
		/obj/item/ammo_magazine/hardpoint/turret_smoke,
	)

/obj/effect/essentials_set/apc/dualcannon
	spawned_gear_list = list(
		/obj/item/hardpoint/primary/dualcannon,
		/obj/item/ammo_magazine/hardpoint/boyars_dualcannon,
		/obj/item/ammo_magazine/hardpoint/boyars_dualcannon,
		/obj/item/ammo_magazine/hardpoint/boyars_dualcannon,
		/obj/item/ammo_magazine/hardpoint/boyars_dualcannon,
	)

/obj/effect/essentials_set/apc/frontalcannon
	spawned_gear_list = list(
		/obj/item/hardpoint/secondary/frontalcannon,
		/obj/item/ammo_magazine/hardpoint/m56_cupola/frontal_cannon,
	)

/obj/effect/essentials_set/apc/flarelauncher
	spawned_gear_list = list(
		/obj/item/hardpoint/support/flare_launcher,
		/obj/item/ammo_magazine/hardpoint/flare_launcher,
		/obj/item/ammo_magazine/hardpoint/flare_launcher,
		/obj/item/ammo_magazine/hardpoint/flare_launcher,
	)
