#define HOLO_SIZE_X 10
#define HOLO_SIZE_Y 10

/datum/map_template/holoscene
	var/holoscene_id
	var/list/holo_objs = list()
	var/list/holo_mobs = list()
	var/restricted = FALSE

/datum/map_template/holoscene/proc/id()
	if(holoscene_id)
		return holoscene_id
	else
		return null

/datum/map_template/holoscene/turnoff
	name = "Empty"
	holoscene_id = "turnoff"
	mappath = "maps/templates/holodeck/turnoff.dmm"

/datum/map_template/holoscene/basketball
	name = "Basketball Court"
	holoscene_id = "basketball"
	mappath = "maps/templates/holodeck/basketball.dmm"

/datum/map_template/holoscene/beach
	name = "Beach"
	holoscene_id = "beach"
	mappath = "maps/templates/holodeck/beach.dmm"

/datum/map_template/holoscene/boxingcourt
	name = "Boxing Ring"
	holoscene_id = "boxingcourt"
	mappath = "maps/templates/holodeck/boxingcourt.dmm"
