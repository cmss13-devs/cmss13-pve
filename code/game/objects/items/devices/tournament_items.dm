/obj/item/device/referee
	name = "referee wand"
	icon_state = "signal_wand"
	icon = 'icons/obj/items/items.dmi'
	flags_atom = FPRINT | CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_TINY
	item_state = "electronic"
	throw_speed = SPEED_VERY_FAST
	throw_range = 20

/obj/item/device/referee/afterattack(atom/A, mob/user, proximity)
	if(!ishuman(A))
		return
	var/mob/living/carbon/human/gamer = A
	for(var/datum/effects/tournament_hits/TH in gamer.effects_list)
		qdel(TH)

	user.visible_message(SPAN_NOTICE("<b>[user]</b> points \his wand at <b>[gamer]</b>, removing \his hits."))
	gamer.SetKnockDown(0)

/obj/item/device/megaphone/squad
	name = "squadphone"
	desc = "A device used to project your voice. Loudly. Has been modified to change marines squad-IFF signals remotely."
	icon_state = "squadphone"
	item_state = "radio"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT

/obj/item/device/megaphone/squad/afterattack(atom/target, mob/user, flag)
	setDir(get_dir(user, target))

	if(!ishuman(target))
		return ..()
	var/mob/living/carbon/human/human = target

	var/list/squads = list()
	for(var/datum/squad/S in GLOB.RoleAuthority.squads)
		squads[S.name] = S

	user.visible_message(SPAN_NOTICE("<b>[user]</b> aims \his \the [src] at <b>[human]</b>"))
	var/selected_squad = tgui_input_list(user, "Select a squad.", "Squad Selection", squads)
	if(!selected_squad)
		visible_message(SPAN_WARNING("[src] buzzes."))
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
		return

	var/success = transfer_marine_to_squad(human, squads[selected_squad], human.assigned_squad, human.get_idcard())

	if(success)
		visible_message(SPAN_NOTICE("<b>[src]</b> pings happily!"))
		playsound(src, 'sound/machines/chime.ogg', 50, 1)
	else
		visible_message(SPAN_WARNING("<b>[src]</b> buzzes."))
		playsound(src, 'sound/machines/buzz-two.ogg', 50, 1)
