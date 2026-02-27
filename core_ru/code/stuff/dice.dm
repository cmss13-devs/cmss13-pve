/mob/living/carbon/human/verb/roll_dice_ic()
	set category = "IC"
	set name = "Roll Dice"

	var/action_text = input(src, "What are you trying to do?", "Dice Roll") as text|null
	if(action_text == null)
		return

	src.roll_dice(action_text)

/mob/living/carbon/human/proc/roll_dice(action_text)
	var/result = rand(1, 18)

	// Build the messages separately
	var/msg_all = "[src] [(action_text && length(action_text)) ? "tries to [action_text] and rolls" : "rolls a dice and gets"] [result]!"
	var/msg_self = "You [(action_text && length(action_text)) ? "try to [action_text]" : "roll a dice"] and get [result]!"

	// Visible to everyone nearby
	visible_message(
		"<span class='notice'>[msg_all]</span>",
		"<span class='notice'>[msg_self]</span>"
	)

	// Log for admins
	log_admin("[src] rolled a dice: [(action_text && length(action_text)) ? action_text : "no action"] → [result]")

	// Show in admin chat with jump option
	message_admins("[src] rolled a dice: [(action_text && length(action_text)) ? action_text : "no action"] → [result] [ADMIN_JMP(src)]", 1)

	return result

/client/proc/roll_dices()
	set name = "God's Dice"
	set category = "Game Master"

	if(!check_rights(R_ADMIN))
		return

	var/sum = input("How many times should we throw?") as num
	var/side = input("Select the number of sides.") as num
	if(!side)
		side = 6
	if(!sum)
		sum = 2

	var/dice = num2text(sum) + "d" + num2text(side)

	if(alert("Do you want to inform the world about your game?", null,"Yes", "No") == "Yes")
		to_chat(world, "<h2 style=\"color:#A50400\">The dice have been rolled by Gods!</h2>")

	var/result = roll(dice)

	if(alert("Do you want to inform the world about the result?", null,"Yes", "No") == "Yes")
		to_chat(world, "<h2 style=\"color:#A50400\">Gods rolled [dice], result is [result]</h2>")

	message_admins("[key_name_admin(src)] rolled dice [dice], result is [result]", 1)
