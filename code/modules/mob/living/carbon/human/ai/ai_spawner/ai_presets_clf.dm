/datum/human_ai_equipment_preset/clf
	faction = FACTION_CLF

/datum/human_ai_equipment_preset/clf/soldier
	name = "CLF Soldier"
	desc = "The bread & butter of the CLF’s attack forces. Disposable. Large variety of weapons and armor."
	path = /datum/equipment_preset/clf/soldier/ai

/datum/human_ai_equipment_preset/clf/engineer
	name = "CLF Engineer"
	desc = "Engineers are the technicians of the CLF, having a lot of utility items but less firepower than the soldiers."
	path = /datum/equipment_preset/clf/engineer/ai

/datum/human_ai_equipment_preset/clf/shotgunner
	name = "CLF Shotgunner"
	desc = "Close-quarters specialist. Fairly poorly equipped except for a shotgun, which can shred marines who get too close."
	path = /datum/equipment_preset/clf/soldier/ai/shotgunner

/datum/human_ai_equipment_preset/clf/sadar
	name = "CLF Specialist - SADAR"
	desc = "CLF powerhouse. Lightly equipped and armed aside from their one-use SADAR, capable of instantly killing unaware marines."
	path = /datum/equipment_preset/clf/specialist/ai

/datum/human_ai_equipment_preset/clf/flamer
	name = "CLF Specialist - Flamer"
	desc = "Utilizing a stolen USCM flamer, this specialist is capable of laying down heavy area denial and damage over time. Lightly armed aside from it."
	path = /datum/equipment_preset/clf/specialist/ai/flamer

/datum/human_ai_equipment_preset/clf/combat_synth
	name = "CLF Combat Synthetic"
	desc = "Tanky support/combat unit. The CLF combat synth is capable of putting out a lot of damage and taking a load of it before going down. Due to its wide-ranging skill set, it’s also capable of medicating other CLF."
	path = /datum/equipment_preset/clf/synth/combat

/datum/human_ai_equipment_preset/clf/medic
	name = "CLF Medic"
	desc = "The guy who tries to keep the rest of the team alive. Comes equipped with medical supplies, though they don’t always live long enough to do treatment."
	path = /datum/equipment_preset/clf/synth/combat

/datum/human_ai_equipment_preset/clf/multipurpose_synth
	name = "CLF Multipurpose Synthetic"
	desc = "Tanky support unit. The multipurpose synth is a neutered version of the combat synth that can’t use firearms. Combat synth recommended to be used instead."
	path = /datum/equipment_preset/clf/synth

/datum/human_ai_equipment_preset/clf/leader
	name = "CLF Leader"
	desc = "A local commander of the CLF’s forces. They may be in charge of handling a squad, or even an entire colony depending on their distance from the cell’s base."
	path = /datum/equipment_preset/clf/leader

/datum/human_ai_equipment_preset/clf/cell_commander
	name = "CLF Cell Commander"
	desc = "The head honcho of the CLF’s operations in a given area. The cell is led by one of these guys. Their smartgun lets them shred anyone in their path. Use sparingly."
	path = /datum/equipment_preset/clf/commander
