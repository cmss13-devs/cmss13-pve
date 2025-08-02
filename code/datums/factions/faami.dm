/datum/faction/faami
	name = "Force d'assistance à l'admission militaire intergalactique"
	faction_tag = FACTION_FAAMI

/datum/faction/faami/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_FAAMI_RIFLE)
			hud_icon_state = "rifle"
		if(JOB_FAAMI_MEDIC)
			hud_icon_state = "medic"
		if(JOB_FAAMI_MG)
			hud_icon_state = "mg"
		if(JOB_FAAMI_TECH)
			hud_icon_state = "tech"
		if(JOB_FAAMI_TL)
			hud_icon_state = "rifle"
		if(JOB_FAAMI_SL)
			hud_icon_state = "sl"
		if(JOB_FAAMI_LT)
			hud_icon_state = "lt"
		if(JOB_FAAMI_SCOUT)
			hud_icon_state = "scout"
		if(JOB_FAAMI_CO)
			hud_icon_state = "co"
		if(JOB_FAAMI_SNIPER)
			hud_icon_state = "sniper"
		if(JOB_FAAMI_ELITE)
			hud_icon_state = "elite"
		if(JOB_FAAMI_ELITE_SL)
			hud_icon_state = "elite_sl"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "faami_[hud_icon_state]")
