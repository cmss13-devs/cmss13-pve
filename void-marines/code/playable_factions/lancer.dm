/datum/faction/lancer
	name = "Yo-ho-ho we are pirates!"
	faction_tag = FACTION_FREELANCER

/datum/faction/lancer/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_SQUAD_RTO)
			hud_icon_state = "sd"
		if(JOB_SQUAD_LEADER)
			hud_icon_state = "leader_a"
		if(JOB_SQUAD_TEAM_LEADER)
			hud_icon_state = "tl"
		if(JOB_SQUAD_SMARTGUN)
			hud_icon_state = "gun"
		if(JOB_SQUAD_MEDIC)
			hud_icon_state = "med"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "hudsquad_[hud_icon_state]")

	var/datum/squad/squad = H.assigned_squad
	if(istype(squad, /datum/squad/marine/lancer))
		var/squad_clr = H.assigned_squad.equipment_color
		switch(GET_DEFAULT_ROLE(_role))
			if(JOB_SQUAD_MEDIC) hud_icon_state = "med"
			if(JOB_SQUAD_SMARTGUN) hud_icon_state = "gun"
			if(JOB_SQUAD_TEAM_LEADER) hud_icon_state = "tl"
			if(JOB_SQUAD_LEADER) hud_icon_state = "leader_a"

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
