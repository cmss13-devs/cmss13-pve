/datum/xeno_strain/crusherrunner
	name = CRUSHER_RUNNER
	description = "In exchange for your shield, a little bit of your armor and damage, your slowdown resist from turrets, your influence under frenzy pheromones, your stomp no longer knocking down talls, and your ability to lock your direction, you gain a considerable amount of health, some speed, your stomp does extra damage when stomping over a grounded tall, and your charge is now manually-controlled and momentum-based; the further you go, the more damage and speed you will gain until you achieve maximum momentum, indicated by your roar. In addition, your armor is now directional, being the toughest on the front, weaker on the sides, and weakest from the back. In return, you gain an ability to tumble to pass through enemies and avoid enemy fire, and an ability to forcefully move enemies via ramming into them."
	flavor_description = "Nothing stops this hive. This one will become both the immovable object and the unstoppable force."

	actions_to_remove = list(
		/datum/action/xeno_action/activable/pounce/crusher_charge,
		/datum/action/xeno_action/onclick/crusher_stomp,
		/datum/action/xeno_action/onclick/crusher_shield,
		/datum/action/xeno_action/activable/fling/charger,
	)
	actions_to_add = list(
		/datum/action/xeno_action/activable/pounce/crusher_charge,
		/datum/action/xeno_action/activable/tail_stab/crusher,
		/datum/action/xeno_action/activable/pounce/crusher_charge
	)

	behavior_delegate_type = /datum/behavior_delegate/crusher_charger
	icon_state_prefix = "Runner"

/datum/xeno_strain/crusherrunner/apply_strain(mob/living/carbon/xenomorph/crusher/crusher)
	crusher.small_explosives_stun = FALSE
	crusher.health_modifier -= 400
	crusher.speed_modifier = -1.5
	crusher.armor_modifier -= XENO_ARMOR_MOD_SMALL
	crusher.damage_modifier -= XENO_DAMAGE_MOD_SMALL
	crusher.ignore_aura = "frenzy" // no funny crushers going 7 morbillion kilometers per second
	crusher.phero_modifier = -crusher.caste.aura_strength
	crusher.recalculate_everything()

