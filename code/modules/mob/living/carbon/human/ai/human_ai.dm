GLOBAL_LIST_EMPTY(non_ai_humans)
GLOBAL_LIST_EMPTY(ai_humans)

/mob/living/carbon/human
	var/has_ai = FALSE
	var/datum/human_ai_brain/ai_brain

/mob/living/carbon/human/Initialize(mapload, new_species, ai)
	. = ..()
	if(has_ai)
		ai = TRUE
	if(!ai)
		GLOB.non_ai_humans += src
	else
		real_name = random_name(gender, "Human")
		name = real_name
		//var/datum/preferences/prefs = new
		//prefs.randomize_appearance(src)
		//qdel(prefs)
		GLOB.ai_humans += src
		ai_brain = new(src)
		create_hud()
		a_intent = INTENT_DISARM
		//INVOKE_ASYNC(src)

/mob/living/carbon/human/Destroy(force)
	if(ai_brain)
		GLOB.ai_humans -= src
	else
		GLOB.non_ai_humans -= src
	QDEL_NULL(ai_brain)
	return ..()

/mob/living/carbon/human/proc/process_ai()
	SHOULD_CALL_PARENT(TRUE)
	if(client)
		return FALSE

/mob/living/carbon/human/ai
	has_ai = TRUE
	mob_flags = AI_CONTROLLED

/mob/living/carbon/human/ai/set_species(new_species, default_color)
	. = ..()
	mob_flags |= AI_CONTROLLED

/obj/item/storage/backpack/satchel/ai
	name = "satchel"

/obj/item/storage/backpack/satchel/ai/fill_preset_inventory()
	new /obj/item/reagent_container/hypospray/autoinjector/bicaridine(src)
	new /obj/item/ammo_magazine/rifle(src)
