/obj/item/pamphlet
	name = "instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge."
	icon = 'icons/obj/items/pamphlets.dmi'
	icon_state = "pamphlet_written"
	item_state = "pamphlet_written"
	w_class = SIZE_TINY
	throw_speed = SPEED_FAST
	throw_range = 20
	var/datum/character_trait/trait = /datum/character_trait
	var/flavour_text = "You read over the pamphlet a few times, learning a new skill."
	var/bypass_pamphlet_limit = FALSE

/obj/item/pamphlet/Initialize()
	. = ..()

	trait = GLOB.character_traits[trait]

/obj/item/pamphlet/attack_self(mob/living/carbon/human/user)
	..()

	if(!can_use(user))
		return
	on_use(user)

	qdel(src)

/obj/item/pamphlet/proc/can_use(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE
	if(trait in user.traits)
		to_chat(user, SPAN_WARNING("You know this already!"))
		return FALSE
	if(user.has_used_pamphlet == TRUE && !bypass_pamphlet_limit)
		to_chat(user, SPAN_WARNING("You've already used a pamphlet!"))
		return FALSE
	return TRUE

/obj/item/pamphlet/proc/on_use(mob/living/carbon/human/user)
	to_chat(user, SPAN_NOTICE(flavour_text))
	trait.apply_trait(user)
	if(!bypass_pamphlet_limit)
		user.has_used_pamphlet = TRUE

/obj/item/pamphlet/skill/medical
	name = "medical instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has a medical insignia."
	icon_state = "pamphlet_medical"
	trait = /datum/character_trait/skills/medical

/obj/item/pamphlet/skill/engineer
	name = "engineer instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has an engineering insignia."
	icon_state = "pamphlet_construction"
	trait = /datum/character_trait/skills/miniengie

/obj/item/pamphlet/skill/jtac
	name = "JTAC instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has the image of a radio on it."
	icon_state = "pamphlet_jtac"
	trait = /datum/character_trait/skills/jtac

/obj/item/pamphlet/skill/spotter
	name = "Spotter instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has the image of a pair of binoculars on it."
	icon_state = "pamphlet_spotter"
	trait = /datum/character_trait/skills/spotter
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/skill/spotter/can_use(mob/living/carbon/human/user)
	if(user.job != JOB_SQUAD_MARINE)
		to_chat(user, SPAN_WARNING("Only squad riflemen can use this."))
		return
	var/obj/item/card/id/ID = user.get_idcard()
	if(!ID) //not wearing an ID
		to_chat(user, SPAN_WARNING("You should wear your ID before doing this."))
		return FALSE
	if(!ID.check_biometrics(user))
		to_chat(user, SPAN_WARNING("You should wear your ID before doing this."))
		return FALSE

	return ..()

/obj/item/pamphlet/skill/spotter/on_use(mob/living/carbon/human/user)
	. = ..()
	user.rank_fallback = "ass"
	user.hud_set_squad()

	var/obj/item/card/id/ID = user.get_idcard()
	ID.set_assignment((user.assigned_squad ? (user.assigned_squad.name + " ") : "") + "Spotter")
	GLOB.data_core.manifest_modify(user.real_name, WEAKREF(user), "Spotter")

/obj/item/pamphlet/skill/loader
	name = "Loader instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has the image of a rocket on it."
	icon_state = "pamphlet_loader"
	trait = /datum/character_trait/skills/loader
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/skill/loader/can_use(mob/living/carbon/human/user)
	if(user.job != JOB_SQUAD_MARINE)
		to_chat(user, SPAN_WARNING("Only squad riflemen can use this."))
		return
	var/obj/item/card/id/ID = user.get_idcard()
	if(!ID) //not wearing an ID
		to_chat(user, SPAN_WARNING("You should wear your ID before doing this."))
		return FALSE
	if(!ID.check_biometrics(user))
		to_chat(user, SPAN_WARNING("You should wear your ID before doing this."))
		return FALSE
	return ..()

/obj/item/pamphlet/skill/loader/on_use(mob/living/carbon/human/user)
	. = ..()
	user.rank_fallback = "load"
	user.hud_set_squad()

	var/obj/item/card/id/ID = user.get_idcard()
	ID.set_assignment((user.assigned_squad ? (user.assigned_squad.name + " ") : "") + "Loader")
	GLOB.data_core.manifest_modify(user.real_name, WEAKREF(user), "Loader")

/obj/item/pamphlet/skill/machinegunner
	name = "heavy machinegunner instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has an engineering and a machinegun insignia."
	icon_state = "pamphlet_machinegunner"
	trait = /datum/character_trait/skills/engineering
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/skill/powerloader
	name = "powerloader instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has a powerloader insignia. The title reads 'Moving freight and squishing heads - a practical guide to Caterpillar P-5000 Work Loader'."
	icon_state = "pamphlet_powerloader"
	trait = /datum/character_trait/skills/powerloader
	/// it's really not necessary to stop people from learning powerloader skill
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/skill/police
	name = "Policing instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has the image of a radio on it."
	icon_state = "pamphlet_jtac"
	trait = /datum/character_trait/skills/police
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/skill/surgery
	name = "Surgery instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has a medical insignia."
	icon_state = "pamphlet_medical"
	trait = /datum/character_trait/skills/surgery
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/skill/intel
	name = "field intelligence instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge. This one has an intelligence insignia."
	icon_state = "pamphlet_reading"
	trait = /datum/character_trait/skills/intel
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/language
	name = "translation pamphlet"
	desc = "A pamphlet used by lazy USCM interpreters to quickly learn new languages on the spot."
	flavour_text = "You go over the pamphlet, learning a new language."
	bypass_pamphlet_limit = TRUE

/obj/item/pamphlet/language/russian
	name = "Printed Copy of Pari"
	desc = "Pari, also known as 'The Bet' in English, is a short story written by Russian playwright Anton Chekhov about a bet between a lawyer and a banker; the banker wagers that the lawyer cannot remain in solitary confinement for 15 years, and promises 2 million rubles in exchange. You must be a refined reader if you know this one; why are you even in the USCM if you know that?"
	trait = /datum/character_trait/language/russian

/obj/item/pamphlet/language/japanese
	name = "Pages of Turedobando Yohei Adobencha Zohuken"
	desc = "These are some torn pages from a famous isekai manga named 'Turedobando Yohei Adobencha Zohuken' or Japanese Mercenary Adventure Sequel about a travelling band of Freelancers sent into a fantasy world. Why do you even know this?"
	trait = /datum/character_trait/language/japanese

/obj/item/pamphlet/language/chinese
	name = "Pages from the Little Red Book"
	desc = "没有共产党就没有新中国! Pages from the handbook to starting a famine that kills over 100 million of your people. Apparently this will help you learn Chinese."
	trait = /datum/character_trait/language/chinese

/obj/item/pamphlet/language/german
	name = "Translated Lyrics to 99 Luftballons"
	desc = "These hastily scribbled translations of 99 Luftballons, an iconic German hit of the 80s, were meant for the yearly Battalion Karaoke Night. I guess you can get some better use out of this."
	trait = /datum/character_trait/language/german

/obj/item/pamphlet/language/spanish
	name = "America Latina - A Quick Translation Guide for Southern UA states"
	desc = "This pamphlet was designed for Intelligence Officers operating on Earth to interact with the local populaces of the Latin American states, but only for IOs who managed to sleep through Dialects and Mannerisms Class."
	trait = /datum/character_trait/language/spanish

/obj/item/pamphlet/language/filipino
	name = "Simples phrases in Filipino"
	desc = "This pamphlet teaches you Filipino."
	trait = /datum/character_trait/language/filipino

/obj/item/pamphlet/language/french
	name = "Simples phrases in French"
	desc = "This pamphlet teaches you French."
	trait = /datum/character_trait/language/french

/obj/item/pamphlet/language/portuguese
	name = "Simples phrases in Portuguese."
	desc = "This pamphlet teaches you Portuguese."
	trait = /datum/character_trait/language/portuguese

/obj/item/pamphlet/language/polish
	name = "Simples phrases in Polish"
	desc = "This pamphlet teaches you Polish."
	trait = /datum/character_trait/language/polish

/obj/item/pamphlet/language/ruspatois
	name = "Simples phrases in Russian patois"
	desc = "This pamphlet teaches you Russian patois."
	trait = /datum/character_trait/language/ruspatois

/obj/item/pamphlet/language/scandinavian
	name = "Simples phrases in various Scandinavian languages."
	desc = "This pamphlet teaches you Scandinavian."
	trait = /datum/character_trait/language/scandinavian

//Restricted languages, spawnable for events.

/obj/item/pamphlet/language/yautja
	name = "stained parchment"
	desc = "A yellowed old piece of parchment covered in strange runes from an alien writing system. The letters seem to shift back and forth into place before your eyes."
	trait = /datum/character_trait/language/sainja

/obj/item/pamphlet/language/xenomorph
	name = "Xenobiologist's file"
	desc = "A xenobiologist's document recording and detailing observations on captive Xenomorph communication via vocalisations and pheromones, as well as notes on attempting to reproduce them by human beings."
	trait = /datum/character_trait/language/xenomorph

/obj/item/pamphlet/language/monkey
	name = "scribbled drawings"
	gender = PLURAL
	desc = "A piece of paper covered in crude depictions of bananas and various types of primates. Probably drawn by a three-year-old child - or an unusually intelligent marine."
	trait = /datum/character_trait/language/primitive


/obj/item/pamphlet/trait
	bypass_pamphlet_limit = TRUE
	/// What trait to give the user
	var/trait_to_give

/obj/item/pamphlet/trait/can_use(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE

	if(HAS_TRAIT(user, trait_to_give))
		to_chat(user, SPAN_WARNING("You know this already!"))
		return FALSE

	if(!(user.job in JOB_SQUAD_ROLES_LIST))
		to_chat(user, SPAN_WARNING("Only squad riflemen can use this."))
		return FALSE

	if(user.has_used_pamphlet && !bypass_pamphlet_limit)
		to_chat(user, SPAN_WARNING("You've already used a pamphlet!"))
		return FALSE

	return TRUE

/obj/item/pamphlet/trait/on_use(mob/living/carbon/human/user)
	to_chat(user, SPAN_NOTICE(flavour_text))
	ADD_TRAIT(user, trait_to_give, "pamphlet")
	if(!bypass_pamphlet_limit)
		user.has_used_pamphlet = TRUE

/obj/item/pamphlet/trait/vulture
	name = "\improper M707 instructional pamphlet"
	desc = "A pamphlet used to quickly impart vital knowledge of how to shoot big guns and spot for them."
	icon_state = "pamphlet_vulture"
	trait_to_give = TRAIT_VULTURE_USER
