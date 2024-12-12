/datum/human_ai_faction
	var/faction = FACTION_NEUTRAL
	VAR_PROTECTED/shoot_to_kill = TRUE

	VAR_PROTECTED/list/enter_combat_lines = list()
	VAR_PROTECTED/list/exit_combat_lines = list()
	VAR_PROTECTED/list/squad_member_death_lines = list()
	VAR_PROTECTED/list/grenade_thrown_lines = list()
	VAR_PROTECTED/list/reload_lines = list()
	VAR_PROTECTED/list/reload_internal_mag_lines = list()
	VAR_PROTECTED/list/need_healing_lines = list()

	VAR_PROTECTED/list/friendly_factions = list()
	VAR_PROTECTED/list/neutral_factions = list()

/datum/human_ai_faction/proc/apply_faction_data(datum/human_ai_brain/brain)
	if(length(enter_combat_lines))
		brain.enter_combat_lines = enter_combat_lines

	if(length(exit_combat_lines))
		brain.exit_combat_lines = exit_combat_lines

	if(length(squad_member_death_lines))
		brain.squad_member_death_lines = squad_member_death_lines

	if(length(grenade_thrown_lines))
		brain.grenade_thrown_lines = grenade_thrown_lines

	if(length(reload_lines))
		brain.reload_lines = reload_lines

	if(length(reload_internal_mag_lines))
		brain.reload_internal_mag_lines = reload_internal_mag_lines

	if(length(need_healing_lines))
		brain.need_healing_lines = need_healing_lines

	brain.shoot_to_kill = shoot_to_kill
	brain.friendly_factions = friendly_factions
	brain.neutral_factions = neutral_factions

/datum/human_ai_faction/proc/reapply_faction_data()
	for(var/datum/human_ai_brain/brain in GLOB.human_ai_brains)
		if(brain.tied_human?.faction == faction)
			apply_faction_data(brain)

/datum/human_ai_faction/proc/add_friendly_faction(faction)
	if(faction in friendly_factions)
		return
	friendly_factions += faction
	if(faction in neutral_factions)
		neutral_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/add_neutral_faction(faction)
	if(faction in neutral_factions)
		return
	neutral_factions += faction
	if(faction in friendly_factions)
		friendly_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/remove_friendly_faction(faction)
	if(!(faction in friendly_factions))
		return
	friendly_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/remove_neutral_faction(faction)
	if(!(faction in neutral_factions))
		return
	neutral_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/get_friendly_factions()
	return friendly_factions

/datum/human_ai_faction/proc/get_neutral_factions()
	return neutral_factions

/datum/human_ai_faction/proc/set_shoot_to_kill(new_kill = TRUE)
	shoot_to_kill = new_kill
	reapply_faction_data()

/datum/human_ai_faction/proc/get_shoot_to_kill()
	return shoot_to_kill

/datum/human_ai_faction/clf
	faction = FACTION_CLF
	friendly_factions = list(
		FACTION_COLONIST,
	)
	enter_combat_lines = list(
		"You will never defeat us!",
		"I will kill you!",
		"You'll never take our homeland!",
		"For the colonies!",
		"Free colony!",
		"We will triumph over these infidels!",
		"Attack!",
		"Charge!",
		"Die with freedom!",
		"Wipe 'em out!",
		"Run for your life! You little...!",
		"You haven't got enough yet?!",
		"Die! You bastard!",
		"Damn rat!",
		"Victory is ours!",
		"No mercy!",
		"There will be no mercy for you!",
		"Die!",
		"We will die trying to protect our homes!",
		"Give up!",
		"For the cause!",
		"'Till our last breath!",
	)
	exit_combat_lines = list(
		"Where are they.",
		"There's no one here.",
		"The enemy is quiet.",
		"It's quiet.",
		"There may be more.",
		"Quiet now...!",
		"Are we done yet?",
		"We live to fight again.",
		"Where are they now?",
	)
	squad_member_death_lines = list(
		"Get back! Get back!",
		"I'm sorry...",
		"Shoot! Run!",
		"Get away!",
		"Forgive me...!",
		"This is for our colony!",
		"I will avenge you!",
		"Time for payback!",
		"Not good!",
		"Damn!",
	)
	grenade_thrown_lines = list(
		"EAT THIS!",
		"Grenade!",
		"Throwing bomb!",
		"*warcry",
		"This is for you, invader!",
	)

/datum/human_ai_faction/uscm
	faction = FACTION_MARINE
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_WY,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_UPP,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"*warcry",
		"Come and get it!",
		"Bring them down!",
		"This time, it's war!",
		"Light 'em up!",
		"Let's rock!",
		"Contact!",
		"Shoot! Contact!",
		"I got contact!",
		"Tango, dead ahead!",
		"Bring it on!",
		"Bring it on, BRING IT ON!",
		"Enemy on approach!",
		"Don't mess with me!",
		"Look alive!",
		"Look alive, tango!",
		"They're making a move!",
		"We got activity!",
		"I've got hostiles!",
		"Hostiles!",
		"Engaging hostiles!",
		"Hostile spotted!",
		"Hostiles forces here!",
		"Got 'em in my sights!",
		"You see what I see?",
		"There!",
		"Over there!",
		"There's one!",
		"Engaging!",
		"Take them down!",
		"Target in sight!",
		"Weapons hot!",
		"Drop 'em!",
		"I got company!",
		"Kill that bastard!",
		"Come get some!",
	)
	exit_combat_lines = list(
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Clear.",
		"Check your vitals.",
		"Take a breather now...",
		"Sound off...!",
		"Don't mess with me.",
		"Oorah...",
		"I don't hear them. We're clear.",
		"Another day in the corps...",
		"Nothing around here.",
		"Don't get too comfortable now.",
		"Contacts silent.",
		"No hostiles located, resuming positions.",
		"No threats remaining.",
	)
	squad_member_death_lines = list(
		"Soldier's gone!",
		"I don't believe this!",
		"I didn't sign up for this!",
		"Man down!",
		"Damn it!",
		"Squad member KIA!",
	)
	reload_lines = list(
		"Reloading!",
		"Shoot-! I'm out!",
		"Changing mag.",
		"Changing mag!",
		"I'm dry! Reloading!",
	)
	reload_internal_mag_lines = list(
		"Reloading!",
		"Shoot-! I'm out!",
		"Watch my back, I'm reloading!",
	)
	grenade_thrown_lines = list(
		"*warcry",
		"Grenade!",
		"Throwing grenade!",
		"Throwing a 'nade!",
		"Primed! Clear blast!",
		"Eat this!",
		"It's gonna get loud!",
	)

/datum/human_ai_faction/upp
	faction = FACTION_UPP
	friendly_factions = list(
		FACTION_COLONIST,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MARINE,
		FACTION_MERCENARY,
		FACTION_TWE,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list( // zonenote: tweak these. They're entirely the stereotype of "communist russkie" when we can do better than that. also languages
		"*warcry",
		"For the UPP!",
		"Die, you animal!",
		"Capitalist dog!",
		"Shoot them!",
		"For glorious Union!",
		"Attacking!",
		"We will bury them!",
		"Uraaaa!!",
		"URAAA!!",
		"To your last breath!",
		"You're worth nothing!",
		"This is the end, for you!",
		"Die!",
	)
	exit_combat_lines = list(
		"I need a break...",
		"Phew, that was tough work.",
		"I think we can stop shooting now?",
		"One step closer to victory!",
		"Finally, break time.",
	)
	squad_member_death_lines = list(
		"Man down!",
		"Comrade!!",
		"Get together!",
		"Damn!",
		"Taking hits!",
	)
	need_healing_lines = list(
		"Doctor!",
		"*medic",
	)


/datum/human_ai_faction/wy
	faction = FACTION_WY
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_MARINE,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"I got 'em!",
		"I have 'em!",
		"Hostile spotted!",
		"Hostile spotted, engaging!",
		"Waste them!",
		"Needing assistance here.",
		"Contact!",
		"Contact, hostile!",
		"Contact contact!",
		"We got contact!",
		"Enemy!",
		"Enemy in sight!",
		"Enemy spotted!",
		"You...!",
		"Visual on target.",
		"Back me up.",
		"Target!",
		"Target ahead!",
		"Target identified!",
		"Target sighted!",
		"There, there!",
		"Engaging.",
		"Engaging!",
		"Weapons free.",
		"Open fire.",
		"Found 'em.",
		"Fire at will!",
		"Lock and load!",
		"Eyes up- enemy sighted!",
		"Safeties off.",
		"Game on!",
		"Open fire!",
		"Got eyes on!",
	)
	exit_combat_lines = list(
		"Negative on hostiles.",
		"Location is quiet.",
		"No visuals on enemy targets.",
		"Observing this location.",
		"Stay sharp.",
		"Not done yet...",
		"Area should be secure.",
		"Target lost.",
		"Lost the target.",
	)
	squad_member_death_lines = list(
		"This sector isn't secure!",
		"Friendly has expired.",
		"Requesting immediate assistance!",
		"We need help here!",
		"Requesting support!",
		"We're down one.",
		"Facing resistance here.",
		"Friendly's FUBAR, defensive positions!",
	)
	reload_lines = list(
		"Reloading.",
		"Reloading!",
		"Reloading now!",
		"Cover me, I'm reloading.",
		"It's dry, watch my back.",
		"I'm out, exchanging mags.",
		"Ammo dry. I need to reload.",
		"Mag's dry, filling up now.",
		"Shoot-! I'm out!",
		"*sigh",
	)
	reload_internal_mag_lines = list(
		"Reloading.",
		"Reloading!",
		"Reload, cover!",
		"Ammo out!",
		"It's out.",
		"All dry, cover me.",
		"*sigh",
		"Grr... give me time.",
	)
	grenade_thrown_lines = list(
		"Grenade out!",
		"Throwing a grenade!",
		"Fire in the hole!",
		"Grenade- cover!",
		"Bite on this!",
		"It's gonna get loud!",
		"Pineapple- up!",
		"Clear blast!",
		"Heads up!",
		"Catch!",
	)

/datum/human_ai_faction/wy/pmc
	faction = FACTION_PMC

/datum/human_ai_faction/wy_deathsquad
	faction = FACTION_WY_DEATHSQUAD
	friendly_factions = list(
		FACTION_WY,
	)
	enter_combat_lines = list(
		"Visual confirmed, engaging.",
		"Engaging hostile.",
		"Eliminating hostile.",
		"Engaging.",
		"Contact.",
		"Viscon, proceeding.",
	)
	exit_combat_lines = list(
		"Hostilities ceased.",
		"Ceasing engagement.",
	)
	squad_member_death_lines = list(
		"Allied unit disabled.",
		"Friendly unit decomissioned.",
		"Allied unit decomissioned.",
		"Friendly unit disabled.",
	)
	grenade_thrown_lines = list() // Wouldn't need to call this out
	reload_lines = list() // same here
	reload_internal_mag_lines = list()
	need_healing_lines = list()
