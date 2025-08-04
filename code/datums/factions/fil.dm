/datum/faction/fil
	name = "Légion interstellaire française"
	faction_tag = FACTION_FIL

/datum/faction/fil/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_FIL_RIFLE)
			hud_icon_state = "rifle"
		if(JOB_FIL_AUX)
			hud_icon_state = "aux"
		if(JOB_FIL_AUX_SL)
			hud_icon_state = "aux_sl"
		if(JOB_FIL_MEDIC)
			hud_icon_state = "medic"
		if(JOB_FIL_MG)
			hud_icon_state = "mg"
		if(JOB_FIL_TECH)
			hud_icon_state = "tech"
		if(JOB_FIL_TL)
			hud_icon_state = "rifle"
		if(JOB_FIL_SL)
			hud_icon_state = "sl"
		if(JOB_FIL_LT)
			hud_icon_state = "lt"
		if(JOB_FIL_SCOUT)
			hud_icon_state = "scout"
		if(JOB_FIL_CO)
			hud_icon_state = "co"
		if(JOB_FIL_SNIPER)
			hud_icon_state = "sniper"
		if(JOB_FIL_ELITE)
			hud_icon_state = "elite"
		if(JOB_FIL_ELITE_SL)
			hud_icon_state = "elite_sl"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "fil_[hud_icon_state]")
