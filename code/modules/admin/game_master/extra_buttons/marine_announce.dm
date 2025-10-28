/client/proc/admin_marine_announcement()
	set name = "Command Announcement"
	set category = "Game Master.Extras"

	if(!check_rights(R_ADMIN))
		return

	var/body = tgui_input_text(src, "Enter the body text for the announcement.", title = "Announcement Body", multiline = TRUE, encode = FALSE)
	if(!body)
		return
	var/title = tgui_input_text(src, "Enter the title of the announcement. Leave blank for the default title.", title = "Announcement Title")
	if(!title)
		title = COMMAND_ANNOUNCE
	marine_announcement(body, "[title]")
	message_admins("[key_name_admin(src)] has made an admin command announcement.")
	log_admin("[key_name_admin(src)] made an admin command announcement: [body]")
