/datum/emote/living/carbon/human/blink
	key_third_person = "моргает"
	message = "моргает."

/datum/emote/living/carbon/human/blink_rapid
	message = "быстро моргает."

/datum/emote/living/carbon/human/bow
	key_third_person = "махает рукой"
	message = "махает рукой."
	message_param = "махает рукой %t."

/datum/emote/living/carbon/human/chuckle
	key_third_person = "посмеивается"
	message = "посмеивается."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/clap
	key_third_person = "хлопает"
	message = "хлопает."

/datum/emote/living/carbon/human/collapse
	key_third_person = "сворачивается"
	message = "сворачивается!"

/datum/emote/living/carbon/human/cough
	key_third_person = "кашляет"
	message = "кашляет!"

/datum/emote/living/carbon/human/cry
	key_third_person = "плачет"
	message = "плачет."

/datum/emote/living/carbon/human/eyebrow
	message = "поднимает бровь."

/datum/emote/living/carbon/human/facepalm
	key_third_person = "шлёпает рукой по лицу"
	message = "шлёпает рукой по лицу."

/datum/emote/living/carbon/human/faint
	key_third_person = "теряает сознание"
	message = "теряает сознание!"

/datum/emote/living/carbon/human/frown
	key_third_person = "хмурится"
	message = "хмурится."

/datum/emote/living/carbon/human/gasp
	key_third_person = "задыхается"
	message = "задыхается!"

/datum/emote/living/carbon/human/giggle
	key_third_person = "хихикает"
	message = "хихикает."
	emote_type = EMOTE_AUDIBLE|EMOTE_VISIBLE

/datum/emote/living/carbon/human/glare
	key_third_person = "смотрит"
	message = "смотрит."
	message_param = "смотрит на %t."

/datum/emote/living/carbon/human/golfclap
	key_third_person = "медленно хлопает"
	message = "хлопает. Медленно хлопает."
	alt_message = "хлопает"

/datum/emote/living/carbon/human/grin
	key_third_person = "ухмыляется"
	message = "ухмыляется."

/datum/emote/living/carbon/human/grumble
	key_third_person = "ворчит"
	message = "ворчит."

/datum/emote/living/carbon/human/handshake
	message_param = "пожимает руку %t."

/datum/emote/living/carbon/human/laugh
	key_third_person = "смеётся"
	message = "смеётся!"

/datum/emote/living/carbon/human/look
	key_third_person = "смотрит"
	message = "смотрит."
	message_param = "смотрит на %t."

/datum/emote/living/carbon/human/medic
	message = "зовёт медика!"
	alt_message = "кричит что-то"

/datum/emote/living/carbon/human/medic/run_langchat(mob/user, group)
	if(!ishuman_strict(user))
		return

	var/medic_message = pick("Медика!", "Док!", "Помощи!")
	user.langchat_speech(medic_message, group, GLOB.all_languages, skip_language_check = TRUE, animation_style = LANGCHAT_FAST_POP, additional_styles = list("langchat_bolded"))

/datum/emote/living/carbon/human/moan
	key_third_person = "стонет"
	message = "стонет."

/datum/emote/living/carbon/human/mumble
	key_third_person = "бормочет"
	message = "бормочет."

/datum/emote/living/carbon/human/nod
	key_third_person = "кивает"
	message = "кивает."

/datum/emote/living/carbon/human/pain
	message = "хмыкает от боли!"
	alt_message = "хмычит"

/datum/emote/living/carbon/human/pain/run_langchat(mob/user, group)
	if(!ishuman_strict(user))
		return

	var/pain_message = pick("АУЧ!!", "АГХ!!", "АРГХ!!", "АЙЙ!!", "АУ!!", "УХ!")
	user.langchat_speech(pain_message, group, GLOB.all_languages, skip_language_check = TRUE, animation_style = LANGCHAT_FAST_POP, additional_styles = list("langchat_yell"))

/datum/emote/living/carbon/human/salute
	key_third_person = "отдаёт честь"
	message = "отдаёт честь."
	message_param = "отдаёт честь %t."

/datum/emote/living/carbon/human/scream
	key_third_person = "кричит"
	message = "кричит!"

/datum/emote/living/carbon/human/scream/run_langchat(mob/user, group)
	if(!ishuman_strict(user))
		return

	var/scream_message = pick("БЛЯТЬ!!!", "АГХ!!!", "АРГХ!!!", "АААА!!!", "ГА-АХХ!!!", "НА-АХ!!!", "НГ-Х!!!", "А-ЙЙ!!!")
	user.langchat_speech(scream_message, group, GLOB.all_languages, skip_language_check = TRUE, animation_style = LANGCHAT_PANIC_POP, additional_styles = list("langchat_yell"))

/datum/emote/living/carbon/human/shakehead
	message = "мотает головой."

/datum/emote/living/carbon/human/shiver
	key_third_person = "дрожит"
	message = "дрожит."

/datum/emote/living/carbon/human/shrug
	key_third_person = "пожимает плечами"
	message = "пожимает плечами."

/datum/emote/living/carbon/human/sigh
	key_third_person = "вздыхает"
	message = "вздыхает."
	volume = 25
	cooldown = 10 SECONDS
	emote_type = EMOTE_AUDIBLE|EMOTE_VISIBLE

/datum/emote/living/carbon/human/smile
	key_third_person = "улыбается"
	message = "улыбается."

/datum/emote/living/carbon/human/sneeze
	key_third_person = "чихает"
	message = "чихает!"
	cooldown = 10 SECONDS
	emote_type = EMOTE_AUDIBLE|EMOTE_VISIBLE

/datum/emote/living/carbon/human/snore
	key_third_person = "храпит"
	message = "храпит."
	emote_type = EMOTE_AUDIBLE|EMOTE_VISIBLE

/datum/emote/living/carbon/human/stare
	key_third_person = "пялится"
	message = "пялится."
	message_param = "пялится на %t."

/datum/emote/living/carbon/human/signal
	key_third_person = "сигнализирует"
	message_param = "поднимает %t пальцев."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/signal/run_emote(mob/user, params, type_override, intentional)
	params = text2num(params)
	if(params == 1 || !isnum(params))
		return "поднимает один палец."
	if(params == (clamp(params, 2, 4)) || !isnum(params))
		return "поднимает %t пальца."
	params = num2text(clamp(params, 5, 10))
	return ..()

/datum/emote/living/carbon/human/stop
	message = "выкидывает ладонь вверх, жестикулируя остановится."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/thumbsup
	message = "показывает палец вверх."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/thumbsdown
	message = "показывает палец вниз."

/datum/emote/living/carbon/human/twitch
	key_third_person = "дёргается"
	message = "дёргается."

/datum/emote/living/carbon/human/wave
	key_third_person = "махает"
	message = "махает."

/datum/emote/living/carbon/human/yawn
	key_third_person = "зевает"
	message = "зевает."
	volume = 25
	cooldown = 10 SECONDS
	emote_type = EMOTE_AUDIBLE|EMOTE_VISIBLE

/datum/emote/living/carbon/human/warcry
	message = "выкрикивает боевой клич!"
	alt_message = "выкрикивает что-то"

/datum/emote/living/carbon/human/whimper
	key_third_person = "хнычет"
	message = "хнычет."

/datum/emote/living/carbon/human/spit
	key = "spit"
	key_third_person = "spits"
	message = "spits on something."
	alt_message = "spits"
	sound = 'void-marines/sound/misc/spitemote.ogg'
	cooldown = 5 SECONDS
	emote_type = EMOTE_AUDIBLE|EMOTE_VISIBLE

/datum/emote/living/carbon/human/laugh/get_sound(mob/living/user)
	if(ishumansynth_strict(user))
		if(user.gender == MALE)
			return pick('void-marines/sound/misc/human_male_laugh_1.ogg', 'void-marines/sound/misc/human_male_laugh_2.ogg')
		else
			return pick('void-marines/sound/misc/human_female_laugh_1.ogg', 'void-marines/sound/misc/human_female_laugh_2.ogg')

/datum/emote/living/carbon/human/warcry/get_sound(mob/living/user)
	var/default_lang = user.get_default_language()
	if(ishumansynth_strict(user))
		if(user.gender == MALE)
			if(default_lang == GLOB.all_languages[LANGUAGE_RUSSIAN])
				return get_sfx("male_upp_warcry")
			else if(default_lang == GLOB.all_languages[LANGUAGE_JAPANESE])
				return get_sfx("male_clf_warcry")
			else
				return get_sfx("male_warcry")
		if(user.gender == FEMALE)
			if(default_lang == GLOB.all_languages[LANGUAGE_RUSSIAN])
				return get_sfx("female_upp_warcry")
			else if(default_lang == GLOB.all_languages[LANGUAGE_JAPANESE])
				return get_sfx("male_clf_warcry") // ( ͡° ͜ʖ ͡°)
			else
				return get_sfx("female_warcry")

/datum/emote/living/carbon/human/yawn/get_sound(mob/living/user)
	if(user.gender == MALE)
		return pick('void-marines/sound/misc/yawn_male_1.ogg', 'void-marines/sound/misc/yawn_male_2.ogg')
	else
		return // Не для женщин, найдите нормальное МП3 или ОГГ

/datum/emote/living/carbon/human/sigh/get_sound(mob/living/user)
	if(user.gender == MALE)
		return 'void-marines/sound/misc/sigh_male.ogg'
	else
		return 'void-marines/sound/misc/sigh_female.ogg'

/datum/emote/living/carbon/human/sneeze/get_sound(mob/living/user)
	if(user.gender == MALE)
		return pick('void-marines/sound/misc/sneeze_male_1.ogg', 'void-marines/sound/misc/sneeze_male_2.ogg')
	else
		return pick('void-marines/sound/misc/sneeze_female_1.ogg', 'void-marines/sound/misc/sneeze_female_2.ogg')
