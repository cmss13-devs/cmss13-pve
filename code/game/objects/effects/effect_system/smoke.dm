/////////////////////////////////////////////
//// SMOKE SYSTEMS
// direct can be optinally added when set_up, to make the smoke always travel in one direction
// in case you wanted a vent to always smoke north for example
/////////////////////////////////////////////

/// Chance that cades block the gas. Smoke spread ticks are calculated very quickly so this has to be high to have a noticeable effect.
#define	BOILER_GAS_CADE_BLOCK_CHANCE 35

/obj/effect/particle_effect/smoke
	name = "smoke"
	icon_state = "smoke"
	opacity = TRUE
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = ABOVE_MOB_LAYER + 0.1 //above mobs and barricades
	var/amount = 2
	var/spread_speed = 1 //time in decisecond for a smoke to spread one tile.
	var/time_to_live = 8
	var/stun_chance = 0
	var/smokeranking = SMOKE_RANK_HARMLESS //Override priority. A higher ranked smoke cloud will displace lower and equal ones on spreading.
	var/xeno_affecting = FALSE
	var/blocked_by_gasmask = TRUE
	var/contact_affects_synths = FALSE
	var/mob/living/carbon/human/human_creature
	var/mob/living/carbon/xenomorph/xeno_creature
	var/datum/internal_organ/lungs/lungs
	var/datum/internal_organ/eyes/eyes
	var/datum/internal_organ/lungs/liver
	var/datum/internal_organ/eyes/kidneys
	var/datum/cause_data/cause_data = null

	//Remove this bit to use the old smoke
	icon = 'icons/effects/96x96.dmi'
	pixel_x = -32
	pixel_y = -32

/obj/effect/particle_effect/smoke/Initialize(mapload, oldamount, datum/cause_data/new_cause_data)
	. = ..()
	if(oldamount)
		amount = oldamount - 1
	if(!istype(new_cause_data))
		if(new_cause_data)
			new_cause_data = create_cause_data(new_cause_data)
		else
			new_cause_data = create_cause_data(name)
	cause_data = new_cause_data
	time_to_live += rand(-1,1)
	START_PROCESSING(SSeffects, src)

/obj/effect/particle_effect/smoke/Destroy()
	. = ..()
	if(opacity)
		set_opacity(0)
	STOP_PROCESSING(SSeffects, src)
	cause_data = null

/obj/effect/particle_effect/smoke/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_pass = PASS_FLAGS_SMOKE

/obj/effect/particle_effect/smoke/process()
	time_to_live--
	if(time_to_live <= 0)
		qdel(src)
		return
	else if(time_to_live == 1)
		if(alpha > 180)
			alpha = 180
		amount = 0
		set_opacity(0)

	apply_smoke_effect(get_turf(src))

/obj/effect/particle_effect/smoke/ex_act(severity)
	if(prob(severity/EXPLOSION_THRESHOLD_LOW * 100))
		qdel(src)

/obj/effect/particle_effect/smoke/Crossed(atom/movable/moveable)
	..()
	if(istype(moveable, /obj/projectile/beam))
		var/obj/projectile/beam/beam = moveable
		beam.damage /= 2
	if(iscarbon(moveable))
		affect(moveable)

/obj/effect/particle_effect/smoke/proc/apply_smoke_effect(turf/cur_turf)
	for(var/mob/living/affected_mob in cur_turf)
		affect(affected_mob)

/obj/effect/particle_effect/smoke/proc/spread_smoke(direction)
	set waitfor = 0

	sleep(spread_speed)
	if(QDELETED(src))
		return

	var/turf/start_turf = get_turf(src)
	if(!start_turf)
		return
	for(var/i in GLOB.cardinals)
		if(direction && i != direction)
			continue
		var/turf/cur_turf = get_step(start_turf, i)
		if(check_airblock(start_turf, cur_turf)) //smoke can't spread that way
			continue
		var/obj/effect/particle_effect/smoke/foundsmoke = locate() in cur_turf // Check for existing smoke and act accordingly
		if(foundsmoke)
			if(foundsmoke.smokeranking <= src.smokeranking)
				qdel(foundsmoke)
			else
				continue
		var/obj/effect/particle_effect/smoke/smoke = new type(cur_turf, amount, cause_data)
		smoke.setDir(pick(GLOB.cardinals))
		smoke.time_to_live = time_to_live
		if(smoke.amount > 0)
			smoke.spread_smoke()


//proc to check if smoke can expand to another turf
/obj/effect/particle_effect/smoke/proc/check_airblock(turf/start_turf, turf/cur_turf)
	if(!cur_turf)
		return FALSE
	if(cur_turf.density)
		return TRUE
	if(prob(BOILER_GAS_CADE_BLOCK_CHANCE))
		var/move_dir = 0
		for(var/obj/structure/obstacle in cur_turf)
			move_dir = get_dir(src, cur_turf)
			if(obstacle.BlockedPassDirs(src, move_dir))
				return TRUE


/obj/effect/particle_effect/smoke/proc/affect(mob/living/carbon/creature)
	if(ishuman(creature))
		human_creature = creature
		lungs = human_creature.internal_organs_by_name["lungs"]
		eyes = human_creature.internal_organs_by_name["eyes"]
		liver = human_creature.internal_organs_by_name["liver"]
		kidneys = human_creature.internal_organs_by_name["kidneys"]
	if(isxeno(creature))
		xeno_creature = creature
	inhalation(creature)
	contact(creature) //anything that affects xenos goes in contact_skin

	/*if (istype(creature))
		return 0
	return 1*/

/obj/effect/particle_effect/smoke/proc/inhalation(mob/living/carbon/creature)
	if(!istype(creature) || issynth(creature) || creature.stat == DEAD)
		return TRUE
	if(isxeno(creature))
		return TRUE
	if(isyautja(creature) && prob(75))
		return TRUE
	if(ishuman(creature))
		if(human_creature.wear_mask && CHECK_BITFIELD(human_creature.wear_mask.flags_inventory, BLOCKGASEFFECT))
			return TRUE
		if(human_creature.head && CHECK_BITFIELD(human_creature.head.flags_inventory, BLOCKGASEFFECT))
			return TRUE

/obj/effect/particle_effect/smoke/proc/contact(mob/living/carbon/creature)
	if(!contact_affects_synths && issynth(creature))
		return
	contact_skin(creature) //anything that affects xenos goes in contact_skin
	contact_eyes(creature)

/obj/effect/particle_effect/smoke/proc/contact_skin(mob/living/carbon/creature)
	if(!xeno_affecting && isxeno(creature))
		return TRUE
	if(ishuman(creature))
		if(human_creature.w_uniform && CHECK_BITFIELD(human_creature.w_uniform.flags_inventory, BLOCKGASEFFECT))
			return TRUE
		if(human_creature.wear_suit && CHECK_BITFIELD(human_creature.wear_suit.flags_inventory, BLOCKGASEFFECT))
			return TRUE

/obj/effect/particle_effect/smoke/proc/contact_eyes(mob/living/carbon/creature)
	if(isxeno(creature))
		return TRUE
	if(ishuman(creature))
		if(human_creature.head && CHECK_BITFIELD(human_creature.head.flags_inventory, COVEREYES))
			return TRUE
		if(human_creature.glasses && CHECK_BITFIELD(human_creature.glasses.flags_inventory, COVEREYES))
			return TRUE
		if(human_creature.wear_mask && CHECK_BITFIELD(human_creature.wear_mask.flags_inventory, COVEREYES))
			return TRUE
		if(human_creature.wear_mask && CHECK_BITFIELD(human_creature.wear_mask.flags_inventory, BLOCKGASEFFECT))
			return TRUE
		if(human_creature.head && CHECK_BITFIELD(human_creature.head.flags_inventory, BLOCKGASEFFECT))
			return TRUE

/////////////////////////////////////////////
// Bad smoke
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/bad
	time_to_live = 25
	spread_speed = 2
	smokeranking = SMOKE_RANK_LOW
	color = "#adadad"

/obj/effect/particle_effect/smoke/bad/Move()
	. = ..()
	for(var/mob/living/carbon/affected_mob in get_turf(src))
		affect(affected_mob)

/obj/effect/particle_effect/smoke/bad/inhalation(mob/living/carbon/creature)
	if (..())
		return
	else
		if(prob(5))
			creature.drop_held_item()
		creature.apply_damage(1, OXY)
		if(creature.coughedtime != 1)
			creature.coughedtime = 1
			if(ishuman(creature)) //Humans only to avoid issues
				creature.emote("cough")
			addtimer(VARSET_CALLBACK(creature, coughedtime, 0), 2 SECONDS)

/obj/effect/particle_effect/smoke/bad/green
	color = "#288e76ea"

/obj/effect/particle_effect/smoke/bad/red
	color = "#ca3d33e8"

/////////////////////////////////////////////
// Sleep smoke
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/sleepy
	smokeranking = SMOKE_RANK_MED

/obj/effect/particle_effect/smoke/sleepy/Move()
	. = ..()
	for(var/mob/living/carbon/affected_mob in get_turf(src))
		affect(affected_mob)

/obj/effect/particle_effect/smoke/sleepy/inhalation(mob/living/carbon/creature)
	if (..())
		return
	creature.drop_held_item()
	creature:sleeping++
	if(creature.coughedtime != 1)
		creature.coughedtime = 1
		creature.emote("cough")
		addtimer(VARSET_CALLBACK(creature, coughedtime, 0), 2 SECONDS)

/////////////////////////////////////////////
// Phosphorus Gas
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/phosphorus
	time_to_live = 25
	smokeranking = SMOKE_RANK_MED
	color = "#dddddd"
	var/next_cough = 2 SECONDS
	var/burn_damage = 40
	var/applied_fire_stacks = 3
	var/xeno_yautja_reduction = 0.75
	contact_affects_synths = TRUE

//WP mortar-shell smoke
/obj/effect/particle_effect/smoke/phosphorus/strong
	time_to_live = 40
	spread_speed = 0.5
	smokeranking = SMOKE_RANK_HIGH
	next_cough = 5 SECONDS
	applied_fire_stacks = 6

/obj/effect/particle_effect/smoke/phosphorus/weak
	time_to_live = 15
	smokeranking = SMOKE_RANK_MED
	burn_damage = 30
	xeno_yautja_reduction = 0.5

/obj/effect/particle_effect/smoke/phosphorus/Move()
	. = ..()
	for(var/mob/living/carbon/affected_mob in get_turf(src))
		affect(affected_mob)

/obj/effect/particle_effect/smoke/phosphorus/inhalation(mob/living/carbon/creature)
	if (..())
		return
	if(ishuman(creature))
		if(prob(20))
			creature.drop_held_item()
		creature.apply_damage(1, OXY)
		creature.updatehealth()
		creature.coughedtime = world.time + next_cough
		if(creature.coughedtime < world.time)
			creature.emote("cough")

/obj/effect/particle_effect/smoke/phosphorus/contact_skin(mob/living/carbon/creature)
	/*if (..())
		return*/
	//does not fucking care what you are, it will set you on fire
	creature.last_damage_data = cause_data
	if(isyautja(creature) || isxeno(creature))
		burn_damage *= xeno_yautja_reduction
	creature.coughedtime = world.time + next_cough
	if(creature.coughedtime < world.time)
		if(issynth(creature))
			creature.visible_message(SPAN_DANGER("[creature]'s skin is sloughing off!"),\
			SPAN_DANGER("Your skin is sloughing off!"))
	var/reagent = new /datum/reagent/napalm/blue()
	creature.burn_skin(burn_damage)
	creature.adjust_fire_stacks(applied_fire_stacks, reagent)
	creature.IgniteMob()
	creature.updatehealth()

/////////////////////////////////////////////
// CN20 Nerve Gas
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/cn20
	name = "CN20 nerve gas"
	smokeranking = SMOKE_RANK_HIGH
	color = "#80c7e4"
	xeno_affecting = FALSE
	opacity = FALSE
	alpha = 75
	time_to_live = 20
	stun_chance = 20
	var/effect_amt //I don't know what this is or what it means but the code throws errors without it and I'm tired

/obj/effect/particle_effect/smoke/cn20/xeno
	name = "CN20-X nerve gas"
	color = "#2da9da"
	xeno_affecting = TRUE
	stun_chance = 35

/obj/effect/particle_effect/smoke/cn20/Move()
	. = ..()
	for(var/mob/living/carbon/creature in get_turf(src))
		affect(creature)

/obj/effect/particle_effect/smoke/cn20/affect(mob/living/carbon/creature)
	..()
	effect_amt = round(6 + amount*6)

/obj/effect/particle_effect/smoke/cn20/inhalation(mob/living/carbon/creature)
	if(..())
		return
	creature.SetEarDeafness(max(creature.ear_deaf, round(effect_amt*1.5)))
	creature.apply_damage(18, TOX)
	creature.apply_damage(0.75, BRAIN)
	creature.apply_damage(1, OXY)
	lungs.take_damage(1)
	to_chat(creature, SPAN_DANGER("Your body is going numb, almost as if paralyzed!"))
	if(prob(stun_chance))
		creature.apply_effect(1, WEAKEN)
	if(prob(60 + round(amount*15))) //Highly likely to drop items due to arms/hands seizing up
		creature.drop_held_item()
	human_creature.temporary_slowdown = max(human_creature.temporary_slowdown, 4) //One tick every two second
	human_creature.recalculate_move_delay = TRUE
	if(!xeno_creature && creature.coughedtime != 1 && !creature.stat) //Coughing/gasping
		creature.coughedtime = 1
		if(prob(50))
			creature.emote("cough")
		else
			creature.emote("gasp")
		addtimer(VARSET_CALLBACK(creature, coughedtime, 0), 1.5 SECONDS)

/obj/effect/particle_effect/smoke/cn20/contact_skin(mob/living/carbon/creature)
	if(..())
		return
	if(isxeno(creature))
		creature.apply_damage(20, BRUTE)
		xeno_creature.AddComponent(/datum/component/status_effect/interference, 10, 10)
		xeno_creature.blinded = TRUE

/obj/effect/particle_effect/smoke/cn20/contact_eyes(mob/living/carbon/creature)
	if(..())
		return
	to_chat(creature, SPAN_DANGER("Your eyes sting. You can't see!"))
	human_creature.SetEyeBlind(round(effect_amt/3))
	eyes.take_damage(1)

/////////////////////////////////////////////
// ALD-91 LSD Gas
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/LSD
	name = "ALD-91 LSD Gas"
	smokeranking = SMOKE_RANK_HIGH
	color = "#6e006e"
	opacity = FALSE
	alpha = 75
	time_to_live = 20
	stun_chance = 60

/obj/effect/particle_effect/smoke/LSD/Move()
	. = ..()
	for(var/mob/living/carbon/human/human in get_turf(src))
		affect(human)

/obj/effect/particle_effect/smoke/LSD/inhalation(mob/living/carbon/human/creature)
	if(..())
		return
	creature.hallucination += 15
	creature.druggy += 1

	if(prob(stun_chance))
		creature.apply_effect(1, WEAKEN)

/////////////////////////////////////////////
// Tear Gas
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/tear
	name = "Tear Gas"
	smokeranking = SMOKE_RANK_HIGH
	color = "#a82620" // rgb: 179, 16, 8
	alpha = 75
	opacity = FALSE
	time_to_live = 180
	contact_affects_synths = FALSE

/obj/effect/particle_effect/smoke/tear/contact_eyes(mob/living/carbon/creature)
	if(..())
		return
	if(skillcheck(creature, SKILL_POLICE, SKILL_POLICE_SKILLED))
		creature.AdjustEyeBlur(5)
		to_chat(creature, SPAN_WARNING("Your training protects you from the tear gas!"))
	else
		to_chat(creature, SPAN_WARNING("You feel the sting of the tear gas!"))
		creature.AdjustEyeBlur(25)
		creature.AdjustEyeBlind(10)

	creature.emote("scream")
	creature.apply_effect(3, SLOW)

//////////////////////////////////////
// FLASHBANG SMOKE
////////////////////////////////////

/obj/effect/particle_effect/smoke/flashbang
	name = "illumination"
	time_to_live = 4
	opacity = FALSE
	icon_state = "sparks"
	icon = 'icons/effects/effects.dmi'
	smokeranking = SMOKE_RANK_MED

/////////////////////////////////////////
// Acid Runner Smoke, Harmless Visuals only
/////////////////////////////////////////
/obj/effect/particle_effect/smoke/acid_runner_harmless
	color = "#86B028"
	time_to_live = 2
	opacity = FALSE
	alpha = 200
	smokeranking = SMOKE_RANK_HARMLESS
	amount = 0

/////////////////////////////////////////
// BOILER SMOKES
/////////////////////////////////////////

//Xeno acid smoke.
/obj/effect/particle_effect/smoke/xeno_burn
	time_to_live = 12
	color = "#86B028" //Mostly green?
	anchored = TRUE
	spread_speed = 6
	smokeranking = SMOKE_RANK_BOILER
	contact_affects_synths = TRUE
	xeno_affecting = TRUE //it affects hostile hives
	var/hivenumber = XENO_HIVE_NORMAL
	var/gas_damage = 20

/obj/effect/particle_effect/smoke/xeno_burn/Initialize(mapload, amount, datum/cause_data/cause_data)
	if(istype(cause_data))
		var/datum/ui_state/hive_state/cause_data_hive_state = GLOB.hive_state[cause_data.faction]
		var/new_hive_number = cause_data_hive_state?.hivenumber
		if(new_hive_number)
			hivenumber = new_hive_number
			set_hive_data(src, new_hive_number)

	return ..()

/obj/effect/particle_effect/smoke/xeno_burn/apply_smoke_effect(turf/cur_turf)
	..()
	for(var/obj/structure/barricade/barricade in cur_turf)
		barricade.take_acid_damage(XENO_ACID_GAS_BARRICADE_DAMAGE)
		if(prob(75)) // anti sound spam
			playsound(src, pick("acid_sizzle", "acid_hit"), 25)

	for(var/obj/vehicle/multitile/vehicle in cur_turf)
		vehicle.take_damage_type(15, "acid")

	for(var/obj/structure/machinery/m56d_hmg/auto/gun in cur_turf)
		gun.update_health(XENO_ACID_HMG_DAMAGE)

//No effect when merely entering the smoke turf, for balance reasons
/obj/effect/particle_effect/smoke/xeno_burn/Crossed(mob/living/carbon/affected_mob as mob)
	return

/obj/effect/particle_effect/smoke/xeno_burn/affect(mob/living/carbon/creature)
	..()

	if(creature.ally_of_hivenumber(hivenumber))
		return

/obj/effect/particle_effect/smoke/xeno_burn/inhalation(mob/living/carbon/creature)
	if(..())
		return
	creature.apply_damage(gas_damage, BURN) //Inhalation damage
	creature.apply_damage(3, OXY) //Basic oxyloss from "can't breathe"
	if(creature.coughedtime != 1 && !creature.stat) //Coughing/gasping
		creature.coughedtime = 1
		if(prob(50))
			creature.emote("cough")
		else
			creature.emote("gasp")
		addtimer(VARSET_CALLBACK(creature, coughedtime, 0), 1.5 SECONDS)

/obj/effect/particle_effect/smoke/xeno_burn/contact_skin(mob/living/carbon/creature)
	if(..())
		return
	to_chat(creature, SPAN_DANGER("Your skin feels like it is melting away!"))
	if(ishuman(creature))
		human_creature.apply_armoured_damage(amount*rand(15, 20), ARMOR_BIO, BURN) //Burn damage, randomizes between various parts //Amount corresponds to upgrade level, 1 to 2.5
	else
		creature.burn_skin(5) //Failsafe for non-humans
	creature.updatehealth()

//Xeno neurotox smoke.
/obj/effect/particle_effect/smoke/xeno_weak
	time_to_live = 12
	color = "#ffbf58" //Mustard orange?
	spread_speed = 5
	amount = 1 //Amount depends on Boiler upgrade!
	smokeranking = SMOKE_RANK_BOILER
	/// How much neuro is dosed per tick
	var/neuro_dose = 6
	var/msg = "Your skin tingles as the gas consumes you!" // Message given per tick. Changes depending on which species is hit.

//No effect when merely entering the smoke turf, for balance reasons
/obj/effect/particle_effect/smoke/xeno_weak/Crossed(mob/living/carbon/creature as mob)
	return

/obj/effect/particle_effect/smoke/xeno_weak/affect(mob/living/carbon/creature) // This applies every tick someone is in the smoke
	..()
	if(isxeno(creature))
		return
	if(isyautja(creature))
		neuro_dose = neuro_dose*2 // Yautja get half effects
		msg = "You resist the tingling smoke's effects!"
		return
	if(HAS_TRAIT(creature, TRAIT_NESTED) && creature.status_flags & XENO_HOST)
		return


/obj/effect/particle_effect/smoke/xeno_weak/inhalation(mob/living/carbon/creature)
	if(ishuman(creature))
		var/mob/living/carbon/human/H = creature
		if(H.chem_effect_flags & CHEM_EFFECT_RESIST_NEURO)
			return
	var/effect_amt = round(6 + amount*6)
	creature.eye_blurry = max(creature.eye_blurry, effect_amt)
	creature.apply_effect(max(creature.eye_blurry, effect_amt), EYE_BLUR)
	creature.apply_damage(5, OXY) //  Base "I can't breath oxyloss" Slightly more longer lasting then stamina damage
	// reworked code below
	if(!issynth(creature))
		var/datum/effects/neurotoxin/neuro_effect = locate() in creature.effects_list
		if(!neuro_effect)
			neuro_effect = new(creature, cause_data.resolve_mob())
			neuro_effect.strength = effect_amt
		neuro_effect.duration += neuro_dose
		if(creature.coughedtime != 1 && !creature.stat) //Coughing/gasping
			creature.coughedtime = 1
			if(prob(50))
				creature.Slow(1)
				creature.emote("cough")
			else
				creature.emote("gasp")
			addtimer(VARSET_CALLBACK(creature, coughedtime, 0), 1.5 SECONDS)
	else
		msg = "You are consumed by the harmless gas, it is hard to navigate in!"
		creature.apply_effect(SLOW,1)
	to_chat(creature, SPAN_DANGER(msg))

/obj/effect/particle_effect/smoke/xeno_weak_fire
	time_to_live = 16
	color = "#b33e1e"
	spread_speed = 7
	amount = 1
	smokeranking = SMOKE_RANK_BOILER

//No effect when merely entering the smoke turf, for balance reasons
/obj/effect/particle_effect/smoke/xeno_weak_fire/Crossed(mob/living/carbon/creature as mob)
	if(!istype(creature))
		return

	creature.ExtinguishMob()
	. = ..()

/obj/effect/particle_effect/smoke/xeno_weak_fire/affect(mob/living/carbon/creature)
	..()

	if(isxeno(creature))
		return
	if(HAS_TRAIT(creature, TRAIT_NESTED) && creature.status_flags & XENO_HOST)
		return

/obj/effect/particle_effect/smoke/xeno_weak_fire/inhalation(mob/living/carbon/creature)
	var/effect_amt = round(6 + amount*6)

	creature.apply_damage(9, OXY) // MUCH harsher
	creature.SetEarDeafness(max(creature.ear_deaf, round(effect_amt*1.5))) //Paralysis of hearing system, aka deafness
	if(!creature.eye_blind) //Eye exposure damage
		to_chat(creature, SPAN_DANGER("Your eyes sting. You can't see!"))
	creature.SetEyeBlind(round(effect_amt/3))
	if(creature.coughedtime != 1 && !creature.stat) //Coughing/gasping
		creature.coughedtime = 1
		if(prob(50))
			creature.emote("cough")
		else
			creature.emote("gasp")
		addtimer(VARSET_CALLBACK(creature, coughedtime, 0), 1.5 SECONDS)
	if (prob(20))
		creature.apply_effect(1, WEAKEN)

	//Topical damage (neurotoxin on exposed skin)
	to_chat(creature, SPAN_DANGER("Your body is going numb, almost as if paralyzed!"))
	if(prob(40 + round(amount*15))) //Highly likely to drop items due to arms/hands seizing up
		creature.drop_held_item()
	if(ishuman(creature))
		var/mob/living/carbon/human/Human = creature
		Human.temporary_slowdown = max(Human.temporary_slowdown, 4) //One tick every two second
		Human.recalculate_move_delay = TRUE

/obj/effect/particle_effect/smoke/xeno_weak_fire/spread_smoke(direction)
	set waitfor = 0
	sleep(spread_speed)
	if(QDELETED(src))
		return
	var/turf/start_turf = get_turf(src)
	if(!start_turf)
		return
	for(var/i in GLOB.cardinals)
		if(direction && i != direction)
			continue
		var/turf/cur_turf = get_step(start_turf, i)
		if(check_airblock(start_turf, cur_turf)) //smoke can't spread that way
			continue
		var/obj/effect/particle_effect/smoke/foundsmoke = locate() in cur_turf // Check for existing smoke and act accordingly
		if(foundsmoke)
			if(foundsmoke.smokeranking <= smokeranking)
				qdel(foundsmoke)
			else
				continue
		var/obj/effect/particle_effect/smoke/smoke = new type(cur_turf, amount, cause_data)

		for (var/atom/cur_atom in cur_turf)
			if (istype(cur_atom, /mob/living))
				var/mob/living/affected_mob = cur_atom
				affected_mob.ExtinguishMob()
			if(istype(cur_atom, /obj/flamer_fire))
				qdel(cur_atom)

		smoke.setDir(pick(GLOB.cardinals))
		smoke.time_to_live = time_to_live
		if(smoke.amount > 0)
			smoke.spread_smoke()


/////////////////////////////////////////////
// Smoke spread
/////////////////////////////////////////////

/datum/effect_system/smoke_spread
	var/amount = 3
	var/smoke_type = /obj/effect/particle_effect/smoke
	var/direction
	var/lifetime
	var/datum/cause_data/cause_data = null

/datum/effect_system/smoke_spread/Destroy()
	cause_data = null
	. = ..()

/datum/effect_system/smoke_spread/set_up(radius = 2, c = 0, loca, direct, smoke_time, datum/cause_data/new_cause_data)
	if(isturf(loca))
		location = loca
	else
		location = get_turf(loca)
	if(direct)
		direction = direct
	if(smoke_time)
		lifetime = smoke_time
	radius = min(radius, 10)
	amount = radius
	cause_data = istype(new_cause_data) ? new_cause_data : create_cause_data(new_cause_data)

/datum/effect_system/smoke_spread/start()
	if(holder)
		location = get_turf(holder)
	var/obj/effect/particle_effect/smoke/smoke = new smoke_type(location, amount+1, cause_data)
	if(lifetime)
		smoke.time_to_live = lifetime
	if(smoke.amount > 0)
		smoke.spread_smoke(direction)

/datum/effect_system/smoke_spread/bad
	smoke_type = /obj/effect/particle_effect/smoke/bad

/datum/effect_system/smoke_spread/bad/green
	smoke_type = /obj/effect/particle_effect/smoke/bad/green

/datum/effect_system/smoke_spread/bad/red
	smoke_type = /obj/effect/particle_effect/smoke/bad/red

/datum/effect_system/smoke_spread/sleepy
	smoke_type = /obj/effect/particle_effect/smoke/sleepy

/datum/effect_system/smoke_spread/phosphorus
	smoke_type = /obj/effect/particle_effect/smoke/phosphorus

/datum/effect_system/smoke_spread/phosphorus/strong //used by mortar shells
	smoke_type = /obj/effect/particle_effect/smoke/phosphorus/strong

/datum/effect_system/smoke_spread/phosphorus/weak
	smoke_type = /obj/effect/particle_effect/smoke/phosphorus/weak

/datum/effect_system/smoke_spread/cn20
	smoke_type = /obj/effect/particle_effect/smoke/cn20

/datum/effect_system/smoke_spread/cn20/xeno
	smoke_type = /obj/effect/particle_effect/smoke/cn20/xeno

/datum/effect_system/smoke_spread/LSD
	smoke_type = /obj/effect/particle_effect/smoke/LSD

/datum/effect_system/smoke_spread/tear
	smoke_type = /obj/effect/particle_effect/smoke/tear

// XENO SMOKES

/obj/effect/particle_effect/smoke/king
	opacity = FALSE
	color = "#000000"
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks"
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = BELOW_OBJ_LAYER
	time_to_live = 5
	spread_speed = 1
	pixel_x = 0
	pixel_y = 0

/datum/effect_system/smoke_spread/king_doom
	smoke_type = /obj/effect/particle_effect/smoke/king

/datum/effect_system/smoke_spread/xeno_acid
	smoke_type = /obj/effect/particle_effect/smoke/xeno_burn

/datum/effect_system/smoke_spread/xeno_weaken
	smoke_type = /obj/effect/particle_effect/smoke/xeno_weak

/datum/effect_system/smoke_spread/xeno_extinguish_fire
	smoke_type = /obj/effect/particle_effect/smoke/xeno_weak_fire

/datum/effect_system/smoke_spread/xeno_extinguish_fire/start()
	if(holder)
		location = get_turf(holder)
	var/obj/effect/particle_effect/smoke/smoke = new smoke_type(location, amount+1, cause_data)

	for (var/atom/cur_atom in location)
		if (istype(cur_atom, /mob/living))
			var/mob/living/affected_mob = cur_atom
			affected_mob.ExtinguishMob()
		if(istype(cur_atom, /obj/flamer_fire))
			qdel(cur_atom)

	if(lifetime)
		smoke.time_to_live = lifetime
	if(smoke.amount > 0)
		smoke.spread_smoke(direction)
