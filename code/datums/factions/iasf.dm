/datum/faction/iasf
	name = "Imperial Armed Space Force"
	faction_tag = FACTION_IASF

/datum/faction/iasf/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/dogtag/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_TWE_IASF_RIFLEMAN)
			hud_icon_state = "rifleman"
		if(JOB_TWE_IASF_MEDIC)
			hud_icon_state = "medic"
		if(JOB_TWE_IASF_ENGI)
			hud_icon_state = "engi"
		if(JOB_TWE_IASF_SMARTGUNNER)
			hud_icon_state = "smartgunner"
		if(JOB_TWE_IASF_SNIPER)
			hud_icon_state = "sniper"
		if(JOB_TWE_IASF_SPECIALIST)
			hud_icon_state = "spec"
		if(JOB_TWE_IASF_PILOT)
			hud_icon_state = "pilot"
		if(JOB_TWE_IASF_TEAM_LEADER)
			hud_icon_state = "teamleader_alt"
		if(JOB_TWE_IASF_SECTION_LEADER)
			hud_icon_state = "sectionleader_alt"
		if(JOB_TWE_IASF_TROOP_LEADER)
			hud_icon_state = "troopleader_alt"
		if(JOB_TWE_IASF_LIEUTENANT)
			hud_icon_state = "lieutenant"
		if(JOB_TWE_IASF_CAPTAIN)
			hud_icon_state = "captain"
		if(JOB_TWE_IASF_MAJOR)
			hud_icon_state = "major"
		if (JOB_TWE_IASF_GENERAL)
			hud_icon_state = "general"
		if (JOB_TWE_IASF_SYNTH)
			hud_icon_state = "synth"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "iasf_[hud_icon_state]")
