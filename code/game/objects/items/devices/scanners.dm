/*
CONTAINS:
T-RAY
DETECTIVE SCANNER
HEALTH ANALYZER
GAS ANALYZER
PLANT ANALYZER
MASS SPECTROMETER
REAGENT SCANNER
FORENSIC SCANNER
*/
/obj/item/device/t_scanner
	name = "\improper T-ray scanner"
	desc = "A terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	icon_state = "t-ray0"
	var/on = 0
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_SMALL
	item_state = "electronic"

	matter = list("metal" = 150)

/obj/item/device/t_scanner/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/device/t_scanner/attack_self(mob/user)
	..()
	on = !on
	icon_state = "t-ray[on]"

	if(on)
		START_PROCESSING(SSobj, src)


/obj/item/device/t_scanner/process()
	if(!on)
		STOP_PROCESSING(SSobj, src)
		return null

	for(var/turf/T in range(1, src.loc) )

		if(!T.intact_tile)
			continue

		for(var/obj/O in T.contents)

			if(O.level != 1)
				continue

			if(O.invisibility == 101)
				O.invisibility = 0
				O.alpha = 128
				spawn(10)
					if(O && !QDELETED(O))
						var/turf/U = O.loc
						if(U.intact_tile)
							O.invisibility = 101
							O.alpha = 255

		var/mob/living/M = locate() in T
		if(M && M.invisibility == 2)
			M.invisibility = 0
			spawn(2)
				if(M)
					M.invisibility = INVISIBILITY_LEVEL_TWO


/obj/item/device/healthanalyzer
	name = "\improper HF2 health analyzer"
	icon_state = "health"
	item_state = "analyzer"
	desc = "A hand-held body scanner able to distinguish vital signs of the subject. The front panel is able to provide the basic readout of the subject's status."
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	flags_item = NOBLUDGEON
	throwforce = 3
	w_class = SIZE_SMALL
	throw_speed = SPEED_VERY_FAST
	throw_range = 10
	matter = list("metal" = 200)

	var/popup_window = TRUE
	var/last_scan
	var/list/buffer_for_report = list()
	var/datum/health_scan/last_health_display
	var/alien = FALSE

/obj/item/device/healthanalyzer/Destroy()
	QDEL_NULL(last_health_display)
	return ..()

/obj/item/device/healthanalyzer/attack(mob/living/M, mob/living/user)
	if(!popup_window)
		last_scan = M.health_scan(user, FALSE, TRUE, popup_window, alien)
	else
		if (!last_health_display)
			last_health_display = new(M)
		else
			last_health_display.target_mob = M
		SStgui.close_user_uis(user, src)
		last_scan = last_health_display.ui_data(user, DETAIL_LEVEL_HEALTHANALYSER)
		last_health_display.look_at(user, DETAIL_LEVEL_HEALTHANALYSER, bypass_checks = FALSE, ignore_delay = FALSE, alien = alien)
	to_chat(user, SPAN_NOTICE("[user] has analyzed [M]'s vitals."))
	playsound(src.loc, 'sound/items/healthanalyzer.ogg', 50)
	src.add_fingerprint(user)
	return

/obj/item/device/healthanalyzer/attack_self(mob/user)
	..()

	if(!last_scan)
		user.show_message("No previous scan found.")
		return

	if(popup_window)
		tgui_interact(user)
	else
		user.show_message(last_scan)

	return

/obj/item/device/healthanalyzer/tgui_interact(mob/user, datum/tgui/ui)
	if(!last_scan)
		return

	SStgui.close_user_uis(user, last_health_display)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HealthScan", "Stored Health Scan")
		ui.open()
		ui.set_autoupdate(FALSE)

/obj/item/device/healthanalyzer/ui_data(mob/user)
	return last_scan

/obj/item/device/healthanalyzer/verb/toggle_hud_mode()
	set name = "Switch Hud Mode"
	set category = "Object"
	set src in usr
	popup_window = !popup_window
	last_scan = null // reset the data
	to_chat(usr, "The scanner [popup_window ? "now" : "no longer"] shows results on the hud.")

/datum/looping_sound/healthanalyzer_oxygen_beeping //This will be instanced and the sounds changed because I might as well
	start_sound = list('sound/items/healthanalyzer_oxygen_alarm.ogg' = 1)
	mid_sounds = list('sound/items/healthanalyzer_oxygen_alarm.ogg' = 1)
	mid_length = 1 SECONDS
	volume = 4
	extra_range = 14

/datum/looping_sound/healthanalyzer_heart_beeping //This will be instanced and the sounds changed because I might as well
	start_sound = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
	mid_sounds = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
	mid_length = 0.9 SECONDS
	volume = 4
	extra_range = 14
/*
/datum/looping_sound/healthanalyzer_heart_beeping_bad
	start_sound = list('sound/items/healthanalyzer_heart_bad.ogg' = 1)
	mid_sounds = start_sound
	mid_length = 1.402 SECONDS
	volume = 20

/datum/looping_sound/healthanalyzer_heart_beeping_very_bad
	start_sound = list('sound/items/healthanalyzer_heart_very_bad.ogg' = 1)
	mid_sounds = list('sound/items/healthanalyzer_heart_very_bad.ogg' = 1)
	mid_length = 0.492 SECONDS
	volume = 20

/datum/looping_sound/healthanalyzer_heart_beeping_severe
	start_sound = list('sound/items/healthanalyzer_heart_severe.ogg' = 1)
	mid_sounds = start_sound
	mid_length = 0.408 SECONDS
	volume = 20

/datum/looping_sound/healthanalyzer_heart_beeping_flatline
	start_sound = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
	mid_sounds = start_sound
	mid_length = 1.446 SECONDS
	volume = 20
*/

/obj/item/device/healthanalyzer/soul
	icon = 'icons/obj/items/Medical Scanner.dmi'
	icon_state = "Medical_scanner"
	item_state = "analyzer"
	flags_equip_slot = SLOT_WAIST | SLOT_BACK | SLOT_SUIT_STORE
	w_class = SIZE_MEDIUM
	var/mode = 1
	var/report_delay_counter = 0
	var/report_delay_threshold = 3 //every three processes, record to report buffer
	var/mob/living/carbon/human/connected_to
	var/mob/living/carbon/human/connected_from
	var/blood_type = null
	var/datum/beam/current_beam
	var/datum/looping_sound/healthanalyzer_oxygen_beeping/oxygen_alarm_loop
	var/datum/looping_sound/healthanalyzer_heart_beeping/heart_rate_loop
/obj/item/device/healthanalyzer/soul/Initialize()
	. = ..()
	heart_rate_loop = new(src)
	oxygen_alarm_loop = new(src)

/obj/item/device/healthanalyzer/soul/verb/print_report_verb()
	set name = "Print Report"
	set category = "Object"
	set src in usr

	if(usr.is_mob_incapacitated())
		return
	print_report(usr)

/obj/item/device/healthanalyzer/soul/proc/print_report(mob/living/user)
	if(!last_scan)
		to_chat(user, "There is no scan data to print.")
		return
	var/obj/item/paper/print_report = new /obj/item/paper
	print_report.info += "Device ID:" + serial_number + "\n" + jointext(buffer_for_report,"<br>")
	//print_report.info_links += jointext(buffer_for_report,"<br>")
	//print_report.updateinfolinks()
	print_report.update_icon()
	user.put_in_hands(print_report)
	user.visible_message("\The [src] spits out a piece of paper.")

/obj/item/device/healthanalyzer/soul/proc/perform_scan_and_report()
	if(ishuman(connected_from))
		if(!popup_window)
			last_scan = connected_to.health_scan_table(connected_from, FALSE, TRUE, popup_window, alien)
			to_chat(connected_from, SPAN_NOTICE(last_scan))
		else
			if (!last_health_display)
				last_health_display = new(connected_to)
			else
				last_health_display.target_mob = connected_to
				SStgui.close_user_uis(connected_from, src)
				last_scan = last_health_display.ui_data(connected_from, DETAIL_LEVEL_HEALTHANALYSER)
				last_health_display.look_at(connected_from, DETAIL_LEVEL_HEALTHANALYSER, bypass_checks = FALSE, ignore_delay = FALSE, alien = alien)
		src.add_fingerprint()
	if(report_delay_counter >= report_delay_threshold)
		to_chat(connected_from, SPAN_NOTICE("[connected_from] has analyzed [connected_to]'s vitals.")) //lol
		if(findtext(last_scan,"<table")) //don't run health_scan_table a second time if the data was already gathered this tick
			buffer_for_report.Add(last_scan)
		else
			buffer_for_report.Add(connected_to.health_scan_table(connected_from, FALSE, TRUE, popup_window, alien)) //Using TGUI mode, gather data again...
		report_delay_counter = -1 //reset counter
		if(buffer_for_report.len > 40)
			buffer_for_report.Cut(1,3) //stop memory leak, maybe
	report_delay_counter++

/obj/item/device/healthanalyzer/soul/process()
	//if we're not connected to anything stop doing stuff
	if(!connected_to)
		return PROCESS_KILL

	/*if we're not on a human stop doing stuff
	if(!ishuman(loc))
		bad_disconnect()
		return PROCESS_KILL

	//if we're not being held in a hand stop doing stuff
	var/mob/living/carbon/human/current_human = loc
	if(!(current_human.l_hand == src || current_human.r_hand == src))
		bad_disconnect()
		return PROCESS_KILL
	*/
	//if we're further than 3 tile away to stop doing stuff
	if(!(get_dist(src, connected_to) <= 3))
		disconnect(TRUE)
		return PROCESS_KILL
	update_beam(TRUE)
	perform_scan_and_report()
	//playsound(src.loc, 'sound/items/healthanalyzer.ogg', 50)
	//Modify the health analyzers own beeping sounds depending on what is happening
	var/health_percentage = connected_to.health - connected_to.halloss
	// if oxyloss is more than half of the remaining damage to instant death, make a different beep
	var/midpoint = abs(((connected_to.getBruteLoss() + connected_to.getFireLoss() + connected_to.getToxLoss()) + (HEALTH_THRESHOLD_DEAD-100)) / 2)
	if (connected_to.oxyloss >= midpoint)
		oxygen_alarm_loop.start()
	else
		oxygen_alarm_loop.stop()
	if(health_percentage >= 40)
		heart_rate_loop.start_sound = list('sound/items/healthanalyzer_heart_okay.ogg' = 1)
		heart_rate_loop.mid_sounds = list('sound/items/healthanalyzer_heart_okay.ogg' = 1)
		heart_rate_loop.mid_length = 0.703 SECONDS
	if(health_percentage < 40)
		heart_rate_loop.start_sound = list('sound/items/healthanalyzer_heart_bad.ogg' = 1)
		heart_rate_loop.mid_sounds = list('sound/items/healthanalyzer_heart_bad.ogg' = 1)
		heart_rate_loop.mid_length = 0.499 SECONDS
	if(health_percentage < -20)
		heart_rate_loop.start_sound = list('sound/items/healthanalyzer_heart_very_bad.ogg' = 1)
		heart_rate_loop.mid_sounds = list('sound/items/healthanalyzer_heart_very_bad.ogg' = 1)
		heart_rate_loop.mid_length = 0.550 SECONDS
	if(health_percentage < -120)
		heart_rate_loop.start_sound = list('sound/items/healthanalyzer_heart_severe.ogg' = 1)
		heart_rate_loop.mid_sounds = list('sound/items/healthanalyzer_heart_severe.ogg' = 1)
		heart_rate_loop.mid_length = 0.374 SECONDS
	if(connected_to.stat > 1)
		heart_rate_loop.start_sound = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
		heart_rate_loop.mid_sounds = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
		heart_rate_loop.mid_length = 3.110 SECONDS
	return

/// proc health_scan was a legacy proc for to_chat messages on health analysers. health_scan_table is retrofitted to have parity with the TGUI scan so it can record info for reports
/mob/living/proc/health_scan_table(mob/living/carbon/human/user, ignore_delay = FALSE, show_limb_damage = TRUE, show_browser = TRUE, alien = FALSE, do_checks = TRUE) // ahem. FUCK WHOEVER CODED THIS SHIT AS NUMBERS AND NOT DEFINES.
//fix this later or it might crash, idk
	/*
	if(do_checks)
		if((user.getBrainLoss() >= 60) && prob(50))
			to_chat(user, SPAN_WARNING("You try to analyze the floor's vitals!"))
			for(var/mob/O in viewers(src, null))
				O.show_message(SPAN_WARNING("[user] has analyzed the floor's vitals!"), 1)
			user.show_message(SPAN_NOTICE("Health Analyzer results for The floor:\n\t Overall Status: Healthy"), 1)
			user.show_message(SPAN_NOTICE("\t Damage Specifics: [0]-[0]-[0]-[0]"), 1)
			user.show_message(SPAN_NOTICE("Key: Suffocation/Toxin/Burns/Brute"), 1)
			user.show_message(SPAN_NOTICE("Body Temperature: ???"), 1)
			return
		if(HAS_TRAIT(src, TRAIT_FOREIGN_BIO) && !alien)
			to_chat(user, SPAN_WARNING("ERROR: Unknown biology detected."))
			return
		if(!(ishuman(user) || SSticker?.mode.name == "monkey"))
			to_chat(usr, SPAN_WARNING("You don't have the dexterity to do this!"))
			return
		if(!ignore_delay && !skillcheck(user, SKILL_MEDICAL, SKILL_MEDICAL_MEDIC))
			to_chat(user, SPAN_WARNING("You start fumbling around with [src]..."))
			var/fduration = 60
			if(skillcheck(user, SKILL_MEDICAL, SKILL_MEDICAL_DEFAULT))
				fduration = 30
			if(!do_after(user, fduration, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY) || !user.Adjacent(src))
				return
		if(isxeno(src))
			to_chat(user, SPAN_WARNING("[src] can't make sense of this creature."))
			return
		// Doesn't work on non-humans
		if(!istype(src, /mob/living/carbon))
			user.show_message("\nHealth Analyzer results for ERROR:\n\t Overall Status: ERROR")
			user.show_message("\tType: [SET_CLASS("Oxygen", INTERFACE_BLUE)]-[SET_CLASS("Toxin", INTERFACE_GREEN)]-[SET_CLASS("Burns", INTERFACE_ORANGE)]-[SET_CLASS("Brute", INTERFACE_RED)]", 1)
			user.show_message("\tDamage: [SET_CLASS("?", INTERFACE_BLUE)] - [SET_CLASS("?", INTERFACE_GREEN)] - [SET_CLASS("?", INTERFACE_ORANGE)] - [SET_CLASS("?", INTERFACE_RED)]")
			user.show_message(SPAN_NOTICE("Body Temperature: [src.bodytemperature-T0C]&deg;C ([src.bodytemperature*1.8-459.67]&deg;F)"), 1)
			user.show_message(SPAN_DANGER("<b>Warning: Blood Level ERROR: --% --cl.Type: ERROR"))
			user.show_message(SPAN_NOTICE("Subject's pulse: [SET_CLASS("-- bpm", INTERFACE_RED)]"))
			return
*/
	var/dat = ""
	// Calculate damage amounts
	var/fake_oxy = max(rand(1,40), src.getOxyLoss(), (300 - (src.getToxLoss() + src.getFireLoss() + src.getBruteLoss())))
	var/OX = src.getOxyLoss() > 50 ? "<b>[src.getOxyLoss()]</b>" : src.getOxyLoss()
	var/TX = src.getToxLoss() > 50 ? "<b>[src.getToxLoss()]</b>" : src.getToxLoss()
	var/BU = src.getFireLoss() > 50 ? "<b>[src.getFireLoss()]</b>" : src.getFireLoss()
	var/BR = src.getBruteLoss() > 50 ? "<b>[src.getBruteLoss()]</b>" : src.getBruteLoss()

	// Show overall
	if(src.status_flags & FAKEDEATH)
		OX = fake_oxy > 50 ? "<b>[fake_oxy]</b>" : fake_oxy
		dat += "\nHealth Analyzer for [src]:\n\tOverall Status: <b>DEAD</b>"
	else
		var/mob/living/carbon/human/snowflake_variable_for_name = src
		dat += "<table border=1 cellspacing=0 cellpadding=3 style='border: 1px solid black;'><td>[snowflake_variable_for_name.get_id_name("Unknown")] [src.stat > 1 ? "<b>DEAD</b>" : "<b>[src.health - src.halloss]% "] at " + worldtime2text("hh:mm:ss") + "/n"
	//dat += "[SET_CLASS("Oxygen", INTERFACE_BLUE)]-[SET_CLASS("Toxin", INTERFACE_GREEN)]-[SET_CLASS("Burns", INTERFACE_ORANGE)]-[SET_CLASS("Brute", INTERFACE_RED)]<td>"
	dat += "[SET_CLASS(OX, INTERFACE_BLUE)] - [SET_CLASS(TX, INTERFACE_GREEN)] - [SET_CLASS(BU, INTERFACE_ORANGE)] - [SET_CLASS(BR, INTERFACE_RED)]\n"
	//dat += "\tUntreated: {B}=Burns,{T}=Trauma,{F}=Fracture\n"

	// Show specific limb damage
	if(istype(src, /mob/living/carbon/human) && show_limb_damage)
		var/mob/living/carbon/human/H = src
		for(var/obj/limb/org in H.limbs)
			var/brute_treated = TRUE
			var/burn_treated = TRUE
			var/open_incision = org.get_incision_depth() ? " <span class='scanner'>Open surgical incision</span>" : ""

			if((org.brute_dam > 0 && !org.is_bandaged()) || open_incision)
				brute_treated = FALSE
			if(org.burn_dam > 0 && !org.is_salved())
				burn_treated = FALSE
			if(org.status & LIMB_DESTROYED)
				dat += "\t\t [capitalize(org.display_name)]: <span class='scannerb'>Missing!</span>\n"
				continue

			var/bleeding_check = FALSE
			for(var/datum/effects/bleeding/external/E in org.bleeding_effects_list)
				bleeding_check = TRUE
				break
			var/show_limb = (org.burn_dam > 0 || org.brute_dam > 0 || (org.status & LIMB_SPLINTED) || open_incision || bleeding_check)
			//quick fix for IB showing, fix later!!
			for(var/datum/effects/bleeding/internal/ib in org.bleeding_effects_list)
				show_limb = TRUE
				break

			var/org_name = "[capitalize(org.display_name)]"
			if(org.status & LIMB_ROBOT)
				if(org.status & LIMB_UNCALIBRATED_PROSTHETIC)
					org_name += " (Nonfunctional Cybernetic)]"
					show_limb = TRUE
				else
					org_name += " (Cybernetic)"
			else if(org.status & LIMB_SYNTHSKIN)
				org_name += " (Synthskin)"

			var/burn_info = org.burn_dam > 0 ? "<span class='scannerburnb'>" + "[burn_treated ? "" : "{"]" + "[floor(org.burn_dam)]"  + "[burn_treated ? "" : "}"]" + "</span>" : "<span class='scannerburn'>0</span>"
			//burn_info += "[burn_treated ? "" : "{B}"]"
			var/brute_info =  org.brute_dam > 0 ? "<span class='scannerb'>" + "[brute_treated ? "" : "{"]" + "[floor(org.brute_dam)]" + "[brute_treated ? "" : "}"]" + "</span>" : "<span class='scanner'>0</span>"
			//brute_info += "[brute_treated ? "" : "{T}"]"
			var/fracture_info = ""
			if(org.status & LIMB_BROKEN)
				fracture_info = "{F}"
				show_limb = 1
			var/org_bleed = ""
			if(bleeding_check)
				org_bleed = SPAN_SCANNERB("(Bleeding)")
			if(show_limb)
				dat += "[org_name]: \t [burn_info] - [brute_info] [fracture_info][org_bleed][open_incision]"
				for(var/datum/effects/bleeding/internal/ib in org.bleeding_effects_list)
					dat += SPAN_SCANNERB("(Internal Bleeding)")
					break
				if(org.status & LIMB_SPLINTED_INDESTRUCTIBLE)
					dat += "(Nanosplinted)"
				else if(org.status & LIMB_SPLINTED)
					dat += "(Splinted)"
				dat += "\n"

	// Show red messages - broken bokes, etc
	if (src.getCloneLoss())
		dat += "\t<span class='scanner'> *Subject appears to have been imperfectly cloned.</span>\n"
	for(var/datum/disease/D in src.viruses)
		if(!D.hidden[SCANNER])
			dat += "\t<span class='scannerb'> *Warning: [D.form] Detected</span><span class='scanner'>\nName: [D.name].\nType: [D.spread].\nStage: [D.stage]/[D.max_stages].\nPossible Cure: [D.cure]</span>\n"
	if (src.getBrainLoss() >= 100 || !src.has_brain())
		dat += "\t<span class='scanner'> *Subject has taken extreme amounts of <b>brain damage</b></span>.\n"

	if(src.has_brain() && src.stat != DEAD && ishuman(src))
		if(!src.key)
			dat += SPAN_WARNING("\tNo soul detected.\n") // they ghosted
		else if(!src.client)
			dat += SPAN_WARNING("\tSSD detected.\n") // SSD

	if(ishuman(src))
		var/mob/living/carbon/human/H = src

		if(length(H.embedded_items) > 0)
			dat += "\t[SPAN_SCANNER("*<b>Embedded object</b> detected. Advanced scanner required for location.")]\n"


	var/reagents_in_body[0] // yes i know -spookydonut
	if(istype(src, /mob/living/carbon))
		// Show helpful reagents
		if(src.reagents && (src.reagents.total_volume > 0))
			var/unknown = 0
			var/reagentdata[0]
			for(var/A in src.reagents.reagent_list)
				var/datum/reagent/R = A
				reagents_in_body["[R.id]"] = R.volume
				if(R.flags & REAGENT_SCANNABLE)
					reagentdata["[R.id]"] = "[R.overdose != 0 && R.volume > R.overdose && !(R.flags & REAGENT_CANNOT_OVERDOSE) ? SPAN_WARNING("<b>OD: </b>") : ""] <font color='#9773C4'><b>[round(R.volume, 1)]u [R.name]</b></font>"
				else
					unknown++
			if(length(reagentdata))
				dat += "\n\tBeneficial reagents:\n"
				for(var/d in reagentdata)
					dat += "\t\t [reagentdata[d]]\n"
			if(unknown)
				dat += "\t<span class='scanner'> Warning: Unknown substance[(unknown>1)?"s":""] detected in subject's blood.</span>\n"

	// Show body temp
	dat += "\n\tBody Temperature: [src.bodytemperature-T0C]&deg;C ([src.bodytemperature*1.8-459.67]&deg;F)\n"

	if (ishuman(src))
		var/mob/living/carbon/human/H = src
		// Show blood level
		var/blood_volume = BLOOD_VOLUME_NORMAL
		if(!(H.species && H.species.flags & NO_BLOOD))
			blood_volume = floor(H.blood_volume)

			var/blood_percent =  blood_volume / 560
			var/blood_type = H.blood_type
			blood_percent *= 100
			if(blood_volume <= 500 && blood_volume > 336)
				dat += "\t<span class='scanner'> <b>Blood Level LOW: [blood_percent]% [blood_volume]cl.</span> [SET_CLASS("Type: [blood_type]", INTERFACE_BLUE)]\n"
			else if(blood_volume <= 336)
				dat += "\t<span class='scanner'> <b>Blood Level CRITICAL: [blood_percent]% [blood_volume]cl.</span> [SET_CLASS("Type: [blood_type]", INTERFACE_BLUE)]\n"
			else
				dat += "\tBlood Level normal: [blood_percent]% [blood_volume]cl. Type: [blood_type]\n"
		// Show pulse
		dat += "\tPulse: <span class='[H.pulse == PULSE_THREADY || H.pulse == PULSE_NONE ? INTERFACE_RED : ""]'>[H.get_pulse(GETPULSE_TOOL)] bpm.</span> </td></tr></table>"
	dat = replacetext(dat, "\n", "<br>")
	dat = replacetext(dat, "\t", "&emsp;")
	dat = replacetext(dat, "class='warning'", "class='[INTERFACE_RED]'")
	dat = replacetext(dat, "class='scanner'", "class='[INTERFACE_RED]'")
	dat = replacetext(dat, "class='scannerb'", "style='font-weight: bold;' class='[INTERFACE_RED]'")
	dat = replacetext(dat, "class='scannerburn'", "class='[INTERFACE_ORANGE]'")
	dat = replacetext(dat, "class='scannerburnb'", "style='font-weight: bold;' class='[INTERFACE_ORANGE]'")
	return dat

/obj/item/device/healthanalyzer/soul/proc/update_beam(new_beam = TRUE)
	connected_from = get_atom_on_turf(src)
	if(current_beam)
		QDEL_NULL(current_beam)
	if(connected_from && connected_to && new_beam)
		current_beam = connected_from.beam(connected_to, "iv_tube")

/obj/item/device/healthanalyzer/soul/attack(mob/living/M, mob/living/user)
	if(M == user)
		to_chat(user, SPAN_WARNING("You cannot connect this to yourself!"))
		return

	if(connected_to == M)
		disconnect()
		return

	if(user.action_busy)
		return

	if(!do_after(user, skillcheck(user, SKILL_SURGERY, SKILL_SURGERY_NOVICE) ? (1 SECONDS) * user.get_skill_duration_multiplier(SKILL_SURGERY) : (8 SECONDS), INTERRUPT_ALL, BUSY_ICON_FRIENDLY, M, INTERRUPT_MOVED, BUSY_ICON_MEDICAL))
		to_chat(user, SPAN_WARNING("You were interrupted before you could finish!"))
		return

	if(istype(M, /mob/living/carbon/human))
		connected_to = M
		connected_from = user
		connected_to.base_pixel_x = 5
		START_PROCESSING(SSobj, src)
		heart_rate_loop.start()
		report_delay_counter = report_delay_threshold
		user.visible_message("[user] attaches \the [src] to [connected_to].", \
			"You attach \the [src] to [connected_to].")
		icon_state = "Medical_scanner_open"
		overlays += image(icon, src, "+running")
		update_beam()
		perform_scan_and_report()

///Used to standardize effects of a blood bag disconnecting improperly
/obj/item/device/healthanalyzer/soul/proc/disconnect(bad_disconnect = FALSE)
	STOP_PROCESSING(SSobj, src)
	heart_rate_loop.stop()
	oxygen_alarm_loop.stop()
	if(!connected_to)
		return
	if(bad_disconnect)
		connected_to.visible_message("[src] breaks free of [connected_to]!", "[src] is pulled out of you!")
		connected_to.apply_damage(3, BRUTE, pick("r_arm", "l_arm"))
		if(connected_to.pain.feels_pain)
			connected_to.emote("pain")
	else
		connected_from.visible_message("[connected_from] detaches [src] from [connected_to].", \
			"You detach [src] from [connected_to].")
	connected_to.base_pixel_x = 0
	connected_to = null
	connected_from = null
	icon_state = "Medical_scanner"
	overlays -= image(icon, src, "+running")
	update_beam(FALSE)

/obj/item/device/healthanalyzer/soul/dropped(mob/user)
	. = ..()
	connected_from = src
	update_beam(TRUE)

/obj/item/device/healthanalyzer/soul/pickup(mob/user)
	. = ..()
	connected_from = user
	addtimer(CALLBACK(src, PROC_REF(update_beam), TRUE), 0)

/obj/item/device/healthanalyzer/alien
	name = "\improper YMX scanner"
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "scanner"
	item_state = "analyzer"
	desc = "An alien design hand-held body scanner able to distinguish vital signs of the subject. The front panel is able to provide the basic readout of the subject's status."
	alien = TRUE
	black_market_value = 35

/obj/item/device/analyzer
	desc = "A hand-held environmental scanner which reports current gas levels."
	name = "analyzer"
	icon_state = "atmos"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20

	matter = list("metal" = 30,"glass" = 20)



/obj/item/device/analyzer/attack_self(mob/user as mob)
	..()

	if (user.stat)
		return
	if (!(istype(usr, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(usr, SPAN_DANGER("You don't have the dexterity to do this!"))
		return

	var/turf/location = user.loc
	if (!( istype(location, /turf) ))
		return

	var/env_pressure = location.return_pressure()
	var/env_gas = location.return_gas()
	var/env_temp = location.return_temperature()

	user.show_message(SPAN_NOTICE("<B>Results:</B>"), 1)
	if(abs(env_pressure - ONE_ATMOSPHERE) < 10)
		user.show_message(SPAN_NOTICE("Pressure: [round(env_pressure,0.1)] kPa"), 1)
	else
		user.show_message(SPAN_DANGER("Pressure: [round(env_pressure,0.1)] kPa"), 1)
	if(env_pressure > 0)
		user.show_message(SPAN_NOTICE("Gas Type: [env_gas]"), 1)
		user.show_message(SPAN_NOTICE("Temperature: [floor(env_temp-T0C)]&deg;C"), 1)

	src.add_fingerprint(user)
	return

/obj/item/device/mass_spectrometer
	desc = "A hand-held mass spectrometer which identifies trace chemicals in a blood sample."
	name = "mass-spectrometer"
	icon_state = "spectrometer"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT|OPENCONTAINER
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20

	matter = list("metal" = 30,"glass" = 20)


	var/details = 0
	var/recent_fail = 0

/obj/item/device/mass_spectrometer/Initialize()
	. = ..()
	create_reagents(5)

/obj/item/device/mass_spectrometer/on_reagent_change()
	if(reagents.total_volume)
		icon_state = initial(icon_state) + "_s"
	else
		icon_state = initial(icon_state)

/obj/item/device/mass_spectrometer/attack_self(mob/user)
	..()

	if (user.stat)
		return
	if (crit_fail)
		to_chat(user, SPAN_DANGER("This device has critically failed and is no longer functional!"))
		return
	if (!(istype(user, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(user, SPAN_DANGER("You don't have the dexterity to do this!"))
		return


/obj/item/device/mass_spectrometer/adv
	name = "advanced mass-spectrometer"
	icon_state = "adv_spectrometer"
	details = 1


/obj/item/device/reagent_scanner
	name = "reagent scanner"
	desc = "A hand-held reagent scanner which identifies chemical agents."
	icon_state = "spectrometer"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 30,"glass" = 20)


	var/details = 0
	var/recent_fail = 0

/obj/item/device/reagent_scanner/afterattack(obj/O, mob/user as mob, proximity)
	if(!proximity)
		return
	if (user.stat)
		return
	if (!(istype(user, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(user, SPAN_DANGER("You don't have the dexterity to do this!"))
		return
	if(!istype(O))
		return
	if (crit_fail)
		to_chat(user, SPAN_DANGER("This device has critically failed and is no longer functional!"))
		return

	if(!QDELETED(O.reagents))
		var/dat = ""
		if(length(O.reagents.reagent_list) > 0)
			var/one_percent = O.reagents.total_volume / 100
			for (var/datum/reagent/R in O.reagents.reagent_list)
				if(prob(reliability))
					dat += "\n \t \blue [R.name][details ? ": [R.volume / one_percent]%" : ""]"
					recent_fail = 0
				else if(recent_fail)
					crit_fail = 1
					dat = null
					break
				else
					recent_fail = 1
		if(dat)
			to_chat(user, SPAN_NOTICE(" Chemicals found: [dat]"))
		else
			to_chat(user, SPAN_NOTICE(" No active chemical agents found in [O]."))
	else
		to_chat(user, SPAN_NOTICE(" No significant chemical agents found in [O]."))

	return

/obj/item/device/reagent_scanner/adv
	name = "advanced reagent scanner"
	icon_state = "adv_spectrometer"
	details = 1

/obj/item/device/demo_scanner
	name = "demolitions scanner"
	desc = "A hand-held specially designed reagent scanner meant for analyzing bombs. It can report explosive and fire hazards from chemical containers and explosive casings, including explosive and fire intensity. However, it can not predict effects such as shrapnel or burn duration nor predict hazards caused from immediate chemical reactions."
	icon_state = "demolitions_scanner"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 30,"glass" = 20)
	var/scan_name = ""
	var/dat = ""
	var/ex_potential = 0
	var/int_potential = 0
	var/rad_potential = 0
	var/datum/reagents/holder

/obj/item/device/demo_scanner/afterattack(obj/O, mob/user as mob, proximity)
	if(!proximity)
		return
	if(user.stat)
		return
	if(!(istype(user, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(user, SPAN_DANGER("You don't have the dexterity to do this!"))
		return
	if(!skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED))
		to_chat(user, SPAN_WARNING("You do not know how to use the [name]."))
		return
	if(!istype(O))
		return

	scan_name = O.name
	dat = ""
	ex_potential = 0
	int_potential = 0
	rad_potential = 0

	if(istype(O, /obj/item/ammo_magazine/flamer_tank))
		var/obj/item/ammo_magazine/flamer_tank/tank = O
		if(!length(tank.reagents.reagent_list))
			to_chat(user, SPAN_NOTICE("No fuel detected in [O]"))
			return
		var/result
		var/datum/reagent/chem = tank.reagents.reagent_list[1]
		result += SPAN_BLUE("Fuel Statistics:")
		result += SPAN_BLUE("<br>Intensity: [min(chem.intensityfire, tank.max_intensity)]")
		result += SPAN_BLUE("<br>Duration: [min(chem.durationfire, tank.max_duration)]")
		result += SPAN_BLUE("<br>Range: [min(chem.rangefire, tank.max_range)]")
		to_chat(user, SPAN_NOTICE("[result]"))
		return

	if(istype(O,/obj/item/explosive))
		var/obj/item/explosive/E = O
		if(!E.customizable)
			to_chat(user, SPAN_NOTICE("ERROR: This brand of explosive is under data protection. Scan has been cancelled."))
			return
		holder = E.reagents
		for(var/obj/container in E.containers)
			scan(container)
	else if(istype(O,/obj/item/ammo_magazine/rocket/custom))
		var/obj/item/ammo_magazine/rocket/custom/E = O
		if(!E.warhead)
			to_chat(user, SPAN_NOTICE("No warhead detected in [E]."))
			return
		holder = E.warhead.reagents
		for(var/obj/container in E.warhead.containers)
			scan(container)
	else if(istype(O,/obj/item/mortar_shell/custom))
		var/obj/item/mortar_shell/custom/E = O
		if(!E.warhead)
			to_chat(user, SPAN_NOTICE("No warhead detected in [E]."))
			return
		holder = E.warhead.reagents
		for(var/obj/container in E.warhead.containers)
			scan(container)
	else
		scan(O)
		if(O.reagents)
			holder = O.reagents
	if(dat && holder)
		if(ex_potential)
			dat += SPAN_ORANGE("<br>EXPLOSIVE HAZARD: ignition will create explosive detonation.<br>Potential detonation power: [min(ex_potential, holder.max_ex_power)]")
		if(int_potential)
			dat += SPAN_RED("<br>FIRE HAZARD: ignition will create chemical fire.<br>Expected fire intensity rating of [min(max(int_potential,holder.min_fire_int),holder.max_fire_int)] in a [min(max(rad_potential,holder.min_fire_rad),holder.max_fire_rad)] meter radius.")
		to_chat(user, SPAN_NOTICE("Chemicals found: [dat]"))
	else
		to_chat(user, SPAN_NOTICE("No active chemical agents found in [O]."))
	return

/obj/item/device/demo_scanner/proc/scan(obj/O)
	if(QDELETED(O.reagents))
		return
	if(length(O.reagents.reagent_list) > 0)
		for(var/datum/reagent/R in O.reagents.reagent_list)
			dat += SPAN_BLUE("<br>[R.name]: [R.volume]u")
			if(R.explosive)
				ex_potential += R.volume*R.power
			if(R.chemfiresupp)
				int_potential += R.intensitymod * R.volume
				rad_potential += R.radiusmod * R.volume
	return dat

/obj/item/device/demo_scanner/attack_self(mob/user)
	..()

	if(!dat)
		to_chat(user, SPAN_NOTICE("No scan data available."))
		return
	if(alert(user,"Print latest scan?","[scan_name]","Yes","No") == "Yes")
		var/obj/item/paper/printing = new /obj/item/paper/()
		printing.name = scan_name
		printing.info = "Chemicals found: [dat]"
		user.put_in_hands(printing)

/obj/item/device/black_market_scanner
	name = "suspicious device"
	desc = "This is... seemingly a makeshift combination between an autopsy scanner, an ancient t-ray scanner, and some sort of robotic clamp, but you can see a lightbulb inside it. What the hell is this?"
	icon_state = "mendoza_scanner"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 60, "glass" = 30)

/obj/item/device/black_market_scanner/Initialize()
	. = ..()
	update_icon()

/obj/item/device/black_market_scanner/update_icon(scan_value = 0, scanning = FALSE)
	. = ..()
	overlays.Cut()
	overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_flash")
	if(scanning)
		overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_clamp_on")
		switch(scan_value)
			if(0)
				overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_red")
			if(1 to 15)
				overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_orange")
			if(15 to 20)
				overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_yellow")
			if(25 to 30)
				overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_green")
			if(35 to 49)
				overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_cyan")
			else
				overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_white")
		addtimer(CALLBACK(src, PROC_REF(update_icon)), 1 SECONDS)
	else
		overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_clamp_off")

/obj/item/device/black_market_scanner/afterattack(atom/hit_atom, mob/user, proximity)
	if(!proximity)
		return
	if(!ismovable(hit_atom))
		return ..()
	var/market_value = get_black_market_value(hit_atom)
	if(isnull(market_value))
		return ..()
	market_value = POSITIVE(market_value)
	user.visible_message(SPAN_WARNING("[user] presses a button on [src] and holds it over [hit_atom]..."), SPAN_WARNING("You scan [hit_atom]..."))
	update_icon(market_value, TRUE)
	playsound(user, 'sound/machines/twobeep.ogg', 15, TRUE)
	to_chat(user, SPAN_NOTICE("You scan [hit_atom] and notice a reading on [src]'s pad, it says:<b> ITEM HAS [market_value] VALUE <b>"))

/obj/item/device/black_market_hacking_device
	name = "modified security access tuner"
	desc = "A security access tuner with wires and electrical pins sticking out at odd angles. A handwritten label on the bottom says something about the ASRS system."
	icon_state = "bm_hacker"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT
	flags_equip_slot = SLOT_WAIST
	inherent_traits = list(TRAIT_TOOL_BLACKMARKET_HACKER)

/obj/item/device/cmb_black_market_tradeband
	name = "\improper CMB Tradeband Compliance Device"
	desc = "A device used to reset any tampering done to trading devices' signal range. Occasionally used to fix any signal chips damaged in an accident, but often for malpractice in trading. Use this with caution, as it will also reset any evidence of potential illicit trade. Created to fulfill a joint-organization requirement for CMB-ICC teams on the frontier, where tampered machinery was difficult to move and refurbish. Smugglers beware."
	icon_state = "cmb_scanner"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT
	flags_equip_slot = SLOT_WAIST
	inherent_traits = list(TRAIT_TOOL_TRADEBAND)
