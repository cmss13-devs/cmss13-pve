//ported from TGMC 04/07/21

///Footstep component. Plays footsteps at parents location when it is appropriate.
/datum/component/tile_footstep
	dupe_mode = COMPONENT_DUPE_HIGHLANDER
	///how many steps before the footstep sound is played
	var/steps = 0
	///volume of soundfile see playsound()
	var/volume
	///range of soundfile see playsound()
	var/range
	///falloff of soundfile see playsound()
	var/falloff
	///This can be a list OR a soundfile OR null. Determines whatever sound gets played.
	var/drag_sounds
	var/footstep_sound

/datum/component/tile_footstep/Initialize(steps_ = 3, volume_ = 25, range_ = 7, falloff_ = 1, drag_sounds_ = 'sound/footstep/drag/drag_1.ogg')
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	steps = steps_
	volume = volume_
	range = range_
	falloff = falloff_
	drag_sounds = drag_sounds_

	RegisterSignal(parent, list(COMSIG_MOVABLE_MOVED), PROC_REF(play_simplestep))

/datum/component/tile_footstep/proc/prepare_step()
	var/turf/open/footstep_turf = get_turf(parent)
	if(!istype(footstep_turf))
		return

	var/mob/living/living_mob = parent
	if(living_mob.buckled || living_mob.throwing || living_mob.is_ventcrawling || living_mob.stat == DEAD)
		return

	if(living_mob.life_steps_total % steps)
		return

	return footstep_turf

/datum/component/tile_footstep/proc/play_simplestep()
	SIGNAL_HANDLER
	var/turf/open/footstep_turf = prepare_step()
	if(!footstep_turf)
		return
	var/mob/living/carbon/human/parent_mob = parent
	if(parent_mob.body_position == LYING_DOWN)
		playsound(footstep_turf, drag_sounds, volume, rand(20000, 25000), range, falloff = falloff)
	if(!parent_mob.shoes)
		playsound(footstep_turf, footstep_turf.barefoot_sound, volume, rand(20000, 25000), range, falloff = falloff)
	else if(footstep_turf.footstep_sound)
		playsound(footstep_turf, footstep_turf.footstep_sound, volume, rand(20000, 25000), range, falloff = falloff)
