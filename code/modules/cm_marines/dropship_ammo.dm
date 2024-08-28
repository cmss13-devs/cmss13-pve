


/// Dropship weaponry ammunition
/obj/structure/ship_ammo
	icon = 'icons/obj/structures/props/almayer_props.dmi'
	density = TRUE
	anchored = TRUE
	throwpass = TRUE
	climbable = TRUE
	/// Delay between firing steps
	var/fire_mission_delay = 4
	/// Time to impact in deciseconds
	var/travelling_time = 100
	/// Type of equipment that accept this type of ammo.
	var/equipment_type
	/// Ammunition count remaining
	var/ammo_count
	/// Maximal ammunition count
	var/max_ammo_count
	/// What to call the ammo in the ammo transferring message
	var/ammo_name = "round"
	var/ammo_id
	/// Whether the ammo inside this magazine can be transferred to another magazine.
	var/transferable_ammo = FALSE
	/// How many tiles the ammo can deviate from the laser target
	var/accuracy_range = 3
	/// Sound played mere seconds before impact
	var/warning_sound = 'sound/effects/rocketpod_fire.ogg'
	/// Volume of the sound played before impact
	var/warning_sound_volume = 70
	/// Ammunition expended each time this is fired
	var/ammo_used_per_firing = 1
	/// Maximum deviation allowed when the ammo is not longer guided by a laser
	var/max_inaccuracy = 6
	/// Cost to build in the fabricator, zero means unbuildable
	var/point_cost
	/// Mob that fired this ammunition (the pilot pressing the trigger)
	var/mob/source_mob
	var/combat_equipment = TRUE

/obj/structure/ship_ammo/attack_alien(mob/living/carbon/xenomorph/current_xenomorph)
	if(unslashable)
		return XENO_NO_DELAY_ACTION
	current_xenomorph.animation_attack_on(src)
	playsound(src, 'sound/effects/metalhit.ogg', 25, 1)
	current_xenomorph.visible_message(SPAN_DANGER("[current_xenomorph] slashes at [src]!"),
	SPAN_DANGER("You slash at [src]!"), null, 5, CHAT_TYPE_XENO_COMBAT)
	update_health(rand(current_xenomorph.melee_damage_lower, current_xenomorph.melee_damage_upper))
	return XENO_ATTACK_ACTION

/obj/structure/ship_ammo/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/powerloader_clamp))
		var/obj/item/powerloader_clamp/PC = I
		if(!PC.linked_powerloader)
			qdel(PC)
			return FALSE
		if(PC.loaded)
			if(istype(PC.loaded, /obj/structure/ship_ammo))
				var/obj/structure/ship_ammo/SA = PC.loaded
				SA.transfer_ammo(src, user)
				return FALSE
		else
			if(ammo_count < 1)
				to_chat(user, SPAN_WARNING("\The [src] has ran out of ammo, so you discard it!"))
				qdel(src)
				return FALSE

			if(ammo_name == "rocket")
				PC.grab_object(user, src, "ds_rocket", 'sound/machines/hydraulics_1.ogg')
			else
				PC.grab_object(user, src, "ds_ammo", 'sound/machines/hydraulics_1.ogg')
			update_icon()
			return FALSE
	else
		. = ..()


/obj/structure/ship_ammo/get_examine_text(mob/user)
	. = ..()
	. += "Moving this will require some sort of lifter."

//what to show to the user that examines the weapon we're loaded on.
/obj/structure/ship_ammo/proc/show_loaded_desc(mob/user)
	return "It's loaded with \a [src]."

/obj/structure/ship_ammo/proc/detonate_on(turf/impact)
	return

/obj/structure/ship_ammo/proc/can_fire_at(turf/impact, mob/user)
	return TRUE

/obj/structure/ship_ammo/proc/transfer_ammo(obj/structure/ship_ammo/target, mob/user)
	if(type != target.type)
		to_chat(user, SPAN_NOTICE("\The [src] and \the [target] use incompatible types of ammunition!"))
		return
	if(!transferable_ammo)
		to_chat(user, SPAN_NOTICE("\The [src] doesn't support [ammo_name] transfer!"))
		return
	var/obj/item/powerloader_clamp/PC
	if(istype(loc, /obj/item/powerloader_clamp))
		PC = loc
	if(ammo_count < 1)
		if(PC)
			PC.loaded = null
			PC.update_icon()
		to_chat(user, SPAN_WARNING("\The [src] has ran out of ammo, so you discard it!"))
		forceMove(get_turf(loc))
		qdel(src)
	if(target.ammo_count >= target.max_ammo_count)
		to_chat(user, SPAN_WARNING("\The [target] is fully loaded!"))
		return

	var/transf_amt = min(target.max_ammo_count - target.ammo_count, ammo_count)
	target.ammo_count += transf_amt
	ammo_count -= transf_amt
	playsound(loc, 'sound/machines/hydraulics_1.ogg', 40, 1)
	to_chat(user, SPAN_NOTICE("You transfer [transf_amt] [ammo_name] to \the [target]."))
	if(ammo_count < 1)
		if(PC)
			PC.loaded = null
			PC.update_icon()
		to_chat(user, SPAN_WARNING("\The [src] has ran out of ammo, so you discard it!"))
		forceMove(get_turf(loc))
		qdel(src)
	else
		if(PC)
			if(ammo_name == "rocket")
				PC.update_icon("ds_rocket")
			else
				PC.update_icon("ds_ammo")


//30mm gun

/obj/structure/ship_ammo/heavygun
	name = "\improper 25mm PGU-138 ammunition crate"
	icon_state = "30mm_crate"
	desc = "Ammobox of caseless 25mm ammunition, for the GAU-113/D rotary cannon system. Mixed loading of HEI-T and AP for use against personnel, light vehicles, and unhardened structures. Lacks its own propellants, as it operates off of the same binary hypergolic principles."
	equipment_type = /obj/structure/dropship_equipment/weapon/heavygun
	ammo_count = 400
	max_ammo_count = 400
	transferable_ammo = TRUE
	ammo_used_per_firing = 40
	point_cost = 275
	fire_mission_delay = 2
	var/bullet_spread_range = 4 //how far from the real impact turf can bullets land
	var/shrapnel_type = /datum/ammo/bullet/shrapnel/gau //For siming 30mm bullet impacts.
	var/directhit_damage = 105 //how much damage is to be inflicted to a mob, this is here so that we can hit resting mobs.
	var/penetration = 10 //AP value pretty much

/obj/structure/ship_ammo/heavygun/get_examine_text(mob/user)
	. = ..()
	. += "It has [ammo_count] round\s."

/obj/structure/ship_ammo/heavygun/show_loaded_desc(mob/user)
	if(ammo_count)
		return "It's loaded with \a [src] containing [ammo_count] round\s."
	else
		return "It's loaded with an empty [name]."

/obj/structure/ship_ammo/heavygun/detonate_on(turf/impact)
	set waitfor = 0
	var/list/turf_list = list()
	for(var/turf/T in range(bullet_spread_range, impact))
		turf_list += T
	var/soundplaycooldown = 0
	var/debriscooldown = 0
	for(var/i = 1 to ammo_used_per_firing)
		var/turf/impact_tile = pick(turf_list)
		sleep(1)
		var/datum/cause_data/cause_data = create_cause_data(initial(name), source_mob)
		impact_tile.ex_act(EXPLOSION_THRESHOLD_VLOW, pick(alldirs), cause_data)
		create_shrapnel(impact_tile,1,0,0,shrapnel_type,cause_data,FALSE,100) //simulates a bullet
		for(var/atom/movable/explosion_effect in impact_tile)
			if(iscarbon(explosion_effect))
				var/mob/living/carbon/bullet_effect = explosion_effect
				explosion_effect.ex_act(EXPLOSION_THRESHOLD_VLOW, null, cause_data)
				bullet_effect.apply_armoured_damage(directhit_damage,ARMOR_BULLET,BRUTE,null,penetration)
			else
				explosion_effect.ex_act(EXPLOSION_THRESHOLD_VLOW)
		if(!soundplaycooldown) //so we don't play the same sound 20 times very fast.
			playsound(impact_tile, 'sound/effects/gauimpact.ogg',40,1,20)
			soundplaycooldown = 3
		soundplaycooldown--
		if(!debriscooldown)
			impact_tile.ceiling_debris_check(1)
			debriscooldown = 6
		debriscooldown--
		new /obj/effect/particle_effect/expl_particles(impact_tile)
	sleep(11) //speed of sound simulation
	playsound(impact, 'sound/effects/gau.ogg',100,1,60)


/obj/structure/ship_ammo/heavygun/antitank
	name = "\improper 25mm PGU-322 ammunition crate"
	icon_state = "30mm_crate_hv"
	desc = "Ammobox of caseless 25mm ammunition, for the GAU-113/D rotary cannon system. Loads APDS and one-way tracer rounds, able to defeat thinly armored vehicles and reinforced structures. Lacks propellants, as it's to be used with the binary hypergolic principle."
	travelling_time = 60
	ammo_count = 400
	max_ammo_count = 400
	ammo_used_per_firing = 40
	bullet_spread_range = 4
	point_cost = 325
	fire_mission_delay = 2
	shrapnel_type = /datum/ammo/bullet/shrapnel/gau/at
	directhit_damage = 80 //how much damage is to be inflicted to a mob, this is here so that we can hit resting mobs.
	penetration = 40 //AP value pretty much

//laser battery

/obj/structure/ship_ammo/laser_battery
	name = "\improper BTU-17/LW Hi-Cap Laser Battery"
	icon_state = "laser_battery"
	desc = "A high-capacity laser battery used to power laser beam weapons.  Can be loaded into the LWU-6B Laser Cannon."
	travelling_time = 10
	ammo_count = 100
	max_ammo_count = 100
	ammo_used_per_firing = 40
	equipment_type = /obj/structure/dropship_equipment/weapon/laser_beam_gun
	ammo_name = "charge"
	transferable_ammo = TRUE
	accuracy_range = 1
	ammo_used_per_firing = 10
	max_inaccuracy = 1
	warning_sound = 'sound/effects/nightvision.ogg'
	point_cost = 200
	fire_mission_delay = 4 //very good but long cooldown


/obj/structure/ship_ammo/laser_battery/get_examine_text(mob/user)
	. = ..()
	. += "It's at [round(100*ammo_count/max_ammo_count)]% charge."


/obj/structure/ship_ammo/laser_battery/show_loaded_desc(mob/user)
	if(ammo_count)
		return "It's loaded with \a [src] at [round(100*ammo_count/max_ammo_count)]% charge."
	else
		return "It's loaded with an empty [name]."


/obj/structure/ship_ammo/laser_battery/detonate_on(turf/impact)
	set waitfor = 0
	var/list/turf_list = list()
	for(var/turf/T in range(impact, 3)) //This is its area of effect
		turf_list += T
	playsound(impact, 'sound/effects/pred_vision.ogg', 20, 1)
	for(var/i=1 to 16) //This is how many tiles within that area of effect will be randomly ignited
		var/turf/U = pick(turf_list)
		turf_list -= U
		laser_burn(U)

	if(!ammo_count && !QDELETED(src))
		qdel(src) //deleted after last laser beam is fired and impact the ground.



/obj/structure/ship_ammo/laser_battery/proc/laser_burn(turf/T)
	fire_spread_recur(T, create_cause_data(initial(name), source_mob), 1, null, 5, 75, "#EE6515")//Very, very intense, but goes out very quick


//Rockets

/obj/structure/ship_ammo/rocket
	name = "abstract rocket"
	icon_state = "single"
	icon = 'icons/obj/structures/props/almayer_props64.dmi'
	equipment_type = /obj/structure/dropship_equipment/weapon/rocket_pod
	ammo_count = 1
	max_ammo_count = 1
	ammo_name = "rocket"
	ammo_id = ""
	bound_width = 64
	bound_height = 32
	travelling_time = 60 //faster than 30mm rounds
	max_inaccuracy = 5
	point_cost = 0

/obj/structure/ship_ammo/rocket/detonate_on(turf/impact)
	qdel(src)


//this one is air-to-air only
/obj/structure/ship_ammo/rocket/widowmaker
	name = "\improper AIM-192/J threat suppression missile"
	desc = "The AIM-192/J is an alternative to the AIM-183 TSAM, trading airborne intercept capability for surface attack power and enhanced antiradiation capability."
	icon_state = "single"
	travelling_time = 30 //not powerful, but reaches target fast
	ammo_id = ""
	point_cost = 300
	fire_mission_delay = 4 //We don't care because our ammo has just 1 rocket

/obj/structure/ship_ammo/rocket/widowmaker/detonate_on(turf/impact)
	impact.ceiling_debris_check(3)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(cell_explosion), impact, 300, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data(initial(name)), source_mob), 0.5 SECONDS) //Your standard HE splash damage rocket. Good damage, good range, good speed, it's an all rounder
	QDEL_IN(src, 0.5 SECONDS)

/obj/structure/ship_ammo/rocket/banshee
	name = "\improper AGM-220/D tactical missile"
	desc = "The AGM-220/D Hellhound II is a modification of the C variant. It exchanges the high explosive antitank payload for a high explosive incendiary filler."
	icon_state = "banshee"
	ammo_id = "b"
	point_cost = 300
	fire_mission_delay = 4 //We don't care because our ammo has just 1 rocket

/obj/structure/ship_ammo/rocket/banshee/detonate_on(turf/impact)
	impact.ceiling_debris_check(3)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(cell_explosion), impact, 175, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data(initial(name)), source_mob), 0.5 SECONDS) //Small explosive power with a small fall off for a big explosion range
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(fire_spread), impact, create_cause_data(initial(name), source_mob), 4, 15, 50, "#00b8ff"), 0.5 SECONDS) //Very intense but the fire doesn't last very long
	QDEL_IN(src, 0.5 SECONDS)

/obj/structure/ship_ammo/rocket/keeper
	name = "\improper AGM-220/C tactical missile"
	desc = "The AGM-220/C is a modern air to ground multimodal homing missile for point target elimination. A shaped charge payload and intelligent fusing allows for optimized target impact characteristics."
	icon_state = "paveway"
	travelling_time = 20 //A fast payload due to its very tight blast zone
	ammo_id = "k"
	point_cost = 300
	fire_mission_delay = 4 //We don't care because our ammo has just 1 rocket

/obj/structure/ship_ammo/rocket/keeper/detonate_on(turf/impact)
	impact.ceiling_debris_check(3)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(cell_explosion), impact, 450, 100, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, create_cause_data(initial(name)), source_mob), 0.5 SECONDS) //Insane fall off combined with insane damage makes the Keeper useful for single targets, but very bad against multiple.
	QDEL_IN(src, 0.5 SECONDS)

/obj/structure/ship_ammo/rocket/harpoon
	name = "\improper Mk. 88 SGW"
	desc = "The Mk. 89 SGW is a low cost air to ground multipurpose missile with infrared homing, smart fuzing, and midcourse datalink. Compared to the Mk.88, it features a blast-frag payload that can devastate personnel in the open or thinskinned vehicles."
	icon_state = "harpoon"
	ammo_id = "s"
	travelling_time = 50
	point_cost = 300
	fire_mission_delay = 4

//Looks kinda OP but all it can actually do is just to blow windows and some of other things out, cant do much damage.
/obj/structure/ship_ammo/rocket/harpoon/detonate_on(turf/impact)
	impact.ceiling_debris_check(3)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(cell_explosion), impact, 150, 16, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data(initial(name)), source_mob), 0.5 SECONDS)
	QDEL_IN(src, 0.5 SECONDS)

/obj/structure/ship_ammo/rocket/napalm
	name = "\improper AGM-213/H tactical missile"
	desc = "This modification of the older Hellhound I includes an incendiary payload and improved proximity fuzing. Useful against structures or entrenched personnel, as well as in an area denial role."
	icon_state = "napalm"
	ammo_id = "n"
	point_cost = 500
	fire_mission_delay = 0 //0 means unusable

/obj/structure/ship_ammo/rocket/napalm/detonate_on(turf/impact)
	impact.ceiling_debris_check(3)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(cell_explosion), impact, 200, 25, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data(initial(name)), source_mob), 0.5 SECONDS)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(fire_spread), impact, create_cause_data(initial(name), source_mob), 6, 60, 30, "#EE6515"), 0.5 SECONDS) //Color changed into napalm's color to better convey how intense the fire actually is.
	QDEL_IN(src, 0.5 SECONDS)

/obj/structure/ship_ammo/rocket/thermobaric
	name = "\improper BLU-200 'Dragons Breath'"
	desc = "The BLU-200 Dragons Breath a thermobaric fuel-air bomb. The aerosolized fuel mixture creates a vacuum when ignited causing serious damage to those in its way. Can be loaded into the LAU-444 Guided Missile Launcher."
	icon_state = "fatty"
	ammo_id = "f"
	travelling_time = 50
	point_cost = 300
	fire_mission_delay = 4

/obj/structure/ship_ammo/rocket/thermobaric/detonate_on(turf/impact)
	impact.ceiling_debris_check(3)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(fire_spread), impact, create_cause_data(initial(name), source_mob), 4, 25, 50, "#c96500"), 0.5 SECONDS) //Very intense but the fire doesn't last very long
	for(var/mob/living/carbon/victim in orange(5, impact))
		victim.throw_atom(impact, 3, 15, src, TRUE) // Implosion throws affected towards center of vacuum
	QDEL_IN(src, 0.5 SECONDS)


//minirockets

/obj/structure/ship_ammo/minirocket
	name = "\improper M24 70mm rocket"
	desc = "The M24 is the Zeus's oldest loading. The M24 is a cheap, numerous, and excellently lethal blast-frag 70mm rocket system that forms a cornerstone of close air fire support."
	icon_state = "minirocket"
	icon = 'icons/obj/structures/props/almayer_props.dmi'
	equipment_type = /obj/structure/dropship_equipment/weapon/minirocket_pod
	ammo_count = 6
	max_ammo_count = 6
	ammo_name = "minirocket"
	travelling_time = 80 //faster than 30mm cannon, slower than real rockets
	transferable_ammo = TRUE
	point_cost = 300
	fire_mission_delay = 3 //high cooldown

/obj/structure/ship_ammo/minirocket/detonate_on(turf/impact)
	impact.ceiling_debris_check(2)
	spawn(5)
		cell_explosion(impact, 200, 44, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data(initial(name), source_mob))
		var/datum/effect_system/expl_particles/P = new/datum/effect_system/expl_particles()
		P.set_up(4, 0, impact)
		P.start()
		spawn(5)
			var/datum/effect_system/smoke_spread/S = new/datum/effect_system/smoke_spread()
			S.set_up(1,0,impact,null)
			S.start()
		if(!ammo_count && loc)
			qdel(src) //deleted after last minirocket is fired and impact the ground.

/obj/structure/ship_ammo/minirocket/show_loaded_desc(mob/user)
	if(ammo_count)
		return "It's loaded with \a [src] containing [ammo_count] minirocket\s."

/obj/structure/ship_ammo/minirocket/get_examine_text(mob/user)
	. = ..()
	. += "It has [ammo_count] minirocket\s."


/obj/structure/ship_ammo/minirocket/incendiary
	name = "\improper M18 70mm incendiary rocket"
	desc = "While a part of the Banshee 70 family of 70mm munitions, by a quirk of the casing design it is also backwards compatible with the Mk. 10 Zeus rocket system."
	icon_state = "minirocket_inc"
	point_cost = 500
	fire_mission_delay = 3 //high cooldown

/obj/structure/ship_ammo/minirocket/incendiary/detonate_on(turf/impact)
	..()
	spawn(5)
		fire_spread(impact, create_cause_data(initial(name), source_mob), 3, 25, 20, "#EE6515")

/obj/structure/ship_ammo/sentry
	name = "\improper A/C-49-P Air Deployable Sentry"
	desc = "An omni-directional sentry, capable of defending an area from lightly armored hostile incursion. Can be loaded into the LAG-14 Internal Sentry Launcher."
	icon_state = "launchable_sentry"
	equipment_type = /obj/structure/dropship_equipment/weapon/launch_bay
	ammo_count = 1
	max_ammo_count = 1
	ammo_name = "area denial sentry"
	travelling_time = 0 // handled by droppod
	point_cost = 800
	accuracy_range = 0 // pinpoint
	max_inaccuracy = 0
	/// Special structures it needs to break with drop pod
	var/list/breakeable_structures = list(/obj/structure/barricade, /obj/structure/surface/table)

/obj/structure/ship_ammo/sentry/detonate_on(turf/impact)
	var/obj/structure/droppod/equipment/sentry/droppod = new(impact, /obj/structure/machinery/defenses/sentry/launchable, source_mob)
	droppod.special_structures_to_damage = breakeable_structures
	droppod.special_structure_damage = 500
	droppod.drop_time = 5 SECONDS
	droppod.launch(impact)
	qdel(src)

/obj/structure/ship_ammo/sentry/can_fire_at(turf/impact, mob/user)
	for(var/obj/structure/machinery/defenses/def in urange(4, impact))
		to_chat(user, SPAN_WARNING("The selected drop site is too close to another deployed defense!"))
		return FALSE
	if(istype(impact, /turf/closed))
		to_chat(user, SPAN_WARNING("The selected drop site is a sheer wall!"))
		return FALSE
	return TRUE
