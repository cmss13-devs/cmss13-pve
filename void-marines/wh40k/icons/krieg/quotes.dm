/mob/living/carbon/human/proc/comsaimtrue()
	set name = "Let aim be true!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Let your aim be true!")
	playsound(src, 'sound/effects/quotes/commissar/aimtrue.ogg', 80, 0, 8)


/mob/living/carbon/human/proc/comsfaceus()
	set name = "Face us, cowards!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Cowaaards, face us in battle!")
	playsound(src, 'sound/effects/quotes/commissar/faceus.ogg', 80, 0, 20)


/mob/living/carbon/human/proc/comsfearme()
	set name = "Fear me, but follow!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Fear me, but follow!")
	playsound(src, 'sound/effects/quotes/commissar/fearme.ogg', 80, 0, 8)


/mob/living/carbon/human/proc/comsfirsttodie()
	set name = "Charge!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Glory for the first men to die, chaaarge!")
	playsound(src, 'sound/effects/quotes/commissar/firsttodie.ogg', 80, 0, 12)


/mob/living/carbon/human/proc/comsflee()
	set name = "Flee and fight!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Flee at your own parole and fight!")
	playsound(src, 'sound/effects/quotes/commissar/flee.ogg', 80, 0, 12)


/mob/living/carbon/human/proc/comsgloryepmeror()
	set name = "Glory to The Emperor!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Glory to The Emperor!")
	playsound(src, 'sound/effects/quotes/commissar/gloryepmeror.ogg', 80, 0, 5)


/mob/living/carbon/human/proc/comsmyscars()
	set name = "My scars prove my worth!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("My scars prove my worth!")
	playsound(src, 'sound/effects/quotes/commissar/myscars.ogg', 80, 0, 7)


/mob/living/carbon/human/proc/comsmywrath()
	set name = "Tremble before my wrath!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Tremble before my wrath!")
	playsound(src, 'sound/effects/quotes/commissar/mywrath.ogg', 80, 0, 5)


/mob/living/carbon/human/proc/comsretreatnotoption()
	set name = "Retreat is not option"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Retreat is not an option")
	playsound(src, 'sound/effects/quotes/commissar/retreatnotoption.ogg', 80, 0, 8)


/mob/living/carbon/human/proc/comsservingme()
	set name = "Serve me now"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("You have the honor of serving me now")
	playsound(src, 'sound/effects/quotes/commissar/servingme.ogg', 80, 0, 8)


/mob/living/carbon/human/proc/comsshallbedone()
	set name = "It shall be done"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("I vow my soul it shall be done!")
	playsound(src, 'sound/effects/quotes/commissar/shallbedone.ogg', 80, 0, 5)


/mob/living/carbon/human/proc/comssomeonehead()
	set name = "I will have someone's head!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("I will have someone's head for this!")
	playsound(src, 'sound/effects/quotes/commissar/someonehead.ogg', 80, 0, 12)


/mob/living/carbon/human/proc/comsstrikeem()
	set name = "Strike them!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Strike them down!")
	playsound(src, 'sound/effects/quotes/commissar/strikeem.ogg', 80, 0, 10)


/mob/living/carbon/human/proc/comstovictory()
	set name = "Forward to victory!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Forward you dogs to victory!")
	playsound(src, 'sound/effects/quotes/commissar/tovictory.ogg', 80, 0, 15)


/mob/living/carbon/human/proc/comswhowithme()
	set name = "With me!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Who is with me!?")
	playsound(src, 'sound/effects/quotes/commissar/whowithme.ogg', 80, 0, 10)


/mob/living/carbon/human/proc/comswillnotfail()
	set name = "I will not fail"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("I will not fail!")
	playsound(src, 'sound/effects/quotes/commissar/willnotfail.ogg', 80, 0, 5)


/mob/living/carbon/human/proc/comswillwhip()
	set name = "I will whip retreats!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("I will whip the first of you who retreats!")
	playsound(src, 'sound/effects/quotes/commissar/willwhip.ogg', 80, 0, 12)


/mob/living/carbon/human/proc/comsyoucannotstand()
	set name = "You cannot stand me!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("You cannot stand against me!")
	playsound(src, 'sound/effects/quotes/commissar/youcannotstand.ogg', 80, 0, 10)


/mob/living/carbon/human/proc/comsyouwereweak()
	set name = "We lost because your weakness!"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("We lost because you were a weak!")
	playsound(src, 'sound/effects/quotes/commissar/youwereweak.ogg', 80, 0, 7)


/mob/living/carbon/human/proc/comsexecute()
	set name = "For cowardish you die"
	set category = "Commissar"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("On charges of cowardish you are sentence to death")
	playsound(src, 'sound/effects/quotes/commissar/execute.ogg', 80, 0, 4)
