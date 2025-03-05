// --- Quotes --- \\

/mob/living/carbon/human/proc/astaforemperor()
	set name = "For The Emperor"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("For The Emperor")
	playsound(src, 'void-marines/wh40k/sounds/quotes/foremperor.ogg', 80, 0, 5)

/mob/living/carbon/human/proc/astaforemperorl()
	set name = "For The Emperor!"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("For The Emperor!")
	if(prob(50))
		playsound(src, 'void-marines/wh40k/sounds/quotes/foremperorl.ogg', 80, 0, 12)
	else
		playsound(src, 'void-marines/wh40k/sounds/quotes/foremperorla.ogg', 80, 0, 12)

/mob/living/carbon/human/proc/astachaos()
	set name = "Chaos sighted"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Chaos sighted")
	playsound(src, 'void-marines/wh40k/sounds/quotes/chaos.ogg', 80, 0, 5)


/mob/living/carbon/human/proc/astacharge()
	set name = "Charge!"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Chaaaaarge!")
	playsound(src, 'void-marines/wh40k/sounds/quotes/charge.ogg', 80, 0, 15)

/mob/living/carbon/human/proc/astacrush()
	set name = "We'll crush enemies"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("We will crush the enemies of The Imperium")
	playsound(src, 'void-marines/wh40k/sounds/quotes/crush.ogg', 80, 0, 5)

/mob/living/carbon/human/proc/astadamage()
	set name = "Taking damage"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Taking damage")
	playsound(src, 'void-marines/wh40k/sounds/quotes/damage.ogg', 80, 0, 5)

/mob/living/carbon/human/proc/astadiescum()
	set name = "Die, scum!"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Die, scum!")
	playsound(src, 'void-marines/wh40k/sounds/quotes/diescum.ogg', 80, 0, 15)

/mob/living/carbon/human/proc/astaeatboltgun()
	set name = "Eat boltgun!"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Eat boltgun!")
	playsound(src, 'void-marines/wh40k/sounds/quotes/eatboltgun.ogg', 80, 0, 10)

/mob/living/carbon/human/proc/astafaithshield()
	set name = "Faith is our shield"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Faith is our shield")
	playsound(src, 'void-marines/wh40k/sounds/quotes/faithshield.ogg', 80, 0, 5)

/mob/living/carbon/human/proc/astafallback()
	set name = "Fall back"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Fall back and regroup!")
	playsound(src, 'void-marines/wh40k/sounds/quotes/fallback.ogg', 80, 0, 10)

/mob/living/carbon/human/proc/astaforglory()
	set name = "For the Imperium"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("For the glory of the Imperium")
	playsound(src, 'void-marines/wh40k/sounds/quotes/forglory.ogg', 80, 0, 5)

/mob/living/carbon/human/proc/astagrenades()
	set name = "Let grenades fly!"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Let the grenades fly!")
	playsound(src, 'void-marines/wh40k/sounds/quotes/grenades.ogg', 80, 0, 8)

/mob/living/carbon/human/proc/astakill()
	set name = "Cleanse, purge, kill!"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Cleanse, purge, kill!")
	playsound(src, 'void-marines/wh40k/sounds/quotes/kill.ogg', 80, 0, 8)

/mob/living/carbon/human/proc/astanonestopus()
	set name = "None stop us"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("None shall stop us")
	playsound(src, 'void-marines/wh40k/sounds/quotes/nonestopus.ogg', 80, 0, 5)

/mob/living/carbon/human/proc/astaourwrath()
	set name = "Feel our wrath"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Feel our wrath")
	playsound(src, 'void-marines/wh40k/sounds/quotes/ourwrath.ogg', 80, 0, 5)

/mob/living/carbon/human/proc/astaready()
	set name = "Weapon at ready"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return

	src.say("Weapons at ready, it is time")
	playsound(src, 'void-marines/wh40k/sounds/quotes/ready.ogg', 80, 0, 7)

/mob/living/carbon/human/proc/astatoglory()
	set name = "To glory"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Onward, to glory")
	playsound(src, 'void-marines/wh40k/sounds/quotes/toglory.ogg', 80, 0, 9)


/mob/living/carbon/human/proc/astaxenos()
	set name = "Xenos spotted"
	set category = "Astartes"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	src.say("Xenos spotted")
	playsound(src, 'void-marines/wh40k/sounds/quotes/xenos.ogg', 80, 0, 5)

