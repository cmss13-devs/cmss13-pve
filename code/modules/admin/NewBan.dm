var/CMinutes = null
var/savefile/Banlist


/proc/CheckBan(ckey, id, address)
	if(!Banlist) // if Banlist cannot be located for some reason
		LoadBans() // try to load the bans
		if(!Banlist) // uh oh, can't find bans!
			return 0 // ABORT ABORT ABORT

	. = list()
	var/appeal
	if(CONFIG_GET(string/banappeals))
		appeal = "\nFor more information on your ban, or to appeal, head to <a href='[CONFIG_GET(string/banappeals)]'>[CONFIG_GET(string/banappeals)]</a>"
	Banlist.cd = "/base"
	if( "[ckey][id]" in Banlist.dir )
		Banlist.cd = "[ckey][id]"
		if (Banlist["temp"])
			if (!GetExp(Banlist["minutes"]))
				ClearTempbans()
				return 0
			else
				.["desc"] = "\nReason: [Banlist["reason"]]\nExpires: [GetExp(Banlist["minutes"])]\nBy: [Banlist["bannedby"]][appeal]"
		else
			Banlist.cd = "/base/[ckey][id]"
			.["desc"] = "\nReason: [Banlist["reason"]]\nExpires: <B>PERMENANT</B>\nBy: [Banlist["bannedby"]][appeal]"
		.["reason"] = "ckey/id"
		return .
	else
		for (var/A in Banlist.dir)
			Banlist.cd = "/base/[A]"
			var/matches
			if( ckey == Banlist["key"] )
				matches += "ckey"
			if( id == Banlist["id"] )
				if(matches)
					matches += "/"
				matches += "id"
			if( address == Banlist["ip"] )
				if(matches)
					matches += "/"
				matches += "ip"
			if(matches)
				if(Banlist["temp"])
					if (!GetExp(Banlist["minutes"]))
						ClearTempbans()
						return 0
					else
						.["desc"] = "\nReason: [Banlist["reason"]]\nExpires: [GetExp(Banlist["minutes"])]\nBy: [Banlist["bannedby"]][appeal]"
				else
					.["desc"] = "\nReason: [Banlist["reason"]]\nExpires: <B>PERMENANT</B>\nBy: [Banlist["bannedby"]][appeal]"
				.["reason"] = matches
				return .
	return 0

/proc/UpdateTime() //No idea why i made this a proc.
	CMinutes = (world.realtime / 10) / 60
	return 1

/proc/LoadBans()

	Banlist = new("data/banlist.bdb")
	log_admin("Loading Banlist")

	if (!length(Banlist.dir)) log_admin("Banlist is empty.")

	if (!Banlist.dir.Find("base"))
		log_admin("Banlist missing base dir.")
		Banlist.dir.Add("base")
		Banlist.cd = "/base"
	else if (Banlist.dir.Find("base"))
		Banlist.cd = "/base"

	ClearTempbans()
	return 1

/proc/ClearTempbans()
	UpdateTime()

	Banlist.cd = "/base"
	for (var/A in Banlist.dir)
		Banlist.cd = "/base/[A]"
		if (!Banlist["key"] || !Banlist["id"])
			RemoveBan(A)
			log_admin("Invalid Ban.")
			message_admins("Invalid Ban.")
			continue

		if (!Banlist["temp"]) continue
		if (CMinutes >= Banlist["minutes"]) RemoveBan(A)

	return 1


/proc/AddBan(ckey, computerid, reason, bannedby, temp, minutes, address)
	if(!Banlist) // if Banlist cannot be located for some reason
		LoadBans() // try to load the bans
		if(!Banlist) // uh oh, can't find bans!
			return 0 // ABORT ABORT ABORT

	var/bantimestamp

	if (temp)
		UpdateTime()
		bantimestamp = CMinutes + minutes

	Banlist.cd = "/base"
	if ( Banlist.dir.Find("[ckey][computerid]"))
		RemoveBan("[ckey][computerid]") //have to remove dirs before processing

	Banlist.dir.Add("[ckey][computerid]")
	Banlist.cd = "/base/[ckey][computerid]"
	Banlist["key"] << ckey
	Banlist["id"] << computerid
	Banlist["ip"] << address
	Banlist["reason"] << reason
	Banlist["bannedby"] << bannedby
	Banlist["temp"] << temp
	if (temp)
		Banlist["minutes"] << bantimestamp
	return 1

/proc/RemoveBan(foldername)
	if(!Banlist) // if Banlist cannot be located for some reason
		LoadBans() // try to load the bans
		if(!Banlist) // uh oh, can't find bans!
			return 0 // ABORT ABORT ABORT

	var/key
	var/id

	Banlist.cd = "/base/[foldername]"
	Banlist["key"] >> key
	Banlist["id"] >> id
	Banlist.cd = "/base"

	if (!Banlist.dir.Remove(foldername)) return 0

	if(!usr)
		log_admin("Ban Expired: [key]")
		message_admins("Ban Expired: [key]")
	else
		ban_unban_log_save("[key_name_admin(usr)] unbanned [key]")
		log_admin("[key_name_admin(usr)] unbanned [key]")
		message_admins("[key_name_admin(usr)] unbanned: [key]")
	for (var/A in Banlist.dir)
		Banlist.cd = "/base/[A]"
		if (key == Banlist["key"] /*|| id == Banlist["id"]*/)
			Banlist.cd = "/base"
			Banlist.dir.Remove(A)
			continue

	return 1

/proc/GetExp(minutes as num)
	UpdateTime()
	var/exp = minutes - CMinutes
	if (exp <= 0)
		return 0
	else
		var/timeleftstring
		if (exp >= 1440) //1440 = 1 day in minutes
			timeleftstring = "[round(exp / 1440, 0.1)] Days"
		else if (exp >= 60) //60 = 1 hour in minutes
			timeleftstring = "[round(exp / 60, 0.1)] Hours"
		else
			timeleftstring = "[exp] Minutes"
		return timeleftstring

/datum/admins/proc/unbanpanel()
	var/dat

	var/list/datum/view_record/players/PBV = DB_VIEW(/datum/view_record/players, DB_OR(DB_COMP("is_permabanned", DB_EQUALS, 1), DB_COMP("is_time_banned", DB_EQUALS, 1))) // a filter

	for(var/datum/view_record/players/ban in PBV)
		var/expiry
		if(!ban.is_permabanned)
			expiry = GetExp(ban.expiration)
			if(!expiry)
				expiry = "Removal Pending"
		else
			expiry = "Permaban"
		var/unban_link
		if(ban.is_permabanned)
			unban_link = "<a href='?src=\ref[src];[HrefToken()];unban_perma=[ban.ckey]'>(UP)</a>"
		else
			unban_link = "<A href='?src=\ref[src];[HrefToken(forceGlobal = TRUE)];unbanf=[ban.ckey]'>(UT)</A>"

		dat += "<tr><td>[unban_link] Key: <B>[ban.ckey]</B></td><td>ComputerID: <B>[ban.last_known_cid]</B></td><td>IP: <B>[ban.last_known_ip]</B></td><td> [expiry]</td><td>(By: [ban.admin ? ban.admin : "AdminBot"])</td><td>(Reason: [ban.reason])</td></tr>"

	dat += "</table>"
	var/dat_header = "<HR><B>Bans:</B> <span class='[INTERFACE_BLUE]'>(UP) = Unban Perma (UT) = Unban Timed"
	dat_header += "</span> - <span class='[INTERFACE_GREEN]'>Ban Listing</span><HR><table border=1 rules=all frame=void cellspacing=0 cellpadding=3 >[dat]"
	show_browser(usr, dat_header, "Unban Panel", "unbanp", "size=875x400")

/datum/admins/proc/stickypanel()
	var/add_sticky = "<a href='?src=\ref[src];[HrefToken()];sticky=1;new_sticky=1'>Add Sticky Ban</a>"
	var/find_sticky = "<a href='?src=\ref[src];[HrefToken()];sticky=1;find_sticky=1'>Find Sticky Ban</a>"
	var/refresh_button = "<a href='?src=\ref[src];[HrefToken()];sticky=1;refresh_panel=1'>Refresh Panel</a>"

	var/data = "<hr><b>Sticky Bans:</b> [add_sticky] [find_sticky] [refresh_button] <table border=1 rules=all frame=void cellspacing=0 cellpadding=3>"

	var/list/datum/view_record/stickyban/stickies = DB_VIEW(/datum/view_record/stickyban,
		DB_COMP("active", DB_EQUALS, TRUE)
	)

	for(var/datum/view_record/stickyban/current_sticky in stickies)
		var/whitelist_link = "<a href='?src=\ref[src];[HrefToken()];sticky=[current_sticky.id];whitelist_ckey=1'>(WHITELIST)</a>"
		var/remove_sticky_link = "<a href='?src=\ref[src];[HrefToken()];sticky=[current_sticky.id];remove=1'>(REMOVE)</a>"
		var/add_to_sticky_link = "<a href='?src=\ref[src];[HrefToken()];sticky=[current_sticky.id];add=1'>(ADD)</a>"

		var/impacted_ckey_link = "<a href='?src=\ref[src];[HrefToken()];sticky=[current_sticky.id];view_all_ckeys=1'>CKEYs</a>"
		var/impacted_ip_link = "<a href='?src=\ref[src];[HrefToken()];sticky=[current_sticky.id];view_all_ips=1'>IPs</a>"
		var/impacted_cid_link = "<a href='?src=\ref[src];[HrefToken()];sticky=[current_sticky.id];view_all_cids=1'>CIDs</a>"

		data += "<tr><td>[whitelist_link][remove_sticky_link][add_to_sticky_link]</td><td>Identifier: [current_sticky.identifier]</td><td>Reason: [current_sticky.reason]</td><td>Message: [current_sticky.message]</td> <td>Admin: [current_sticky.admin]</td> <td>View: [impacted_ckey_link][impacted_ip_link][impacted_cid_link]</td></tr>"

	data += "</table>"

	show_browser(owner, data, "Stickyban Panel", "sticky", "size=875x400")

//////////////////////////////////// DEBUG ////////////////////////////////////

/proc/CreateBans()

	UpdateTime()

	var/i
	var/last

	for(i=0, i<1001, i++)
		var/a = pick(1,0)
		var/b = pick(1,0)
		if(b)
			Banlist.cd = "/base"
			Banlist.dir.Add("trash[i]trashid[i]")
			Banlist.cd = "/base/trash[i]trashid[i]"
			Banlist["key"] << "trash[i]"
		else
			Banlist.cd = "/base"
			Banlist.dir.Add("[last]trashid[i]")
			Banlist.cd = "/base/[last]trashid[i]"
			Banlist["key"] << last
		Banlist["id"] << "trashid[i]"
		Banlist["reason"] << "Trashban[i]."
		Banlist["temp"] << a
		Banlist["minutes"] << CMinutes + rand(1,2000)
		Banlist["bannedby"] << "trashmin"
		last = "trash[i]"

	Banlist.cd = "/base"

/proc/ClearAllBans()
	Banlist.cd = "/base"
	for (var/A in Banlist.dir)
		RemoveBan(A)

/client/proc/cmd_admin_do_ban(mob/M)
	if(IsAdminAdvancedProcCall())
		alert_proccall("cmd_admin_do_ban")
		return PROC_BLOCKED
	if(!check_rights(R_BAN|R_MOD))  return

	if(!ismob(M)) return

	if(M.client && M.client.admin_holder && (M.client.admin_holder.rights & R_MOD))
		return //mods+ cannot be banned. Even if they could, the ban doesn't affect them anyway

	if(!M.ckey)
		to_chat(usr, SPAN_DANGER("<B>Warning: Mob ckey for [M.name] not found.</b>"))
		return
	var/mob_key = M.ckey
	var/mins = tgui_input_number(usr,"How long (in minutes)? \n 180 = 3 hours \n 1440 = 1 day \n 4320 = 3 days \n 10080 = 7 days \n 43800 = 1 Month","Ban time", 1440, 262800, 1)
	if(!mins)
		return
	if(mins >= 525600) mins = 525599
	var/reason = input(usr,"Reason? \n\nPress 'OK' to finalize the ban.","reason","Griefer") as message|null
	if(!reason)
		return
	var/datum/entity/player/P = get_player_from_key(mob_key) // you may not be logged in, but I will find you and I will ban you
	if(P.is_time_banned && alert(usr, "Ban already exists. Proceed?", "Confirmation", "Yes", "No") != "Yes")
		return
	P.add_timed_ban(reason, mins)

/client/proc/cmd_admin_do_stickyban(identifier, reason, message, list/impacted_ckeys, list/impacted_cids, list/impacted_ips)
	if(!identifier)
		identifier = tgui_input_text(src, "Name of the primary CKEY you are adding a stickyban to.", "BuildABan")
	if(!identifier)
		return

	if(!message)
		message = tgui_input_text(src, "What message should be given to the impacted users?", "BuildABan", encode = FALSE)
	if(!message)
		return

	if(!reason)
		reason = tgui_input_text(src, "What's the reason for the ban? This is shown internally, and not displayed in public notes and ban messages. Include as much detail as necessary.", "BuildABan", multiline = TRUE, encode = FALSE)
	if(!reason)
		return

	if(!length(impacted_ckeys))
		impacted_ckeys = splittext(tgui_input_text(src, "Which CKEYs should be impacted by this ban? Include the primary ckey, separated by semicolons.", "BuildABan", "player1;player2;player3"), ";")

	if(!length(impacted_cids))
		impacted_cids = splittext(tgui_input_text(src, "Which CIDs should be impacted by this ban? Separate with semicolons.", "BuildABan", "12345678;87654321"), ";")

	if(!length(impacted_ips))
		impacted_ips = splittext(tgui_input_text(src, "Which IPs should be impacted by this ban? Separate with semicolons.", "BuildABan", "1.1.1.1;8.8.8.8"), ";")

	var/datum/entity/stickyban/new_sticky = SSstickyban.add_stickyban(identifier, reason, message, player_data)

	if(!new_sticky)
		to_chat(src, SPAN_ADMIN("Failed to apply stickyban."))
		return

	for(var/ckey in impacted_ckeys)
		SSstickyban.add_matched_ckey(new_sticky.id, ckey)

	for(var/cid in impacted_cids)
		SSstickyban.add_matched_cid(new_sticky.id, cid)

	for(var/ip in impacted_ips)
		SSstickyban.add_matched_ip(new_sticky.id, ip)

	log_admin("STICKYBAN: Identifier: [identifier] Reason: [reason] Message: [message] CKEYs: [english_list(impacted_ckeys)] IPs: [english_list(impacted_ips)] CIDs: [english_list(impacted_cids)]")
	message_admins("[key_name_admin(src)] has added a new stickyban with the identifier '[identifier]'.")
	var/datum/tgs_chat_embed/field/reason_embed = new("Stickyban Reason", reason)
	important_message_external("[src] has added a new stickyban with the identifier '[identifier]'.", "Stickyban Placed", list(reason_embed))
