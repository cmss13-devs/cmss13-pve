/datum/faction/uacg
	name = "United Americas Colonial Guard"
	faction_tag = FACTION_UACG

/datum/faction/uacg/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_UACG_TECH)
			hud_icon_state = "uacg_tech"
		if(JOB_UACG_MEDIC)
			hud_icon_state = "uacg_medic"
		if(JOB_UACG_LEAD)
			hud_icon_state = "uacg_lead"
		if(JOB_UACG_OFFICER)
			hud_icon_state = "uacg_officer"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "uacg_[hud_icon_state]")
