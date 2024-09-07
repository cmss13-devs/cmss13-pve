/datum/human_ai_brain
	/// If TRUE, AI is currently in some form of cover
	var/in_cover = FALSE

	/// If TRUE, the AI is in hard cover, meaning that it's solid and can't be seen through
	var/hard_cover = FALSE

	COOLDOWN_DECLARE(cover_search_cooldown)

/datum/human_ai_brain/proc/on_cover_destroyed(atom/source, force)
	UnregisterSignal(source, COMSIG_PARENT_QDELETING)
	in_cover = FALSE
	hard_cover = FALSE

/datum/human_ai_brain/proc/on_shot_inside_cover(datum/source, damage_result, ammo_flags, obj/projectile/bullet)
	if(faction_check(bullet.firer))
		return // FF

	// Cover isn't working. Charge!
	in_cover = FALSE
	hard_cover = FALSE
	UnregisterSignal(tied_human, COMSIG_HUMAN_BULLET_ACT)
