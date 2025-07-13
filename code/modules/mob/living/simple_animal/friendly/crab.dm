//Look Sir, free crabs!
/mob/living/simple_animal/crab
	name = "crab"
	desc = "A hard-shelled crustacean. Seems quite content to lounge around all the time."
	icon_state = "crab"
	icon_living = "crab"
	icon_dead = "crab_dead"
	mob_size = MOB_SIZE_SMALL
	speak_emote = list("clicks")
	emote_hear = list("clicks")
	emote_see = list("clacks")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/reagent_container/food/snacks/meat
	response_help  = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm   = "stomps the"
	stop_automated_movement = 1
	friendly = "pinches"
	black_market_value = 50
	dead_black_market_value = 0
	var/obj/item/inventory_head
	var/obj/item/inventory_mask

/mob/living/simple_animal/crab/Life(delta_time)
	..()
	//CRAB movement
	if(!ckey && !stat)
		if(isturf(src.loc) && !resting && !buckled) //This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				Move(get_step(src,pick(4,8)))
				turns_since_move = 0
	regenerate_icons()

//COFFEE! SQUEEEEEEEEE!
/mob/living/simple_animal/crab/Coffee
	name = "Coffee"
	real_name = "Coffee"
	desc = "It's Coffee, the other pet!"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"

//Look Sir, free crabs!
/mob/living/simple_animal/scorpion
	name = "scorpion"
	desc = "Predatory arachnid, most commonly living in deserts. Watch out for its stinger!"
	desc_lore = "This one bears striking resemblance to species found on Earth, and the explanation for this phenomena is obvious: one of the more well-endowed colonists (perhaps, WY-assigned supervisor) brought their pet scorpion which then escaped into the wild, giving birth to numerous offspring."
	icon_state = "scorpion"
	icon_living = "scorpion"
	icon_dead = "scorpion_dead"
	mob_size = MOB_SIZE_SMALL
	speak_emote = list("clicks")
	emote_hear = list("clicks")
	emote_see = list("clacks")
	stop_automated_movement = FALSE
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/reagent_container/food/snacks/meat
	response_help  = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm   = "stomps the"
	stop_automated_movement = 1
	friendly = "pinches"
	var/evil = TRUE

/mob/living/simple_animal/scorpion/attack_hand(mob/user)
	if(prob(25) && ishuman(user) && evil)
		var/mob/living/carbon/human/human = user
		visible_message(SPAN_WARNING("[src] stings [human]!"))
		human.reagents.add_reagent("sttoxin", rand(4, 7))
		return
	..()


/mob/living/simple_animal/scorpion/wounded
	desc = "Predatory arachnid, mainly commonly in deserts. This one is missing its stinger, poor guy."
	icon_state = "scorpion_wounded"
	icon_living = "scorpion_wounded"
	icon_dead = "scorpion_wounded_dead"
	evil = FALSE
