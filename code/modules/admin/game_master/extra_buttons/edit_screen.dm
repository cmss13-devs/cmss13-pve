/client/proc/game_master_edit_screens()
	set name = "Edit Players's Screen"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	edit_screen_all(mob)

/proc/edit_screen_all(mob/renamer)
	var/list/screens_to_modify = list()
	for(var/mob/living/carbon/human/human in GLOB.alive_human_list)
		if(!human.client)
			return
		for(var/obj/render_plane_relay/screens in human.client.screen)
			screens_to_modify += screens
	var/transform_or_filters = tgui_input_list(usr, "What do you want to do?","Pick your poison", list("Transform","Filters","Color", "Cancel"))
	if(!transform_or_filters)
		return
	switch(transform_or_filters)
		if("Cancel")
			return
		if("Transform")
			var/result = tgui_input_list(usr, "Choose the transformation to apply","Transform Mod", list("Scale","Translate","Rotate", "Reflect X Axis", "Reflect Y Axis"))
			if(!result)
				return
			if(!result)
				return
			switch(result)
				if("Scale")
					var/x = tgui_input_real_number(usr, "Choose x mod","Transform Mod")
					var/y = tgui_input_real_number(usr, "Choose y mod","Transform Mod")
					if(isnull(x) || isnull(y))
						return
					for(var/obj/render_plane_relay/screen in screens_to_modify)
						var/matrix/base_matrix = matrix(screen.base_transform)
						screen.update_base_transform(base_matrix.Scale(x,y))
				if("Translate")
					var/x = tgui_input_real_number(usr, "Choose x mod (negative = left, positive = right)","Transform Mod")
					var/y = tgui_input_real_number(usr, "Choose y mod (negative = down, positive = up)","Transform Mod")
					if(isnull(x) || isnull(y))
						return
					for(var/obj/render_plane_relay/screen in screens_to_modify)
						var/matrix/base_matrix = matrix(screen.base_transform)
						screen.update_base_transform(base_matrix.Translate(x,y))
				if("Rotate")
					var/angle = tgui_input_real_number(usr, "Choose angle to rotate","Transform Mod")
					if(isnull(angle))
						return
					for(var/obj/render_plane_relay/screen in screens_to_modify)
						var/matrix/base_matrix = matrix(screen.base_transform)
						screen.update_base_transform(base_matrix.Turn(angle))
				if("Reflect X Axis")
					var/matrix/reflector = matrix()
					reflector.a = -1
					reflector.d = 0
					reflector.b = 0
					reflector.e = 1
					for(var/obj/render_plane_relay/screen in screens_to_modify)
						var/matrix/current = matrix(screen.base_transform)
						screen.update_base_transform(current * reflector)

				if("Reflect Y Axis")
					var/matrix/reflector = matrix()
					reflector.a = 1
					reflector.d = 0
					reflector.b = 0
					reflector.e = -1
					for(var/obj/render_plane_relay/screen in screens_to_modify)
						var/matrix/current = matrix(screen.base_transform)
						screen.update_base_transform(current * reflector)
			for(var/obj/render_plane_relay/screen in screens_to_modify)
				SEND_SIGNAL(screen, COMSIG_ATOM_VV_MODIFY_TRANSFORM)