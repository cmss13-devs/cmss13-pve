
GLOBAL_DATUM_INIT(simulation_controller, /datum/simulation_controller, new)

/datum/simulation_controller
	var/list/non_completed_simulations = list(
		"desert_dam" = list(list(61, 194, 3), list(98, 194, 3), list(135, 194, 3)),
		"varadero" = list(list(24, 162, 3), list(58, 162, 3), list(92, 162, 3)),
		"ice_colony" = list(list(19, 128, 3), list(55, 128, 3), list(91, 128, 3)),
		"chances_claim" = list(list(23, 86, 3), list(61, 86, 3), list(99, 86, 3)),
		"corsat" = list(list(58, 13, 3), list(119, 13, 3), list(152, 52, 3)),
		"final" = list(list(19, 54, 3)),
	)
	var/list/next_simulation = list(24, 194, 3)
	var/list/non_completed_cutscenes = list("2", "3", "4", "5", "6")
	var/next_cutscene = ""
	var/current_cutscene_completed = FALSE
	var/everyone_already_koed
	var/list/fate_list = list()
	var/list/dead_list = list()

/proc/ko_everyone()
	for(var/mob/living/carbon/human/human as anything in GLOB.alive_human_list)
		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(ko_single_mob), human)

/client/proc/ko_everyone_verb()
	set name = "KO Everyone"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	if(tgui_input_list(src, "Are you sure you want to KO everyone", "KO?", list("yes", "no")) != "yes")
		return

	ko_everyone()

/proc/ko_single_mob(mob/living/carbon/human/human)
	to_chat(human, SPAN_WARNING("Your eyelids start to grow heavy."))
	human.clear_fullscreens()
	var/atom/movable/screen/fullscreen/overlay_screen = human.overlay_fullscreen("simulacrum_ko", /atom/movable/screen/fullscreen/impaired)
	overlay_screen.icon_state = "impairedoverlay1"
	sleep(5 SECONDS)
	to_chat(human, SPAN_WARNING("For once, you're given a moment to rest."))
	overlay_screen.icon_state = "impairedoverlay3"
	sleep(12 SECONDS)
	to_chat(human, SPAN_WARNING("Not even the turbulence of atmospheric flight can dash off the prospect of peaceful sleep."))
	overlay_screen.icon_state = "impairedoverlay5"
	sleep(10 SECONDS)
	overlay_screen.icon_state = "impairedoverlay6"
	sleep(10 SECONDS)
	to_chat(human, SPAN_BOLD("Your eyes shut fully, and your mind revels in the sudden slackness of your body."))
	overlay_screen.icon_state = "impairedoverlay7"
	human.Stun(100000000)
	human.loc = null
	human.SetEyeBlind(100000000)
	save_human(human)
	human.ghost_locked = TRUE
	human.hudswitch_blocked = TRUE
	human.hud_used.show_hud(HUD_STYLE_NOHUD, human)
	message_admins("close inventories now")
	sleep(5 SECONDS)
	if(human.client) // devious shenanigans
		winset(human.client, "mainwindow.split", "splitter=1000")
		winset(human.client, "infowindow", "is-visible=false")
		winset(human.client, "outputwindow", "is-visible=false")
	simulacrum_text_ending_bad(human)

/mob/living/carbon/human
	var/ghost_locked = FALSE

/mob/living/carbon/human/do_ghost()
	if(ghost_locked)
		to_chat(src, SPAN_BOLDWARNING("You cannot leave your corpse at this time."))
		return
	return ..()


/client/proc/end_game_bad()
	set name = "Game End"
	set category = "Admin.Simulation"

	if(!check_rights(R_ADMIN))
		return

	if(tgui_input_list(src, "Are you sure you want to end the game badly?", "End game?", list("yes", "no")) != "yes")
		return

	for(var/savename in GLOB.simulacrum_playersaves	)
		var/datum/simulacrum_humansave/save = GLOB.simulacrum_playersaves[savename]
		save.tied_human.rejuvenate()
		save.tied_human.clear_fullscreens()
		var/atom/movable/screen/fullscreen/overlay_screen = save.tied_human.overlay_fullscreen("simulacrum_ko", /atom/movable/screen/fullscreen/impaired)
		overlay_screen.icon_state = "impairedoverlay7"
		save.tied_human.Stun(100000000)
		save.tied_human.loc = null
		save.tied_human.SetEyeBlind(100000000)
		save.tied_human.hudswitch_blocked = TRUE
		save.tied_human.hud_used.show_hud(HUD_STYLE_NOHUD, save.tied_human)

		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(simulacrum_text_ending_bad), save.tied_human)

/client/proc/close_all_inventories()
	set name = "Close All Inventories"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	for(var/savename in GLOB.simulacrum_playersaves)
		var/datum/simulacrum_humansave/save = GLOB.simulacrum_playersaves[savename]
		for(var/obj/item/storage/SI in get_recursive_contents(save.tied_human))
			SI.storage_close(save.tied_human)

	to_chat(src, SPAN_NOTICE("Inventories closed."))
