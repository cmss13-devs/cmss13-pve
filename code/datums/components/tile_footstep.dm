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

/datum/component/tile_footstep/Initialize(steps_ = 2, volume_ = 25, range_ = 7, falloff_ = 1, drag_sounds_ = 'sound/footstep/drag/drag_1.ogg')
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	steps = steps_
	volume = volume_
	range = range_
	falloff = falloff_
	drag_sounds = drag_sounds_

	RegisterSignal(parent, list(COMSIG_MOVABLE_MOVED), PROC_REF(play_simplestep))

/datum/component/tile_footstep/proc/prepare_step()
	var/turf/open/T = get_turf(parent)
	if(!istype(T))
		return

	var/mob/living/LM = parent
	if(LM.buckled || LM.throwing || LM.is_ventcrawling || LM.stat == DEAD)
		return

	if(LM.life_steps_total % steps)
		return

	return T

/datum/component/tile_footstep/proc/play_simplestep()
	SIGNAL_HANDLER
	var/turf/open/T = prepare_step()
	if(!T)
		return
	var/mob/living/parent_mob = parent
	if(parent_mob.body_position == LYING_DOWN)
		playsound(T, drag_sounds, volume, rand(20000, 25000), range, falloff = falloff)
	else if(T.footstep_sound)
		playsound(T, T.footstep_sound, volume, rand(20000, 25000), range, falloff = falloff)
