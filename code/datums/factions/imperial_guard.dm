/datum/faction/imperial_guard
	name = "Imperial Guard"
	faction_tag = FACTION_IMPERIAL_GUARD

/datum/faction/imperial_guard/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_IMP_MEDICAE)
			hud_icon_state = "med"
		if(JOB_IMP_SPECIALIST)
			hud_icon_state = "spec"
		if(JOB_IMP_VOX_OPERATOR)
			hud_icon_state = "vox"
		if(JOB_IMP_TL)
			hud_icon_state = "tl"
		if(JOB_IMP_SL)
			hud_icon_state = "leader"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "imp_[hud_icon_state]")

//Imperial Guard Platoon
	var/datum/squad/squad = H.assigned_squad
	if(istype(squad, /datum/squad/marine/imperial))
		var/squad_clr = H.assigned_squad.equipment_color
		switch(GET_DEFAULT_ROLE(_role))
			if(JOB_SQUAD_MEDIC) hud_icon_state = "med"
			if(JOB_SQUAD_SPECIALIST) hud_icon_state = "spec"
			if(JOB_SQUAD_TEAM_LEADER) hud_icon_state = "tl"
			if(JOB_SQUAD_RTO) hud_icon_state = "rto"
			if(JOB_SQUAD_LEADER) hud_icon_state = "leader"
		if(squad.fireteam_leaders["SQ1"] == H || squad.fireteam_leaders["SQ2"] == H)
			H.langchat_styles = "langchat_smaller_bolded"
		else
			H.langchat_styles = initial(H.langchat_styles)
		H.langchat_color = H.assigned_squad.chat_color

		if(!hud_icon_state) hud_icon_state = H.rank_fallback
		if(hud_icon_state)
			var/image/IMG = image('icons/mob/hud/marine_hud.dmi', H, "hudsquad")
			if(squad_clr)
				IMG.color = squad_clr
			else
				IMG.color = "#5A934A"
			holder.overlays += IMG
			holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "hudsquad_[hud_icon_state]")
		if(H.assigned_squad && H.assigned_fireteam)
			var/image/IMG2 = image('icons/mob/hud/marine_hud.dmi', H, "hudsquad_[H.assigned_fireteam]")
			IMG2.color = squad_clr
			holder.overlays += IMG2
			if(H.assigned_squad.fireteam_leaders[H.assigned_fireteam] == H)
				var/image/IMG3 = image('icons/mob/hud/marine_hud.dmi', H, "hudsquad_ftl")
				IMG3.color = squad_clr
				holder.overlays += IMG3

/datum/faction/kasrkin
	name = "Imperial Kasrkin Elite"
	faction_tag = FACTION_KASRKIN
