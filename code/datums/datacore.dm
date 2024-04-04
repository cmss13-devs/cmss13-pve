GLOBAL_DATUM_INIT(data_core, /datum/datacore, new)

/datum/datacore
	var/medical[] = list()
	var/general[] = list()
	var/security[] = list()
	//This list tracks characters spawned in the world and cannot be modified in-game. Currently referenced by respawn_character().
	var/locked[] = list()

/datum/datacore/New()
	. = ..()

	RegisterSignal(SSdcs, COMSIG_GLOB_PLATOON_NAME_CHANGE, PROC_REF(rename_platoon))

/datum/datacore/proc/rename_platoon(datum/source, new_name, old_name)
	SIGNAL_HANDLER

	for(var/datum/data/record/cycled_data_record in general)
		if(cycled_data_record.fields["squad"] == old_name)
			cycled_data_record.fields["squad"] = new_name
/*
get_faction_record(factions = list(FACTION_MARINE), list/record_type = RECORDS_GENERAL) //We'll get the right list in a moment.
	L[0] //Empty list to send back.
	switch(record_type) //What sort of record we're pulling from.
		if(RECORD_GENERAL)
			record_type = general
		if(RECORD_MEDICAL)
			record_type = medical
		if(RECORD_SECURITY)
			record_type = security

	if(record_type)
		var/datum/record/R
		for(var/i in record_type)
			R = i
			if(R.fields[mob_faction] in factions)
				L += R
	return L
*/
/datum/datacore/proc/get_manifest(monochrome, OOC, nonHTML)
	var/list/manifest_out = list() ///This will be our final compiled list.
	var/name ///Iterator for the person's name.
	var/rank ///Iterator for the person's rank.
	var/real_rank ///What their real rank is.
	var/squad_name ///What their squad is called.
	var/datum/job/J ///Referenced through their mob job to pull up where their role is sorted.

	///Returns a list and not HTML itself. Used by the id card computer.
	if(nonHTML)
		var/category
		for(var/datum/data/record/t in GLOB.data_core.general)
			name = t.fields["name"]
			rank = t.fields["rank"]
			squad_name = t.fields["squad"]
			if(!name || !rank) continue

			J = RoleAuthority.roles_by_name[rank]
			if(!J)
				category = JOB_CATEGORY_OTHER
			else
				category = squad_name ? squad_name : J.category

			if(!manifest_out[category]) manifest_out[category] = list()
			manifest_out[category] += list(list(
				"name" = name,
				"rank" = rank
			))

		return manifest_out

	///Returns an HTML table with the manifest.
	var/list/isactive = list()
	var/even = 0 ///For prettier lines.
	var/category_list[] ///To simplify lookup.
	var/mob/M //Iterator.

	var/dat = {"
	<div align='center'>
	<head><style>
		.manifest {border-collapse:collapse;}
		.manifest td, th {border:1px solid [monochrome?"black":"#DEF; background-color:white; color:black"]; padding:.25em}
		.manifest th {height: 2em; [monochrome?"border-top-width: 3px":"background-color: #48C; color:white"]}
		.manifest tr.head th { [monochrome?"border-top-width: 1px":"background-color: #488;"] }
		.manifest td:first-child {text-align:right}
		.manifest tr.alt td {[monochrome?"border-top-width: 2px":"background-color: #DEF"]}
	</style></head>
	<table class="manifest">
	<tr class='head'><th>Name</th><th>Rank</th><th>Activity</th></tr>
	"}

	for(var/datum/data/record/t in GLOB.data_core.general)
		name = t.fields["name"]
		rank = t.fields["rank"]
		real_rank = t.fields["real_rank"]
		squad_name = t.fields["squad"]

		if(!name || !rank || !real_rank) ///If something is missing, we ignore them.
			continue

		if(OOC) ///This returns a more accurate estimate of whether or not they are active.
			isactive[name] = "Inactive"
			for(M in GLOB.player_list)
				if(M.real_name == name && M.client && M.client.inactivity <= 10 * 60 * 10)
					isactive[name] = "Active"
					break
		else
			isactive[name] = t.fields["p_stat"]
			//cael - to prevent multiple appearances of a player/job combination, add a continue after each line

		J = RoleAuthority.roles_by_name[real_rank]
		if(!J) continue ///They should have a job datum with their real rank, but you never know.

		LAZYINITLIST(manifest_out[J.category]) ///Initialize each individual category.
		if(J.category == JOB_CATEGORY_COMBAT)
			if(!squad_name) continue ///If they are a combat role but have no squad, we skip them.
			LAZYINITLIST(manifest_out[J.category][squad_name]) ///Initializes the squad itself.
			LAZYSET(manifest_out[J.category][squad_name][real_rank], name, rank) ///Initializes the person's information for that squad.
		else
			LAZYSET(manifest_out[J.category][real_rank], name, rank) ///Initializes the job category as per normal.

	for(var/category in JOB_CATEGORY_ALL) ///This keeps the list in the same order every time.
		category_list = manifest_out[category]
		if(!length(category_list)) continue ///Should not have empty lists, but it is possible for squads.
		dat += "<tr><th colspan=3>[category]</th></tr>" ///We add this after we've established that we have the category listed.
		if(category == JOB_CATEGORY_COMBAT)
			var/datum/squad_type/S
			for(var/i in RoleAuthority.squads)
				S = i
				if(!category_list[S.name]) continue ///Only if the squad is actually listed.
				dat += "<tr><th colspan=3>[S.name]</th></tr>"
				for(real_rank in category_list[S.name])
					for(name in category_list[S.name][real_rank]) ///This nesting gets confusing. But it's manifest_out -> squad name -> real rank they are -> name = rank
						dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[category_list[S.name][real_rank][name]]</td><td>[isactive[name]]</td></tr>"
						even = !even

		else
			for(real_rank in category_list)
				for(name in category_list[real_rank])
					dat += "<tr[even ? " class='alt'" : ""]><td>[name]</td><td>[manifest_out[category][real_rank][name]]</td><td>[isactive[name]]</td></tr>"
					even = !even

	dat += "</table></div>"
	dat = replacetext(dat, "\n", "") // so it can be placed on paper correctly
	dat = replacetext(dat, "\t", "")
	return dat

///This previously took all of these lists: ROLES_CIC + ROLES_AUXIL_SUPPORT + ROLES_MISC + ROLES_POLICE + ROLES_ENGINEERING + ROLES_REQUISITION + ROLES_MEDICAL + ROLES_MARINES
///And checked every mob for a role in that combined list. I was baffled by this, so I changed it. It checks only the roles that should have access to the manifest, dynamically.
/datum/datacore/proc/manifest(nosleep = 0)
	spawn()
		if(!nosleep)
			sleep(40)

		var/roles_to_inject[] = GET_MANIFEST_ROLES ///At the time of writing it takes (mapped roles | roundstart roles) - blacklisted manifest roles.

		var/mob/living/carbon/human/H
		for(var/i in GLOB.human_mob_list)
			H = i
			if(is_admin_level(H.z))
				continue
			if(H.job in roles_to_inject)
				manifest_inject(H)

/datum/datacore/proc/manifest_modify(name, ref, assignment, rank, p_stat)
	var/datum/data/record/foundrecord

	var/use_name = isnull(ref)
	for(var/datum/data/record/t in GLOB.data_core.general)
		if(use_name)
			if(t.fields["name"] == name)
				foundrecord = t
				break
		else
			if(t.fields["ref"] == ref)
				foundrecord = t
				break

	if(foundrecord)
		if(assignment)
			foundrecord.fields["rank"] = assignment
		if(rank)
			foundrecord.fields["real_rank"] = rank
		if(p_stat)
			foundrecord.fields["p_stat"] = p_stat
		if(!use_name)
			if(name)
				foundrecord.fields["name"] = name
		return TRUE
	return FALSE

/datum/datacore/proc/manifest_inject(mob/living/carbon/human/H)
	var/assignment
	if(H.job)
		assignment = H.job
	else
		assignment = "Unassigned"

	var/id = add_zero(num2hex(H.gid), 6) //this was the best they could come up with? A large random number? *sigh*
	//var/icon/front = new(get_id_photo(H), dir = SOUTH)
	//var/icon/side = new(get_id_photo(H), dir = WEST)

	//General Record
	var/datum/data/record/G = new()
	G.fields["id"] = id
	G.fields["name"] = H.real_name
	G.fields["real_rank"] = H.job
	G.fields["rank"] = assignment
	G.fields["squad"] = H.assigned_squad ? H.assigned_squad.name : null
	G.fields["age"] = H.age
	G.fields["p_stat"] = "Active"
	G.fields["m_stat"] = "Stable"
	G.fields["sex"] = H.gender
	G.fields["species"] = H.get_species()
	G.fields["origin"] = H.origin
	G.fields["faction"] = H.personal_faction
	G.fields["mob_faction"] = H.faction
	G.fields["religion"] = H.religion
	G.fields["ref"] = WEAKREF(H)
	//G.fields["photo_front"] = front
	//G.fields["photo_side"] = side

	if(H.gen_record && !jobban_isbanned(H, "Records"))
		G.fields["notes"] = H.gen_record
	else
		G.fields["notes"] = "No notes found."
	general += G

	//Medical Record
	var/datum/data/record/M = new()
	M.fields["id"] = id
	M.fields["name"] = H.real_name
	M.fields["b_type"] = H.blood_type
	M.fields["mi_dis"] = "None"
	M.fields["mi_dis_d"] = "No minor disabilities have been declared."
	M.fields["ma_dis"] = "None"
	M.fields["ma_dis_d"] = "No major disabilities have been diagnosed."
	M.fields["alg"] = "None"
	M.fields["alg_d"] = "No allergies have been detected in this patient."
	M.fields["cdi"] = "None"
	M.fields["cdi_d"] = "No diseases have been diagnosed at the moment."
	M.fields["last_scan_time"] = null
	M.fields["last_scan_result"] = "No scan data on record" // body scanner results
	M.fields["autodoc_data"] = list()
	M.fields["autodoc_manual"] = list()
	M.fields["ref"] = WEAKREF(H)

	if(H.med_record && !jobban_isbanned(H, "Records"))
		M.fields["notes"] = H.med_record
	else
		M.fields["notes"] = "No notes found."
	medical += M

	//Security Record
	var/datum/data/record/S = new()
	S.fields["id"] = id
	S.fields["name"] = H.real_name
	S.fields["criminal"] = "None"
	S.fields["incident"] = ""
	S.fields["ref"] = WEAKREF(H)

	if(H.sec_record && !jobban_isbanned(H, "Records"))
		var/new_comment = list("entry" = H.sec_record, "created_by" = list("name" = "\[REDACTED\]", "rank" = "Military Police"), "deleted_by" = null, "deleted_at" = null, "created_at" = "Pre-Deployment")
		S.fields["comments"] = list("1" = new_comment)
		S.fields["notes"] = H.sec_record
	security += S


	//Locked Record
	var/datum/data/record/L = new()
	L.fields["id"] = md5("[H.real_name][H.job]")
	L.fields["name"] = H.real_name
	L.fields["rank"] = H.job
	L.fields["age"] = H.age
	L.fields["sex"] = H.gender
	L.fields["b_type"] = H.b_type
	L.fields["species"] = H.get_species()
	L.fields["origin"] = H.origin
	L.fields["faction"] = H.personal_faction
	L.fields["religion"] = H.religion
	L.fields["ref"] = WEAKREF(H)

	if(H.exploit_record && !jobban_isbanned(H, "Records"))
		L.fields["exploit_record"] = H.exploit_record
	else
		L.fields["exploit_record"] = "No additional information acquired."
	locked += L


/proc/get_id_photo(mob/living/carbon/human/H)
	var/icon/preview_icon = null

	//var/g = "m"
	//if (H.gender == FEMALE)
	// g = "f"

	var/icon/icobase = H.species.icobase
	var/icon/temp

	var/datum/ethnicity/ET = GLOB.ethnicities_list[H.ethnicity]
	var/datum/body_type/B = GLOB.body_types_list[H.body_type]

	var/e_icon
	var/b_icon

	if (!ET)
		e_icon = "western"
	else
		e_icon = ET.icon_name

	if (!B)
		b_icon = "mesomorphic"
	else
		b_icon = B.icon_name

	preview_icon = new /icon(icobase, get_limb_icon_name(H.species, b_icon, H.gender, "torso", e_icon))
	temp = new /icon(icobase, get_limb_icon_name(H.species, b_icon, H.gender, "groin", e_icon))
	preview_icon.Blend(temp, ICON_OVERLAY)
	temp = new /icon(icobase, get_limb_icon_name(H.species, b_icon, H.gender, "head", e_icon))
	preview_icon.Blend(temp, ICON_OVERLAY)

	for(var/obj/limb/E in H.limbs)
		if(E.status & LIMB_DESTROYED) continue
		temp = new /icon(icobase, get_limb_icon_name(H.species, b_icon, H.gender, E.name, e_icon))
		if(E.status & LIMB_ROBOT)
			temp.MapColors(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))
		preview_icon.Blend(temp, ICON_OVERLAY)

	//Tail
	if(H.species.tail)
		temp = new/icon("icon" = 'icons/effects/species.dmi', "icon_state" = "[H.species.tail]_s")
		preview_icon.Blend(temp, ICON_OVERLAY)


	var/icon/eyes_s = new/icon("icon" = 'icons/mob/humans/onmob/human_face.dmi', "icon_state" = H.species ? H.species.eyes : "eyes_s")

	eyes_s.Blend(rgb(H.r_eyes, H.g_eyes, H.b_eyes), ICON_ADD)

	var/datum/sprite_accessory/hair_style = GLOB.hair_styles_list[H.h_style]
	if(hair_style)
		var/icon/hair_s = new/icon("icon" = hair_style.icon, "icon_state" = "[hair_style.icon_state]_s")
		hair_s.Blend(rgb(H.r_hair, H.g_hair, H.b_hair), ICON_ADD)
		eyes_s.Blend(hair_s, ICON_OVERLAY)

	var/datum/sprite_accessory/facial_hair_style = GLOB.facial_hair_styles_list[H.f_style]
	if(facial_hair_style)
		var/icon/facial_s = new/icon("icon" = facial_hair_style.icon, "icon_state" = "[facial_hair_style.icon_state]_s")
		facial_s.Blend(rgb(H.r_facial, H.g_facial, H.b_facial), ICON_ADD)
		eyes_s.Blend(facial_s, ICON_OVERLAY)

	var/icon/clothes_s = null
	clothes_s = new /icon('icons/mob/humans/onmob/uniform_0.dmi', "marine_underpants_s")
	clothes_s.Blend(new /icon('icons/mob/humans/onmob/feet.dmi', "black"), ICON_UNDERLAY)
	preview_icon.Blend(eyes_s, ICON_OVERLAY)
	if(clothes_s)
		preview_icon.Blend(clothes_s, ICON_OVERLAY)
	qdel(eyes_s)
	qdel(clothes_s)

	return preview_icon
