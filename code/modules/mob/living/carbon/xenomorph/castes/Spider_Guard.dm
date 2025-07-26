/datum/caste_datum/spider_guard //The basic spider enemy
	caste_type = XENO_CASTE_SPIDER_GUARD //For when you want to send a horde of spiders
	tier = 1
	melee_damage_lower = XENO_DAMAGE_TIER_2
	melee_damage_upper = XENO_DAMAGE_TIER_3
	melee_vehicle_damage = XENO_DAMAGE_TIER_2
	max_health = XENO_HEALTH_TIER_1
	plasma_gain = XENO_PLASMA_GAIN_TIER_8
	plasma_max = XENO_PLASMA_TIER_10
	xeno_explosion_resistance = XENO_EXPLOSIVE_ARMOR_TIER_1
	armor_deflection = XENO_ARMOR_TIER_1
	evasion = XENO_EVASION_MEDIUM
	speed = XENO_SPEED_HELLHOUND

	caste_desc = "A guard of the cluster."
	evolves_to = list() //XENO_CASTE_SPIDER_NURSE, XENO_CASTE_SPIDER_HUNTER
	deevolves_to = list()

	tackle_min = 3
	tackle_max = 4
	tackle_chance = 40
	tacklestrength_min = 4
	tacklestrength_max = 4

	heal_resting = 2
	heal_standing = 1
	heal_knocked_out = 1.5
	innate_healing = TRUE

	minimap_icon = "xeno"

/mob/living/carbon/xenomorph/spider_guard
	caste_type = XENO_CASTE_SPIDER_GUARD
	name = XENO_CASTE_SPIDER_GUARD
	desc = "A giant arachnoid, furry and black. It makes you shudder to look at it. This one has deep red eyes."
	icon = 'icons/mob/xenos/spider_guard.dmi'
	icon_size = 48
	icon_state = "Spider Guard Running"
	plasma_types = list(PLASMA_CHITIN)
	tier = 1

	speaking_noise = "hiss_talk"

	slash_verb = "bite"
	slashes_verb = "bites"
	slash_sound = 'sound/weapons/bite.ogg'

	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/onclick/regurgitate,

		/datum/action/xeno_action/activable/pounce/runner,
	)
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)
	gib_chance = 50
	claw_type = CLAW_TYPE_SHARP
	pull_multiplier = 0.4 /// Pretty much no pull delay, for those quick drags.

	acid_blood_damage = 0 /// it's a spider innit
	acid_blood_spatter = FALSE /// We dont want that for these guys

	icon_xeno = 'icons/mob/xenos/spider_guard.dmi'
	icon_xenonid = 'icons/mob/xenos/spider_guard.dmi'

	weed_food_icon = 'icons/mob/xenos/weeds.dmi'
	weed_food_states = list("Hellhound_1","Hellhound_2","Hellhound_3")
	weed_food_states_flipped = list("Hellhound_1","Hellhound_2","Hellhound_3")

/mob/living/carbon/xenomorph/spider_guard/death(cause, gibbed)
	var/msg = "lets out a rattle as it collapses, legs siezing up..."
	. = ..(cause, gibbed, msg)
	if(!.)
		return
	playsound(loc,'sound/voice/pred_click1.ogg', 25, TRUE)

/mob/living/carbon/xenomorph/spider_guard/handle_blood_splatter(splatter_dir)
	new /obj/effect/temp_visual/dir_setting/bloodsplatter/yautjasplatter(loc, splatter_dir)

	target_unconscious = FALSE
