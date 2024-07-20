// XENO
/datum/player_action/change_hivenumber
	action_tag = "xeno_change_hivenumber"
	name = "Change Hivenumber"
	permissions_required = R_SPAWN

/datum/player_action/change_hivenumber/act(client/user, mob/target, list/params)
	if(!params["hivenumber"])
		return

	if(!isxeno(target))
		return

	var/mob/living/carbon/xenomorph/X = target

	X.set_hive_and_update(params["hivenumber"])
	message_admins("[key_name_admin(user)] changed hivenumber of [target] to [params["hivenumber"]].")
	return TRUE
