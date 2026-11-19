/datum/controller/global_vars/Initialize()
	..()
	GLOB.admin_verbs_default += list(
		/datum/admins/proc/setlooccooldoown,
		/datum/admins/proc/toggle_ai,
		/datum/admins/proc/toggle_human_ai,
		/datum/admins/proc/create_human_ai_patrol,
		/client/proc/open_human_ai_management_panel,
		/client/proc/open_human_faction_management_panel,
		/client/proc/open_human_defense_creator_panel,
		/client/proc/create_human_ai,
		/client/proc/fortify_room,
		/client/proc/make_human_ai,
		/datum/admins/proc/create_human_ai_sniper,
		/datum/admins/proc/create_human_ai_machinegunner,
		/client/proc/quick_order_ai_approach,
		/client/proc/quick_order_ai_hold_position,
		/client/proc/place_plastic_explosives,
		/client/proc/toggle_human_ai_tweaks,
		/client/proc/open_human_squad_spawner_panel,
		/client/proc/open_human_ai_spawner_panel,
		/client/proc/toggle_barricade_creation, // Stops cades from being built
	)

	GLOB.admin_verbs_minor_event += list(
		/client/proc/cmd_admin_ground_narrate,
		/client/proc/shakegroundverb,
	)

	GLOB.admin_verbs_server += list(
		/datum/admins/proc/toggle_intro,
	)

	GLOB.admin_verbs_server += list(
		/client/proc/make_human_ai,
	)

/client/add_admin_verbs()
	if(!admin_holder)
		return
	. = ..()
	if(CLIENT_HAS_RIGHTS(src, R_BUILDMODE))
		add_verb(src, list(
			/client/proc/toggle_game_master,
			/client/proc/open_resin_panel,
			/client/proc/open_sound_panel,
			/client/proc/toggle_join_xeno,
			/client/proc/game_master_rename_platoon,
			/client/proc/toggle_vehicle_blockers,
			/client/proc/toggle_ai_xeno_weeding,
			/client/proc/toggle_rappel_menu,
			/client/proc/toggle_fire_support_menu,
			/client/proc/admin_marine_announcement,
			/client/proc/screen_alert_menu,
			/client/proc/enable_fire_support,
			/client/proc/disable_fire_support,
			/client/proc/set_fire_support_points,
			/client/proc/change_callsign,
			/client/proc/set_cooldown,
			/client/proc/toggle_portrait,
			/client/proc/toggle_intro,
			/client/proc/gm_lighting,
			/client/proc/gm_base_lighting,
		))

/client/remove_admin_verbs()
	. = ..()
	remove_verb(src, list(
		/client/proc/toggle_game_master,
		/client/proc/open_resin_panel,
		/client/proc/open_sound_panel,
		/client/proc/toggle_join_xeno,
		/client/proc/game_master_rename_platoon,
		/client/proc/toggle_vehicle_blockers,
		/client/proc/toggle_ai_xeno_weeding,
		/client/proc/toggle_rappel_menu,
		/client/proc/toggle_fire_support_menu,
		/client/proc/admin_marine_announcement,
		/client/proc/screen_alert_menu,
		/client/proc/enable_fire_support,
		/client/proc/disable_fire_support,
		/client/proc/set_fire_support_points,
		/client/proc/change_callsign,
		/client/proc/set_cooldown,
		/client/proc/toggle_portrait,
		/client/proc/toggle_intro,
		/client/proc/gm_lighting,
		/client/proc/gm_base_lighting,
	))
