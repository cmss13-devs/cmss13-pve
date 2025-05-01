/obj/structure/inventory_machine
	name = "ColMarTech Personal Stash Access Point"
	desc = "A jury-rigged ColMarTech vendor which pulls from the mostly-empty bowels of the ship. It can be used to save various objects for use between operations."
	icon = 'icons/obj/structures/machinery/vending.dmi'
	icon_state = "prep"
	anchored = TRUE
	density = TRUE

	light_range = 4
	light_power = 2
	light_color = "#ebf7fe"  //white blue

	var/currently_accessed = FALSE

	var/disabled = FALSE

	var/datum/persistent_inventory/current_inventory

	var/withdrawing = FALSE

	var/item_processing = FALSE


/obj/structure/inventory_machine/New()
	..()
	GLOB.inventory_boxes += src


/obj/structure/inventory_machine/update_icon()
	if(disabled)
		icon_state = "prep"
		return

	icon_state = "prep"

/obj/structure/inventory_machine/proc/get_full_data(mob/user)
	var/dat

	//title and welcome
	dat += "<b>[name]</b><br>"

	if(!current_inventory)
		dat += "Welcome to your stash. Please press 'access stash' to open your stash, allowing you to add new items or remove items you've placed inside in previous operations.<br>"
		dat += "If you don't have a stash account yet, one will be made for you automatically. <i>Stashes are tied to your ckey.</i>"

		dat += "<a href='?src=\ref[src];access_inv=1'>Access Stash</a>"
	else
		dat += "Welcome <b>[current_inventory.owner_name]</b>,<br><br> You can withdraw or deposit items here. To deposit items, simply insert them into the machine.<br>"

		dat += "<b>[length(current_inventory.stored_items) ? "[length(current_inventory.stored_items)]" : "0"]/[current_inventory.max_possible_items]</b> inventory slots<br><br>"

		dat += "<div class='statusDisplay'>"


		for(var/datum/map_object/MO in current_inventory.stored_items)
			dat += "<a href='?src=\ref[src];choice=withdraw_item;item=\ref[MO]'>Withdraw</a> <b>[MO.name]</b><br>"

		dat += "</div><br>"

		dat += "<br><br><a href='?src=\ref[src];cancel=1'>Exit Inventory</a>"

	return dat

/obj/structure/inventory_machine/attack_hand(mob/user)

//	var/chosen_stash = tgui_input_list(usr, "Access your stash", "Stashed items", ("Access Stash" + "Cancel"))
//	if(chosen_stash == "Cancel")
//		return
//	if(chosen_stash == "Access Stash")
//		access_inv(user)
//	else
//		return

	if(currently_accessed == TRUE)
		visible_message("<b>[src]</b> beeps, \"<span class='danger'>The stash is currently in use by somebody else.</span>\" ")
		return

	var/dat

	currently_accessed = TRUE

	dat = get_full_data(user)

	var/datum/browser/popup = new(usr, "inventory_machine", "Personal Stash", nwidth = 550, nheight = 650)
	popup.set_content(jointext(dat,null))
	popup.open()

	onclose(user, "inventory_machine")
	onclose(currently_accessed = FALSE)


/obj/structure/inventory_machine/attackby(obj/item/I, mob/user)

	if(!ishuman(user))
		return ..()

	var/mob/living/carbon/human/H = user

	if(current_inventory)
		if(current_inventory.max_possible_items <= length(current_inventory.stored_items))
			visible_message("<b>[src]</b> beeps, \"<span class='danger'>Your stash is at maximum capacity.</span>\" ")
			return


		item_processing = TRUE
		user.drop_held_item(I, src)
		I.forceMove(src) // move item into it to prevent glitches.

		current_inventory.add_item(I, user)
		var/savefile/stash = new("data/player_saves/[copytext(H.ckey,1,2)]/[H.ckey]/stash.sav")
		Write(stash)

		item_processing = FALSE
		updateDialog()
		update_icon()
		return

///obj/structure/inventory_machine/proc/load_stash(mob/user,filename="stash.sav")
//	var/mob/living/carbon/human/H = user
//	if(!H.ckey)
//		return
//	var/savefile/stash = new("data/player_saves/[copytext(H.ckey,1,2)]/[H.ckey]/[filename]")
//	Write(stash)

/obj/structure/inventory_machine/proc/check_inventory_lists(mob/user, var/mob/living/carbon/human/H)

	H = user

	if(!H || !H.ckey)
		return FALSE

	var/datum/persistent_inventory/new_inv

	for(var/obj/structure/inventory_machine/INV in GLOB.inventory_boxes)
		if(INV.current_inventory && INV.current_inventory.unique_id == H.ckey)
			return FALSE

	for(var/datum/persistent_inventory/ST in GLOB.persistent_inventories)
		if(ST.unique_id == H.ckey)
			return ST

	new_inv = make_new_inventory(H.ckey)

	if(new_inv)
		var/savefile/stash = new("data/player_saves/[copytext(H.ckey,1,2)]/[H.ckey]/stash.sav")
		Read(stash)
		new_inv.load_inventory()
		new_inv.save_inventory()

		return new_inv


/obj/structure/inventory_machine/proc/make_new_inventory(uid)
	var/datum/persistent_inventory/new_inv = new /datum/persistent_inventory(src)

	new_inv.unique_id = uid

	return new_inv

/obj/structure/inventory_machine/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["access_inv"])
		var/mob/user = usr
		var/mob/living/carbon/human/H = user

		if(!H || !H.ckey)
			to_chat(usr, "<b>You're not a human!</b>")

		if(!check_persistent_storage_exists(H.ckey))
			to_chat(usr, "<b>Eligibility of user confirmed, but no stash is currently on-record. Opening a new stash...</b>")
//			load_stash(H.ckey,filename="stash.sav")
			current_inventory = make_new_inventory(H.ckey)
			to_chat(user, "A new stash has been opened.")
			var/savefile/stash = new("data/player_saves/[copytext(H.ckey,1,2)]/[H.ckey]/stash.sav")
			Write(stash)
			var/dat
			dat = get_full_data(user)
			var/datum/browser/popup = new(usr, "inventory_machine", "Personal Stash", nwidth = 550, nheight = 650)
			popup.set_content(jointext(dat,null))
			popup.open()
			return
		else
			var/datum/persistent_inventory/new_inv = check_inventory_lists(usr, H)

			if(!new_inv)
				visible_message("<b>[src]</b> beeps, \"<span class='danger'>Your stash is currently busy. Ensure that you have logged out of all Stash Access Points.</span>\" ")
				flick("inv-tri_warn",src)
				return

			visible_message("<b>[src]</b> beeps, \"<span class='notice'>Access to stash granted.</span>\" ")
			var/savefile/stash = new("data/player_saves/[copytext(H.ckey,1,2)]/[H.ckey]/stash.sav")
			Write(stash)
			var/dat
			dat = get_full_data(user)
			var/datum/browser/popup = new(usr, "inventory_machine", "Personal Stash", nwidth = 550, nheight = 650)
			popup.set_content(jointext(dat,null))
			popup.open()

			current_inventory = new_inv
			return

	if(href_list["cancel"])
		if(item_processing)
			return FALSE

		current_inventory = null

	if(href_list["choice"])
		switch(href_list["choice"])

			if("withdraw_item")
				var/item = locate(href_list["item"])
				var/mob/user = usr
				var/mob/living/carbon/human/H = user

				if(withdrawing || !current_inventory || !item || !(item in current_inventory.stored_items) )
					return

				var/datum/map_object/MO = item

				withdrawing = TRUE
				var/obj/withdraw_item = full_item_load(MO, get_turf(src))

				if(!withdraw_item)
					withdrawing = FALSE

				playsound(src, 'sound/machines/chime.ogg', 25)
				flick("inv-tri_accept",src)

				to_chat(usr, "\icon[src] <b>[withdraw_item]</b> has been withdrawn.")

				current_inventory.stored_items -= MO
				qdel(MO)
				listclearnulls(current_inventory.stored_items)
				withdrawing = FALSE
				var/savefile/stash = new("data/player_saves/[copytext(H.ckey,1,2)]/[H.ckey]/stash.sav")
				Write(stash)
				var/dat
				dat = get_full_data(user)
				var/datum/browser/popup = new(usr, "inventory_machine", "Personal Stash", nwidth = 550, nheight = 650)
				popup.set_content(jointext(dat,null))
				popup.open()
				return




	updateDialog()
	update_icon()




/proc/check_persistent_storage_exists(unique_id)
	for(var/datum/persistent_inventory/ST in GLOB.persistent_inventories)
		if(ST.unique_id == unique_id)
			return ST

	var/full_path = "data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.sav"
	if(!full_path)			return FALSE
	if(fexists(full_path)) return TRUE

	return FALSE

// datums for persistent inventory
/datum/persistent_inventory
	var/name = "Persistent Inventory"

	var/list/disallowed_items = list()

	var/owner_name = ""
	var/unique_id = ""

	var/list/stored_items = list()

	var/max_possible_items = 60 // it won't exceed this amount

/datum/persistent_inventory/New()
	..()
	GLOB.persistent_inventories += src

/datum/persistent_inventory/proc/add_item(var/obj/item/O, mob/user)
	if(disallowed_items.len && is_type_in_list(O, disallowed_items))
		return FALSE

	var/datum/map_object/MO = full_item_save(O)

	stored_items += MO
	if(user)
		to_chat(user, "You add [O] to the storage.")
	qdel(O)

	save_inventory()

	return MO

/datum/persistent_inventory/proc/save_inventory()
	var/full_path = "data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.sav"
	var/savefile/stash = new("data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.sav")
	Write(stash)
	if(!full_path)			return 0

	var/savefile/S = new /savefile(full_path)
	if(!fexists(full_path)) return 0

	if(!S)					return 0
	S.cd = "/"

	S["stored_items"] 		<<		stored_items
	S["owner_name"] 		<<		owner_name
	S["unique_id"] 		<<		unique_id
	return 1

/datum/persistent_inventory/proc/load_inventory()
	var/init_uid = unique_id
	var/savefile/stash = new("data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.sav")
	Read(stash)

	var/full_path = "data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.sav"
	if(!full_path)			return 0
	if(!fexists(full_path)) return 0

	var/savefile/S = new /savefile(full_path)
	if(!S)					return 0
	S.cd = "/"

	S["stored_items"] 		>>		stored_items
	S["owner_name"] 		>>		owner_name
	S["unique_id"] 		>>		unique_id

	if(!stored_items)
		stored_items = list()
	if(!owner_name)
		owner_name = ""
	if(!unique_id)
		unique_id = init_uid

	listclearnulls(stored_items)

	return 1


/proc/delete_persistent_inventory(unique_id)
	var/full_path = "data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.sav"
	if(!full_path)			return 0

	if(!fexists(full_path)) return 0

	fdel(full_path)

	return 1

///obj/structure/inventory_machine/proc/access_inv()
//	var/mob/user = usr
//	var/mob/living/carbon/human/H = user
//
//	if(!H || !H.ckey)
//		to_chat(usr, "<b>You're not a human!</b>")
//
//	if(!check_persistent_storage_exists(H.ckey))
//		to_chat(usr, "<b>You're eligible, but don't have an account!</b>")
//		return
//	else
//		var/datum/persistent_inventory/new_inv = check_inventory_lists(usr, H)
//
//		if(!new_inv)
//			visible_message("<b>[src]</b> beeps, \"<span class='danger'>Oh no! [usr] I wasn't able to access your inventory account, it either exists already or is open elsewhere!</span>\" ")
//			return
