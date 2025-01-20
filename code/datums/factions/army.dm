/datum/faction/army
	name = "United States Army"
	faction_tag = FACTION_ARMY

/datum/faction/army/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_ARMY_TROOPER)
			hud_icon_state = "trpr"
		if(JOB_ARMY_PROPIPE)
			hud_icon_state = "grndr"
		if(JOB_ARMY_GUNNER)
			hud_icon_state = "lmg"
		if(JOB_ARMY_SMARTGUNNER)
			hud_icon_state = "mmg"
		if(JOB_ARMY_MARKSMAN)
			hud_icon_state = "snpr"
		if(JOB_ARMY_ATLOAD)
			hud_icon_state = "atl"
		if(JOB_ARMY_ATFIRE)
			hud_icon_state = "atg"
		if(JOB_ARMY_ENGI)
			hud_icon_state = "cet"
		if(JOB_ARMY_MT)
			hud_icon_state = "mt"
		if(JOB_ARMY_CT)
			hud_icon_state = "ct"
		if(JOB_ARMY_MEDIC)
			hud_icon_state = "cmt"
		if(JOB_ARMY_NCO)
			hud_icon_state = "tl"
		if(JOB_ARMY_SNCO)
			hud_icon_state = "sl"
		if(JOB_ARMY_LT)
			hud_icon_state = "co"
		if(JOB_ARMY_INTEL)
			hud_icon_state = "io"
		if(JOB_ARMY_RESEARCHER)
			hud_icon_state = "rsr"
		if(JOB_ARMY_QM)
			hud_icon_state = "qm"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "army_[hud_icon_state]")
