/datum/human_ai_brain
	var/list/enter_combat_lines = list(
		"CONTACT!",
		"Contact!",
		"SHIT- CONTACT!",
		"CONTACT, FRONT!",
		"WE GOT CONTACT!",
		"Look alive!",
		"GUNS UP!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Weapons free!",
		"Wipe 'em out!",
		"Light 'em up!",
		"Cut 'em down!",
		"Fuck 'em up!",
		"WASTE THE MOTHERFUCKERS!",
		"Kill that fucker!",
		"Ice that fucker!",
		"Let's rock!",
		"Eat shit!",
		"Die, you son of a bitch!",
		"Get some!",
		"GET SOME!",
		"GET SOME, MOTHERFUCKER!",
		"*warcry",
	)

	var/list/exit_combat_lines = list(
		"CEASE FIRE!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"We clear?",
		"Looks clear!",
		"CLEAR!",
		"Keep your eyes peeled!",
		"Might be more- Keep your eyes peeled.",
	)

	var/list/squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"WE'RE TAKING HITS HERE!",
		"THEY GOT THEM-- RETURN THE FUCKING FAVOUR!",
		"YOU'LL FUCKING PAY, MOTHERFUCKER!",
		"YOU'LL FUCKING PAY, ASSHOLE!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
	)

	var/list/grenade_thrown_lines = list(
		"GRENADE!",
		"THROWING GRENADE!",
		"GRENADE, GET CLEAR!",
		"EAT IT, FUCKER!",
		"RETURN TO SENDER!",
		"DELIVERY, MOTHERFUCKER!",
	)

	var/list/reload_lines = list(
		"RELOADING!",
		"Reloading!",
		"Swapping magazines!",
		"Swapping mags!",
		"Changing magazines!",
		"Changing mags!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"RED!",
	)

	var/list/reload_internal_mag_lines = list(
		"RELOADING!",
		"Reloading!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"I NEED A FUCKING SPEEDLOADER- CHRIST!",
		"RED!",
	)

	var/list/need_healing_lines = list(
		"FUCK ME!",
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"JESUS CHRIST!",
		"BLEEDING!",
		"MOTHER OF GOD-- NO!",
		"I'M TAKING HITS HERE!",
		"I'M HIT!",
		"I'M HURT!",
		"INJECTOR GOING IN!",
		"INJECTOR IN!",
		"I NEED GAUZE!",
		"SOMEONE PATCH THIS FUCKING HOLE!",
		"NEED MORPHINE!",
	)

	var/in_combat_line_chance = 40
	var/exit_combat_line_chance = 40
	var/squad_member_death_line_chance = 20
	var/grenade_thrown_line_chance = 60
	var/reload_line_chance = 40
	var/need_healing_line_chance = 90

/datum/human_ai_brain/proc/say_in_combat_line(chance = in_combat_line_chance)
	if(!length(enter_combat_lines) || !prob(chance) || (tied_human.health < HEALTH_THRESHOLD_CRIT))
		return
	tied_human.say(pick(enter_combat_lines))

/datum/human_ai_brain/proc/say_exit_combat_line(chance = exit_combat_line_chance)
	if(!length(exit_combat_lines) || !prob(chance) || (tied_human.health < HEALTH_THRESHOLD_CRIT))
		return
	tied_human.say(pick(exit_combat_lines))

/datum/human_ai_brain/proc/on_squad_member_death(mob/living/carbon/human/dead_member)
	if(!length(squad_member_death_lines) || !prob(squad_member_death_line_chance) || (tied_human.health < HEALTH_THRESHOLD_CRIT))
		return
	tied_human.say(pick(squad_member_death_lines))

/datum/human_ai_brain/proc/say_grenade_thrown_line(chance = grenade_thrown_line_chance)
	if(!length(grenade_thrown_lines) || !prob(chance) || (tied_human.health < HEALTH_THRESHOLD_CRIT))
		return
	tied_human.say(pick(grenade_thrown_lines))

/datum/human_ai_brain/proc/say_reload_line(chance = reload_line_chance)
	if(!length(reload_lines) || !prob(chance) || (tied_human.health < HEALTH_THRESHOLD_CRIT) || !primary_weapon)
		return
	if(istype(primary_weapon.current_mag, /obj/item/ammo_magazine/internal))
		tied_human.say(pick(reload_internal_mag_lines))
	else
		tied_human.say(pick(reload_lines))

/datum/human_ai_brain/proc/say_need_healing_line(chance = need_healing_line_chance)
	if(!length(need_healing_lines) || !prob(chance) || (tied_human.health < HEALTH_THRESHOLD_CRIT))
		return
	tied_human.say(pick(need_healing_lines))
