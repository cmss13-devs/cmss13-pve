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
	//var/list/buffer_for_report_but_html = list() //no ^sublist today, I want to go to bed on time
	var/datum/health_scan/last_health_display
	var/currently_selected_last_scan = 0
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
		last_health_display.look_at(user, DETAIL_LEVEL_HEALTHANALYSER, bypass_checks = FALSE, ignore_delay = FALSE, alien = alien, associated_equipment = src)
	to_chat(user, SPAN_NOTICE("[user] has analyzed [M]'s vitals."))
	playsound(src.loc, 'sound/items/healthanalyzer.ogg', 50)
	src.add_fingerprint(user)
	return

/obj/item/device/healthanalyzer/attack_self(mob/user)
	..()

	if(!last_scan)
		user.show_message("No previous scan found.")
		return
	if(istype(src, /obj/item/device/healthanalyzer/soul))
		var/obj/item/device/healthanalyzer/soul/disconnect_scanner = src
		if(disconnect_scanner.connected_to)
			disconnect_scanner.disconnect(TRUE)
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
	if(istype(src, /obj/item/device/healthanalyzer/soul))
		last_scan = buffer_for_report[currently_selected_last_scan]
		last_health_display.scanner_device = src
		last_health_display.tgui_interact(user)
	else
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

/datum/looping_sound/healthanalyzer_oxygen_beeping
	start_sound = list('sound/items/healthanalyzer_oxygen_alarm.ogg' = 1)
	mid_sounds = list('sound/items/healthanalyzer_oxygen_alarm.ogg' = 1)
	mid_length = 1 SECONDS
	volume = 3
	extra_range = 14

/datum/looping_sound/healthanalyzer_heart_beeping
	start_sound = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
	mid_sounds = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
	mid_length = 0.9 SECONDS
	volume = 4
	extra_range = 14

/obj/item/device/healthanalyzer/soul
	name = "\improper Health Diagnostic Equipment"
	icon = 'icons/obj/items/medical_scanner.dmi'
	icon_state = "medical_scanner"
	item_state = "medical_scanner"
	item_icons = list(
		WEAR_WAIST = 'icons/mob/humans/onmob/belt.dmi',
		WEAR_BACK = 'icons/mob/humans/onmob/belt.dmi',
		WEAR_J_STORE = 'icons/mob/humans/onmob/belt.dmi',
		)
	item_state_slots = list(
		WEAR_WAIST = "medical_scanner",
		WEAR_BACK = "medical_scanner",
		WEAR_J_STORE = "medical_scanner",)
	flags_equip_slot = SLOT_WAIST | SLOT_BACK | SLOT_SUIT_STORE
	w_class = SIZE_MEDIUM
	var/record_scan_on_connect = FALSE
	var/paper_left = 10
	var/mob/living/carbon/human/connected_to
	var/mob/living/carbon/human/connected_from
	var/datum/beam/current_beam
	var/datum/looping_sound/healthanalyzer_oxygen_beeping/oxygen_alarm_loop
	var/datum/looping_sound/healthanalyzer_heart_beeping/heart_rate_loop
	var/has_silence_mode = FALSE
	var/obj/item/device/quiet_silent_healthanalyzer/silence_chip

/obj/item/device/healthanalyzer/soul/Initialize()
	. = ..()
	heart_rate_loop = new(src)
	oxygen_alarm_loop = new(src)
	overlays += image(icon, src, "+unhooked")

/obj/item/device/healthanalyzer/soul/Destroy()
	QDEL_NULL(silence_chip)
	QDEL_NULL(oxygen_alarm_loop)
	QDEL_NULL(heart_rate_loop)
	QDEL_NULL(current_beam)
	return ..()

/obj/item/device/healthanalyzer/soul/proc/print_report(mob/living/user)
	if(!last_scan)
		to_chat(user, "There is no scan data to print.")
		return
	if(paper_left <= 0)
		to_chat(user, "[src] ran out of paper, and cannot print a report")
		return
	var/obj/item/paper/print_report = new /obj/item/paper
	if(connected_to)
		buffer_for_report += list(last_scan)
		//buffer_for_report_but_html += list(connected_to.health_scan_table(connected_from, FALSE, TRUE, popup_window, alien, FALSE, last_scan))
		currently_selected_last_scan = buffer_for_report.len
	print_report.info += ("Device ID:" + serial_number + "\n" + jointext(health_scan_table(last_scan) + "\n EXTERNAL APPEARANCE AND INJURIES MUST BE \n MANUALLY WRITTEN BY PHYSICIAN: \n","<br>"))
	print_report.info_links += ("Device ID:" + serial_number + "\n" + jointext(health_scan_table(last_scan) + "\n EXTERNAL APPEARANCE AND INJURIES MUST BE \n MANUALLY WRITTEN BY PHYSICIAN: \n","<br>"))
	print_report.update_icon()
	print_report.name = "\improper scan print-out of " + buffer_for_report[currently_selected_last_scan]["patient"]
	user.put_in_hands(print_report)
	paper_left--
	visible_message("\The [src] spits out a piece of paper.")

/obj/item/device/healthanalyzer/soul/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/paper))
		if(!findtext(I.name, "scan print-out of"))
			if(paper_left != initial(paper_left))
				to_chat(user, SPAN_NOTICE("You insert [I] into [src]."))
				qdel(I) //delete the paper item
				paper_left = initial(paper_left)
			else
				to_chat(user, SPAN_NOTICE("[src] is already full."))
	else if(istype(I, /obj/item/device/quiet_silent_healthanalyzer))
		if(!has_silence_mode)
			has_silence_mode = TRUE
			silence_chip = I
			to_chat(user, SPAN_NOTICE("You insert [I] into [src], disabling it's alarm system."))
			user.drop_inv_item_to_loc(I, src)
			name = "Silenced " + name
		else
			to_chat(user, SPAN_NOTICE("This [src] already has a [I] installed."))
	else if(HAS_TRAIT(I, TRAIT_TOOL_SCREWDRIVER))
		user.put_in_hands(silence_chip)
		has_silence_mode = FALSE
		silence_chip = null
		to_chat(user, SPAN_NOTICE("You remove the [I] from the [src]."))
		name = initial(name)

/obj/item/device/quiet_silent_healthanalyzer
	icon_state = "voice0"
	name = "Health Diagnostic Silencer Chip"
	desc = "An override chip for the health diagnostic equipment. It disables the loud alarms of the scanner. Can be removed from the scanner with a screwdriver."
	w_class = SIZE_TINY


/obj/item/device/healthanalyzer/soul/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("A body scanner will provide more comprehensive information than this device.")
	. += SPAN_NOTICE("It has [paper_left] out of [initial(paper_left)] report print-outs left.")
	. += SPAN_HELPFUL("Use paper to refill it.")

/// proc health_scan was a legacy proc for to_chat messages on health analysers. health_scan_table is retrofitted to have parity with the TGUI scan so it can record info for reports
/proc/health_scan_table(scan_data) // ahem. FUCK WHOEVER CODED THIS SHIT AS NUMBERS AND NOT DEFINES.
	var/dat = ""
	// Calculate damage amounts
	var/oxygen_loss = scan_data["oxy"]
	var/toxin_loss = scan_data["toxin"]
	var/brute_loss = scan_data["total_brute"]
	var/fire_loss = scan_data["total_burn"]
	var/OX = oxygen_loss > 50 ? "<b>[oxygen_loss]</b>" : oxygen_loss
	var/TX = toxin_loss > 50 ? "<b>[toxin_loss]</b>" : toxin_loss
	var/BU = fire_loss > 50 ? "<b>[fire_loss]</b>" : fire_loss
	var/BR = brute_loss > 50 ? "<b>[brute_loss]</b>" : brute_loss

	// Show overall
	if(scan_data["dead"])
		dat += "<table border=1 cellspacing=0 cellpadding=3 style='border: 1px solid black;'><td>[scan_data["patient"]] <b>DEAD<b> at " + scan_data["time"] + "\n"
	else
		dat += "<table border=1 cellspacing=0 cellpadding=3 style='border: 1px solid black;'><td>[scan_data["patient"]] <b>[scan_data["health"]]% at " + scan_data["time"] + "\n"
	//dat += "[SET_CLASS("Oxygen", INTERFACE_BLUE)]-[SET_CLASS("Toxin", INTERFACE_GREEN)]-[SET_CLASS("Burns", INTERFACE_ORANGE)]-[SET_CLASS("Brute", INTERFACE_RED)]<td>"
	dat += "\t[SET_CLASS(BR, INTERFACE_RED)] - [SET_CLASS(BU, INTERFACE_ORANGE)] - [SET_CLASS(TX, INTERFACE_GREEN)] - [SET_CLASS(OX, INTERFACE_BLUE)]\n"
	//dat += "\tUntreated: {B}=Burns,{T}=Trauma,{F}=Fracture\n"
	var/list/synth_types = SYNTH_TYPES
	var/species_of_patient = scan_data["species"]
	// Show specific limb damage
	if(species_of_patient == "Human" || synth_types.Find(species_of_patient))
		for(var/limb in scan_data["limb_data_lists"])
			var/brute_treated = TRUE
			var/burn_treated = TRUE
			var/limb_brute = scan_data["limb_data_lists"][limb]["brute"]
			var/limb_burn = scan_data["limb_data_lists"][limb]["burn"]
			var/open_incision = scan_data["limb_data_lists"][limb] ? " <span class='scanner'>Open surgical incision</span>" : ""

			if(limb_brute > 0 && !scan_data["limb_data_lists"][limb]["bandaged"] || open_incision)
				brute_treated = FALSE
			if(limb_burn > 0 && !scan_data["limb_data_lists"][limb]["salved"])
				burn_treated = FALSE
			if(scan_data["limb_data_lists"][limb]["missing"])
				dat += "[capitalize(scan_data["limb_data_lists"][limb]["name"])]: <span class='scannerb'>Missing!</span>\n"
				continue

			var/bleeding_check = FALSE
			if(scan_data["limb_data_lists"][limb]["bleeding"])
				bleeding_check = TRUE
			var/show_limb = (limb_brute > 0 || limb_burn > 0 || scan_data["limb_data_lists"][limb]["limb_splint"] || open_incision || bleeding_check || scan_data["internal_bleeding"])

			var/org_name = "[capitalize(scan_data["limb_data_lists"][limb]["name"])]"
			if(scan_data["limb_data_lists"][limb]["limb_type"] == "Cybernetic")
				if(scan_data["limb_data_lists"][limb]["limb_type"] == "Nonfunctional Cybernetic")
					org_name += " (Nonfunctional Cybernetic)]"
					show_limb = TRUE
				else
					org_name += " (Cybernetic)"
			else if(scan_data["limb_data_lists"][limb]["limb_type"] == "Synthskin")
				org_name += " (Synthskin)"

			var/burn_info = limb_burn > 0 ? "<span class='scannerburnb'>" + "[burn_treated ? "" : "{"]" + "[limb_burn]"  + "[burn_treated ? "" : "}"]" + "</span>" : "<span class='scannerburn'>0</span>"
			//burn_info += "[burn_treated ? "" : "{B}"]"
			var/brute_info =  limb_brute > 0 ? "<span class='scannerb'>" + "[brute_treated ? "" : "{"]" + "[limb_brute]" + "[brute_treated ? "" : "}"]" + "</span>" : "<span class='scanner'>0</span>"
			//brute_info += "[brute_treated ? "" : "{T}"]"
			var/fracture_info = ""
			if(scan_data["limb_data_lists"][limb]["limb_statis"] == "Fracture")
				fracture_info = "{F}"
				show_limb = 1
			var/org_bleed = ""
			if(bleeding_check)
				org_bleed = SPAN_SCANNERB("(Bleeding)")
			if(show_limb)
				dat += "[org_name]: \t [burn_info] - [brute_info] [fracture_info][org_bleed][scan_data["open_incision"]]"
				if(scan_data["limb_data_lists"][limb]["internal_bleeding"])
					dat += SPAN_SCANNERB("(Internal Bleeding)")
					break
				if(scan_data["limb_data_lists"][limb]["limb_splint"])
					dat += "(Splinted)"
				dat += "\n"

	// Show red messages - broken bokes, etc
	if (scan_data["clone"])
		dat += "\t<span class='scanner'> *Subject appears to have been imperfectly cloned.</span>\n"
	for(var/disease in scan_data["diseases"])
		dat += "\t<span class='scannerb'> *Warning: [scan_data["diseases"][disease]["form"]] Detected</span><span class='scanner'>\nName: [scan_data["diseases"][disease]["name"]].\nType: [scan_data["diseases"][disease]["form"]].\nStage: [scan_data["diseases"][disease]["stages"]]/[scan_data["diseases"][disease]["max_stages"]].\nPossible Cure: [scan_data["diseases"][disease]["cure"]]</span>\n"
	if(!scan_data["damaged_organs"] && !scan_data["damaged_organs"]["brain"] && scan_data["damaged_organs"]["brain"]["damage"] >= 100)
		dat += "\t<span class='scanner'> *Subject has taken extreme amounts of <b>brain damage</b></span>.\n"
	if(scan_data["detail_level"])
		for(var/organ in scan_data["damaged_organs"])
			dat += ("\t<span class='scannerb'> [capitalize(organ["name"])]: [num2text(organ["damage"])] Damage.</span> \n")
	dat += SPAN_WARNING("\t[scan_data["ssd"]]\n") // SSD

	if(species_of_patient == "Human" || synth_types.Find(species_of_patient))

		if(scan_data["implants"])
			dat += "\t[SPAN_SCANNER("*<b>Embedded object</b> detected. Advanced scanner required for location.")]\n"

	if(species_of_patient == "Human" || synth_types.Find(species_of_patient))
		// Show helpful reagents
		if(scan_data["chemicals_lists"])
			dat += "\n\tReagents:\n"
			for(var/A in scan_data["chemicals_lists"])
				dat += "\t[scan_data["chemicals_lists"][A]["od"] != 0 ? SPAN_WARNING("<b>OD: </b>") : ""] <font color='#9773C4'><b>[scan_data["chemicals_lists"][A]["amount"]]u [scan_data["chemicals_lists"][A]["name"]]\n</b></font>"
			if(scan_data["has_unknown_chemicals"])
				dat += "\t<span class='scanner'> Warning: Unknown substances detected in subject's blood.</span>\n"

	// Show body temp
	dat += "\n\tBody Temperature: [text2num(scan_data["body_temperature"])] Celsius\n"

	if (species_of_patient == "Human")
		// Show blood level
		var/blood_volume = BLOOD_VOLUME_NORMAL
		if(scan_data["blood_amount"])
			blood_volume = scan_data["blood_amount"]

			var/blood_percent =  blood_volume / 560
			var/blood_type = scan_data["blood_type"]
			blood_percent *= 100
			if(blood_volume <= 500 && blood_volume > 336)
				dat += "\t<span class='scanner'> <b>Blood Level LOW: [blood_percent]% [blood_volume]cl.</span> [SET_CLASS("Type: [blood_type]", INTERFACE_BLUE)]\n"
			else if(blood_volume <= 336)
				dat += "\t<span class='scanner'> <b>Blood Level CRITICAL: [blood_percent]% [blood_volume]cl.</span> [SET_CLASS("Type: [blood_type]", INTERFACE_BLUE)]\n"
			else
				dat += "\tBlood Level normal: [blood_percent]% [blood_volume]cl. Type: [blood_type]\n"

		// Show pulse
		dat += "\tPulse: <span class='[scan_data["pulse"] || scan_data["pulse"] < 1  ? INTERFACE_RED : ""]'>[scan_data["pulse"]].</span> </td></tr></table>"
	dat = replacetext(dat, "\n", "<br>")
	dat = replacetext(dat, "\t", "&emsp;")
	dat = replacetext(dat, "class='warning'", "class='[INTERFACE_RED]'")
	dat = replacetext(dat, "class='scanner'", "class='[INTERFACE_RED]'")
	dat = replacetext(dat, "class='scannerb'", "style='font-weight: bold;' class='[INTERFACE_RED]'")
	dat = replacetext(dat, "class='scannerburn'", "class='[INTERFACE_ORANGE]'")
	dat = replacetext(dat, "class='scannerburnb'", "style='font-weight: bold;' class='[INTERFACE_ORANGE]'")
	return dat

/obj/item/device/healthanalyzer/soul/proc/perform_scan_and_report()
	if(ishuman(connected_from))
		if(!popup_window)
			last_scan = last_health_display.ui_data(connected_from, DETAIL_LEVEL_HEALTHANALYSER)
			to_chat(connected_from, health_scan_table(last_scan))
		else
			if (!last_health_display)
				last_health_display = new(connected_to)
			else
				last_health_display.target_mob = connected_to
				SStgui.close_user_uis(connected_from, src)
				last_scan = last_health_display.ui_data(connected_from, DETAIL_LEVEL_HEALTHANALYSER)
				last_health_display.look_at(connected_from, DETAIL_LEVEL_HEALTHANALYSER, bypass_checks = TRUE, ignore_delay = FALSE, alien = alien, associated_equipment = src)
		src.add_fingerprint()
		if(last_scan && record_scan_on_connect)
			record_scan_on_connect = FALSE
			buffer_for_report += list(last_scan)
			//buffer_for_report_but_html += list(connected_to.health_scan_table(connected_from, FALSE, TRUE, popup_window, alien, FALSE, last_scan))
			currently_selected_last_scan = buffer_for_report.len
		if(buffer_for_report.len > 40)
			buffer_for_report.Cut(0,3) //stop memory leak, maybe

/obj/item/device/healthanalyzer/soul/process()
	//if we're not connected to anything stop doing stuff
	if(!connected_to)
		return PROCESS_KILL
	//if we're further than 3 tile away to stop doing stuff
	if(!(get_dist(src, connected_to) <= 3))
		disconnect(TRUE)
		return PROCESS_KILL
	update_beam(TRUE)
	perform_scan_and_report()
	if(has_silence_mode)
		oxygen_alarm_loop.stop()
		heart_rate_loop.stop()
		return
	var/health_percentage = connected_to.health - connected_to.halloss
	if ((connected_to.oxyloss >= 40 || connected_to.health < -140) && connected_to.stat < 2)
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
	if(health_percentage < -100)
		heart_rate_loop.start_sound = list('sound/items/healthanalyzer_heart_severe.ogg' = 1)
		heart_rate_loop.mid_sounds = list('sound/items/healthanalyzer_heart_severe.ogg' = 1)
		heart_rate_loop.mid_length = 0.374 SECONDS
	if(connected_to.stat > 1) //they're dead
		heart_rate_loop.start_sound = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
		heart_rate_loop.mid_sounds = list('sound/items/healthanalyzer_heart_flatline.ogg' = 1)
		heart_rate_loop.mid_length = 3.110 SECONDS
	heart_rate_loop.start()
	return

/obj/item/device/healthanalyzer/soul/proc/update_beam(new_beam = TRUE)
	connected_from = get_atom_on_turf(src)
	if(current_beam)
		QDEL_NULL(current_beam)
	if(connected_from && connected_to && new_beam && (connected_to != connected_from))
		current_beam = connected_from.beam(get_atom_on_turf(connected_to), "iv_tube", extra_x_offset_at_target = 4)

/obj/item/device/healthanalyzer/soul/attack(mob/living/M, mob/living/user)
	if(M == user)
		if(connected_to)
			disconnect(TRUE)
			return
		to_chat(user, SPAN_WARNING("You cannot connect this to yourself! You need someone else to do it for you!"))
		return

	if(connected_to == M)
		disconnect()
		return

	if(connected_to)
		disconnect(TRUE)

	if(user.action_busy)
		return

	if(!do_after(user, skillcheck(user, SKILL_SURGERY, SKILL_SURGERY_NOVICE) ? (0.2 SECONDS) * user.get_skill_duration_multiplier(SKILL_SURGERY) : (1 SECONDS), INTERRUPT_INCAPACITATED, BUSY_ICON_FRIENDLY, M, BUSY_ICON_MEDICAL))
		to_chat(user, SPAN_WARNING("You were interrupted before you could finish!"))
		return

	if(istype(M, /mob/living/carbon/human))
		connected_to = M
		connected_from = user
		//connected_to.base_pixel_x = 5
		START_PROCESSING(SSobj, src)
		record_scan_on_connect = TRUE
		user.visible_message(SPAN_HELPFUL("[user] attaches \the [src] to [connected_to]."), \
			SPAN_HELPFUL("You attach \the [src] to [connected_to]."))
		icon_state = "medical_scanner_open"
		overlays += image(icon, src, "+running")
		overlays += image(icon, src, "+hooked")
		overlays -= image(icon, src, "+unhooked")
		update_beam()
		perform_scan_and_report()

/obj/item/device/healthanalyzer/soul/proc/disconnect(bad_disconnect = FALSE)
	if(last_scan)
		buffer_for_report += list(last_scan)
		//buffer_for_report_but_html += list(connected_to.health_scan_table(connected_from, FALSE, TRUE, popup_window, alien, TRUE, last_scan))
		currently_selected_last_scan = buffer_for_report.len
	STOP_PROCESSING(SSobj, src)
	heart_rate_loop.stop()
	oxygen_alarm_loop.stop()
	if(!connected_to)
		return
	if(bad_disconnect)
		connected_to.visible_message(SPAN_DANGER("[src] breaks free of [connected_to]!"), SPAN_DANGER("[src] is pulled out of you!"))
	else
		connected_from.visible_message(SPAN_HELPFUL("[connected_from] detaches [src] from [connected_to]."), \
			SPAN_HELPFUL("You detach [src] from [connected_to]."))
	//connected_to.base_pixel_x = 0
	connected_to = null
	connected_from = null

	icon_state = "medical_scanner"
	overlays -= image(icon, src, "+running")
	overlays -= image(icon, src, "+hooked")
	overlays += image(icon, src, "+unhooked")
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
