/datum/human_ai_faction
	/// What actual faction is this faction tied to
	var/faction = FACTION_NEUTRAL
	/// If FALSE, the AI will not intentionally kill enemies. The enemies may still be killed by crossfire, explosives, etc.
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

/// Given an AI brain, apply all the faction's data to the AI.
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

/// Reapplies the faction's data to all AI that belong to this faction
/datum/human_ai_faction/proc/reapply_faction_data()
	for(var/datum/human_ai_brain/brain in GLOB.human_ai_brains)
		if(brain.tied_human?.faction == faction)
			apply_faction_data(brain)

/// Given a faction string, makes this faction friendly to them.
/datum/human_ai_faction/proc/add_friendly_faction(faction)
	if(faction in friendly_factions)
		return
	friendly_factions += faction
	if(faction in neutral_factions)
		neutral_factions -= faction
	reapply_faction_data()

/// Given a faction string, makes this faction neutral to them.
/datum/human_ai_faction/proc/add_neutral_faction(faction)
	if(faction in neutral_factions)
		return
	neutral_factions += faction
	if(faction in friendly_factions)
		friendly_factions -= faction
	reapply_faction_data()

/// Given a faction string, removes a faction's friendly status, making them hostile instead.
/datum/human_ai_faction/proc/remove_friendly_faction(faction)
	if(!(faction in friendly_factions))
		return
	friendly_factions -= faction
	reapply_faction_data()

/// Given a faction string, removes a faction's neutral status, making them hostile instead.
/datum/human_ai_faction/proc/remove_neutral_faction(faction)
	if(!(faction in neutral_factions))
		return
	neutral_factions -= faction
	reapply_faction_data()

/// Getter for friendly_factions
/datum/human_ai_faction/proc/get_friendly_factions()
	return friendly_factions

/// Getter for neutral_factions
/datum/human_ai_faction/proc/get_neutral_factions()
	return neutral_factions

/// Setter for shoot_to_kill
/datum/human_ai_faction/proc/set_shoot_to_kill(new_kill = TRUE)
	shoot_to_kill = new_kill
	reapply_faction_data()

/// Getter for shoot_to_kill
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

/datum/human_ai_faction/ua_colonial_forces //CMB & UACG mostly
	faction = FACTION_MARSHAL
	friendly_factions = list(
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_COLONIST,
		FACTION_MARINE,
		FACTION_WY,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_TWE,
		FACTION_UPP,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"Woah, woah!",
		"Taking fire!",
		"Shots fired!",
		"Unit taking fire!",
		"Don't do it!",
		"Shit! Shots fired!",
		"Gun! Gun!",
		"Time to cowboy up!",
		"You're gonna wish you stayed at home.",
		"Never should have come here!",
	)
	exit_combat_lines = list(
		"Sweep and clear.",
		"Stay sharp.",
		"Make sure that's the last of them",
		"Stay sharp!",
		"Glad that's done with...",
		"I need a smoke...",
		"Is that all of them?",
		"What the hell am I doing here...",
		"Clear? We clear? Sound off!",
		"Jesus Christ...",
		"Put 'em on safe and let them hang, guys.",
	)
	squad_member_death_lines = list(
		"Man down!",
		"We got a man down here!",
		"Shit! They're wasted!",
		"Oh shit, shit, shit...",
		"Get back! Get back!",
		"I got a bad feeling about this...",
		"Shit! This can't be happening...",
		"They're down, get a medic up here now!",
		"Oh fuck! It's fucked!",
		"This was just supposed to be civil disturbances!",
		"Jesus, I didn't sign up for this!",
		"Oh god... What am I gonna tell their family..?",
	)
	reload_lines = list(
		"Reloading!",
		"I'm out!",
		"Cover me, down to harsh language here!",
		"New mag going in.",
		"Changing mag!",
		"I'm dry! Reloading!",
		"Reloadi- Oops, dropped my mag there.",
		"Dammit, I'm dry!",
		"Should've spent more time on the range..!",
	)
	grenade_thrown_lines = list(
		"Grenade!",
		"Throwing grenade!",
		"Frag, frag!",
		"Banger, out!",
		"Suck on this!",
		"Hope I don't blow myself up with this!",
	)

/datum/human_ai_faction/uscm
	faction = FACTION_MARINE
	friendly_factions = list(
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_COLONIST,
		FACTION_MARSHAL,
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
		"Marine's gone!",
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

/datum/human_ai_faction/usa
	faction = FACTION_ARMY
	friendly_factions = list(
		FACTION_NAVY,
		FACTION_MARINE,
		FACTION_COLONIST,
		FACTION_MARSHAL,
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
		"Bring them down!",
		"Light 'em up!",
		"Contact!",
		"Shoot! Contact!",
		"I got contact!",
		"Tango, dead ahead!",
		"Bring it on!",
		"Enemy on approach!",
		"Look alive!",
		"Look alive, tango!",
		"They're making a move!",
		"We got activity!",
		"I've got hostiles!",
		"Hostiles!",
		"Engaging hostiles!",
		"Hostile spotted!",
		"Shit! We got hostiles!",
		"Move in!",
		"Bogies, my sector!",
		"Hostiles forces here!",
		"Got 'em in my sights!",
		"You see what I see?",
		"There!",
		"Over there!",
		"There's one!",
		"Engaging!",
		"Take them down!",
		"Target in sight!",
		"Pour it on 'em!",
		"Weapons hot!",
		"Drop 'em!",
		"I got company!",
		"Kill that bastard!",
		"We're gonna kick your ass!",
	)
	exit_combat_lines = list(
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Clear.",
		"Check your vitals.",
		"Anyone wounded?",
		"I ain't paid enough for this...",
		"Stay frosty.",
		"Take a breather now...",
		"Sound off...!",
		"Don't mess with me.",
		"Hooah...",
		"I don't hear them. We're clear.",
		"Nothing around here.",
		"Don't get too comfortable now.",
		"Contacts silent.",
		"No hostiles located, resuming positions.",
		"No threats remaining.",
		"I'm a natural born alien killer.",
		"That's what I'm talking about.",
		"Watch those corners.",
	)
	squad_member_death_lines = list(
		"Trooper's gone!",
		"I don't believe this!",
		"I didn't sign up for this!",
		"Someone get the doc up here!",
		"Dammit, get their tags...",
		"Man down!",
		"Damn it!",
		"Squad member KIA!",
	)
	need_healing_lines = list(
		"Is that all you got?",
		"You got nothing!",
		"I'm hit!",
		"Argh, medic!",
		"Medic!",
		"Doc! Get up here!",
		"*medic",
	)
	reload_lines = list(
		"Reloading!",
		"Shoot-! I'm out!",
		"Changing mag.",
		"Changing mag!",
		"Swapping mags!",
		"Cover me, reloading!",
		"I'm dry! Reloading!",
	)
	reload_internal_mag_lines = list(
		"Reloading!",
		"Shoot-! I'm out!",
		"Watch my back, I'm reloading!",
	)
	grenade_thrown_lines = list(
		"Grenade!",
		"Fire in the hole!",
		"Take this!",
		"Throwing grenade!",
		"Throwing a 'nade!",
		"Primed! Clear blast!",
	)

/datum/human_ai_faction/usasf
	faction = FACTION_NAVY
	friendly_factions = list(
		FACTION_ARMY,
		FACTION_MARINE,
		FACTION_COLONIST,
		FACTION_MARSHAL,
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
		"Contact!",
		"Shoot! Contact!",
		"I got contact!",
		"Bandit, dead ahead!",
		"Bandit on approach!",
		"Look alive, bandit!",
		"I've got bandits!",
		"Engaging bandits!",
		"Bandit spotted!",
		"Shit! We got bandits!",
		"Bogies, my sector!",
		"Engaging!",
		"Take them down!",
		"I got company!",
	)
	exit_combat_lines = list(
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Clear.",
		"Check your vitals.",
		"Anyone wounded?",
		"Don't mess with me.",
		"I don't hear them. We're clear.",
		"Nothing around here.",
		"Don't get too comfortable now.",
		"Contacts silent.",
		"Watch those corners.",
	)
	squad_member_death_lines = list(
		"I don't believe this!",
		"I didn't sign up for this!",
		"Someone get the doc up here!",
		"Man down!",
		"Damn it!",
	)
	need_healing_lines = list(
		"I'm hit!",
		"Argh, Corpsman!",
		"Corpsman!",
		"Doc! Get up here!",
	)
	reload_lines = list(
		"Reloading!",
		"Changing mag!",
		"Swapping mags!",
		"Cover me, reloading!",
		"I'm dry! Reloading!",
	)
	reload_internal_mag_lines = list(
		"Reloading!",
		"Shoot-! I'm out!",
		"Watch my back, I'm reloading!",
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
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_MERCENARY,
		FACTION_TWE,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
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
	grenade_thrown_lines = list(
		"EAT THIS!",
		"Grenade!",
		"Throwing bomb!",
		"*warcry",
		"This is for you, invader!",
	)
	reload_internal_mag_lines = list(
		"Reloading!",
		"Out of ammo!",
		"It's out, reloading!",
		"I hope this won't take long!",
		"Empty!",
	)
	reload_lines = list(
		"Reloading!",
		"Out of ammo!",
		"It's out, reloading!",
		"I hope this won't take long!",
		"Empty!",
	)

/datum/human_ai_faction/wy
	faction = FACTION_WY
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
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

/datum/human_ai_faction/xeno_cultist
	faction = FACTION_XENOMORPH
	enter_combat_lines = list(
		"Aha!",
		"Found you!",
		"Right where you are...",
		"This won't take long.",
		"Intruder!",
		"Oppressor!",
		"Infidel!",
		"I found the oppressor!",
		"O Ascended One, give us your strength!",
		"Begone infidel!",
		"Do not let them pass!",
		"Banish them!",
		"Silence them!",
		"For the Ascended!",
		"For the Hive!",
		"You will regret this.",
		"Begone!",
		"This won't take long.",
		"...!",
	)
	exit_combat_lines = list(
		"It is silent.",
		"Hush...",
		"Nothing.",
		"It is done. For now...",
		"...",
	)
	squad_member_death_lines = list(
		"What have you done?!",
		"May they find purpose beyond...",
		"This cannot be...!",
		"Avenge them!",
		"...",
	)
	reload_lines = list(
		"Empty.",
		"Click.",
		"Zero.",
		"What.",
		"...",
		"...!",
	)
	reload_internal_mag_lines = list(
		"Empty.",
		"Click.",
		"Zero.",
		"What.",
		"...",
		"...!",
	)
	grenade_thrown_lines = list(
		"I brought a present...!",
		"We bear gifts...!",
		"This is for you...!",
	)

/datum/human_ai_faction/xeno_cultist/corrupted
	faction = FACTION_XENOMORPH_CORRPUTED
