/datum/human_ai_brain
	var/list/in_combat_lines = list(
		"*warcry",
		"Taking fire!",
		"Getting shot at!",
		"Engaging hostiles!",
		"Contact!",
		"Contact contact!",
		"We've got hostiles!",
		"Take 'em down!",
		"Hostile spotted, engaging!",
		"Enemy hostiles here!",
		"Being fired upon!",
		"Blast 'em!",
	)

	var/list/exit_combat_lines = list(
		"No more contacts.",
		"Don't see 'em.",
		"Going back to regular duties.",
		"Nothin' left.",
		"Can't find 'em.",
		"No hostiles, returning to duties.",
	)

	var/list/squad_member_death_lines = list(
		"Fuck! Man down!",
		"We lost one!",
		"Man down!",
		"We're taking losses here!",
		"Goddamn it.",
		"Fuck!",
		"Shit, our squad's down a man!",
		"Squad integrity's failing!",
	)

	var/list/grenade_thrown_lines = list(
		"*warcry",
		"Nade out!",
		"Tossing a grenade!",
		"Smoking 'em out!",
		"Throwing a nade!",
		"Grenade out!",
		"Tossing a nade!",
		"Pineapple out!",
		"Fragging 'em!",
	)

	var/list/reload_lines = list(
		"Mag's dry.",
		"Reloading.",
		"Reloading!",
		"I'm out, cover me!",
		"Reloading, cover me!",
		"Swapping mags!",
		"Swapping mags, cover me!",
		"Need some cover, reloading!",
		"Reloading! Cover me, quick!",
		"Out of ammo!",
		"Hold up, I’m reloading now!",
		"Reloading! Keep me covered!",
		"Switching mags—hold them off!",
		"I’m dry! Reloading here!",
		"New mag going in! Cover me!",
		"Reloading! Watch my six!",
	)

	var/list/reload_internal_mag_lines = list(
		"Tube's dry.",
		"Reloading.",
		"Reloading!",
		"I'm out, cover me!",
		"Reloading, cover me!",
		"Need some cover, reloading!",
		"Reloading! Cover me, quick!",
		"Out of ammo!",
		"Hold up, I’m reloading now!",
		"Reloading! Keep me covered!",
		"Reloading—hold them off!",
		"I’m dry! Reloading here!",
		"Shells going in! Cover me!",
		"Reloading! Watch my six!",
	)

	var/in_combat_line_chance = 40
	var/exit_combat_line_chance = 40
	var/squad_member_death_line_chance = 20
	var/grenade_thrown_line_chance = 60
	var/reload_line_chance = 40

/datum/human_ai_brain/proc/say_in_combat_line(chance = in_combat_line_chance)
	if(!length(in_combat_lines) || !prob(chance) || (tied_human.health < HEALTH_THRESHOLD_CRIT))
		return
	tied_human.say(pick(in_combat_lines))

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
