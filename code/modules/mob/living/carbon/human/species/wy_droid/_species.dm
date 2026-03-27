// Synth used for W-Y Deathsquads
/datum/species/synthetic/colonial/wy_droid
	name = SYNTH_WY_COMBAT
	name_plural = "W-Y Combat Androids"
	uses_skin_color = FALSE
	special_body_types = FALSE
	mob_inherent_traits = list(TRAIT_SUPER_STRONG, TRAIT_EMOTE_CD_EXEMPT, TRAIT_UNSTRIPPABLE) //No IRON_TEETH because they have no teeth (literally)

	burn_mod = 0.6 //made for combat
	total_health = 250 //made for combat

	hair_color = "#000000"
	icobase = 'icons/mob/humans/species/r_wy_combat_android.dmi'
	deform = 'icons/mob/humans/species/r_wy_combat_android.dmi'

	knock_down_reduction = 5
	stun_reduction = 5
	weed_slowdown_mult = 0 // no slowdown!
	var/emote_panel_type = /datum/droid_emote_panel

/datum/species/synthetic/colonial/wy_droid/handle_death(mob/living/carbon/human/dying_droid)
	playsound(get_turf(dying_droid),"wy_droid_death", 25, FALSE)

/datum/species/synthetic/colonial/wy_droid/handle_on_fire(humanoidmob)
	. = ..()
	INVOKE_ASYNC(humanoidmob, TYPE_PROC_REF(/mob, emote), "pain")

/datum/species/synthetic/colonial/wy_droid/cloaker
	name = "W-Y Combat Android Cloaker"

/datum/species/synthetic/colonial/wy_droid/cloaker/handle_death(mob/living/carbon/human/dying_droid)
	playsound(get_turf(dying_droid),"wy_droid_cloaker_death", 25, FALSE)

/datum/species/synthetic/colonial/wy_droid/non_deathsquad
	name = "W-Y Combat Android (Weaker)"
	burn_mod = 0.8
	brute_mod = 0.8
	total_health = 150

/datum/species/synthetic/colonial/wy_droid/cloaker/non_deathsquad
	name = "W-Y Combat Android Cloaker (Weaker)"
	burn_mod = 0.8
	brute_mod = 0.8
	total_health = 150

/datum/species/synthetic/colonial/wy_droid/handle_post_spawn(mob/living/carbon/human/droid)
	. = ..()
	give_action(droid, /datum/action/droid_emote_panel)
	droid.AddComponent(/datum/component/footstep, 4, 25, 11, 2, "heavy_jackboot")

/datum/species/synthetic/colonial/wy_droid/open_emote_panel()
	var/datum/droid_emote_panel/ui = new emote_panel_type(usr)
	ui.ui_interact(usr)

/datum/action/droid_emote_panel
	name = "Open Voice Synthesizer"
	action_icon_state = "looc_toggle"

/datum/action/droid_emote_panel/can_use_action()
	. = ..()
	if(!.)
		return FALSE

	if(!iswydroid(owner))
		return FALSE

	return TRUE

/datum/action/droid_emote_panel/action_activate()
	. = ..()
	if(!can_use_action())
		return

	var/mob/living/carbon/human/human_owner = owner
	var/datum/species/synthetic/colonial/wy_droid/droid_species = human_owner.species
	droid_species.open_emote_panel()

/datum/droid_emote_panel
	COOLDOWN_DECLARE(panel_emote_cooldown)

/datum/droid_emote_panel/proc/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "DroidEmotes")
		ui.open()

/datum/droid_emote_panel/ui_state(mob/user)
	return GLOB.conscious_state

/datum/droid_emote_panel/ui_data(mob/user)
	var/list/data = list()

	data["on_cooldown"] = !COOLDOWN_FINISHED(src, panel_emote_cooldown)

	return data

/datum/droid_emote_panel/ui_static_data(mob/user)
	var/list/data = list()

	data["categories"] = GLOB.wy_droid_categories
	data["emotes"] = list()

	for(var/datum/emote/living/carbon/human/synthetic/colonial/wy_droid/emote as anything in GLOB.wy_droid_emotes)
		data["emotes"] += list(list(
			"id" = initial(emote.key),
			"text" = (initial(emote.override_say) || initial(emote.say_message)),
			"category" = initial(emote.category),
			"path" = "[emote]",
		))

	return data

/datum/droid_emote_panel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("emote")
			var/datum/emote/living/carbon/human/synthetic/colonial/wy_droid/path
			if(!params["emotePath"])
				return

			path = text2path(params["emotePath"])

			if(!path || !COOLDOWN_FINISHED(src, panel_emote_cooldown))
				return

			if(!(path in subtypesof(/datum/emote/living/carbon/human/synthetic/colonial/wy_droid)))
				return

			COOLDOWN_START(src, panel_emote_cooldown, 2.5 SECONDS)
			usr.emote(initial(path.key))
			return TRUE
