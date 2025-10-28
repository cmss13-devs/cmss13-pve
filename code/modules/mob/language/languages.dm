/datum/language/common
	name = LANGUAGE_ENGLISH
	desc = "Common Earth English. The standard language of the United Americas."
	speech_verb = "says"
	ask_verb = "asks"
	exclaim_verb = list("exclaims","shouts","yells")
	key = "1"
	flags = RESTRICTED

	syllables = list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio", "uld", "ver", "was", "wit", "you")
/datum/language/generated //parent type for languages with custom sound generation methods like chinese and japanese
	space_chance = 100 //uses a unique system

// Galactic common languages (systemwide accepted standards).
/datum/language/scandinavian
	name = LANGUAGE_SCANDINAVIAN
	desc = "While not technically one language, Scandinavian languages have grown similar and are nearly indistinguishable from one another unless you actually know the languages."
	speech_verb = "utters"
	ask_verb = "queries"
	exclaim_verb = "yelps"
	color = "scandinavian"
	key = "0"

	syllables = list("de", "vin", "meg", "og", "vi", "en", "nei", "ing", "gen", "et", "pur", "ke", "er", "nei", "hjort", "tysk", "de", "kjae", "en", "stein", "ja", "ull", "sil", "pa", "hun", "kjo", "erg", "ba", "re", "ol", "kyll", "menn", "esk", "gul", "gronn", "natt", "makt", "to", "fi", "re", "dag", "god", "jul", "ild", "fem", "jeg", "deg", "bjor", "en", "russ", "land", "sve", "rig", "nor", "ge", "dan", "is")

/datum/language/generated/japanese
	name = LANGUAGE_JAPANESE
	desc = "A notoriously complex language boasting an extensive grammatical system, three writing systems, and a new smattering of English loanwords. It has gained popularity due to high cultural contact in the 3WE, and finds use outside due to emigration."
	speech_verb = "vocalizes"
	color = "japanese"
	key = "2"

/datum/language/russian
	name = LANGUAGE_RUSSIAN
	desc = "An East Slavic language from Earth. The dominant tongue of the UPP and frequently used by Slavic minorities in the United Americas."
	speech_verb = "enunciates"
	color = "soghun"
	key = "3"

	syllables = list("al", "an", "bi", "vye", "vo", "go", "dye", "yel", "en", "yer", "yet", "ka", "ko", "la", "ly", "lo", "l", "na", "nye", "ny", "no", "ov", "ol", "on", "or", "slog", "ot", "po", "pr", "ra", "rye", "ro", "st", "ta", "tye", "to", "t", "at", "bil", "vyer", "yego", "yeny", "yenn", "yest", "kak", "ln", "ova", "ogo", "oro", "ost", "oto", "pry", "pro", "sta", "stv", "tor", "chto", "eto", "rus", "nar", "arya", "mol")

/datum/language/german
	name = LANGUAGE_GERMAN
	desc = "Standard High-German, a language spoken mostly in Central Europe, and by German immigrants elsewhere."
	speech_verb = "proclaims"
	ask_verb = "inquires"
	exclaim_verb = "bellows"
	color = "german"
	key = "4"

	syllables = list("die", "das", "wein", "mir", "und", "wir", "ein", "nein", "gen", "en", "sauen", "bin", "nein", "rhein", "deut", "der", "lieb", "en", "stein", "nein", "ja", "wolle", "sil", "bei", "der", "sie", "sch", "kein", "nur", "ach", "kann", "volk", "vau", "gelb", "grun", "macht", "zwei", "vier", "nacht", "tag")

/datum/language/spanish
	name = LANGUAGE_SPANISH
	desc = "The second most common language spoken in the UA, brought from marines from the Latin American territories and in the former southern USA."
	speech_verb = "states"
	ask_verb = "quizes"
	exclaim_verb = "yells"
	color = "spanish"
	key = "5"

	syllables = list("ha", "pana", "ja", "blo", "que", "spa", "di", "ga", "na", "ces", "si", "mo", "so", "de", "el", "to", "ro", "mi", "ca", "la", "di", "ah", "mio", "tar", "ion", "gran", "van", "jo", "cie", "qie", "las", "locho", "mas", "no", "gui", "es", "mal")

/datum/language/portuguese
	name = LANGUAGE_PORTUGUESE
	desc = "The third most common language spoken in the UA."
	speech_verb = "states"
	ask_verb = "quizes"
	exclaim_verb = "yells"
	color = "portuguese"
	key = "6"

	syllables = list("o", "de", "e", "que", "um", "para", "com", "por", "seu", "outro", "ele", "já", "eiro", "bem", "bom", "só", "iço", "iça", "lho", "lha", "ção", "pois", "hoje", "ém", "hão", "três", "ela", "aço", "aça", "ça", "você", "ança", "lhe", "lher", "lado", "fim", "nem", "são", "vir", "sem", "sim", "nó", "se", "em", "até", "esse", "nosso", "eu", "dois", "ar", "mal", "não", "muito", "bém", "mais", "en", "tão", "lá", "aí", "ou")

/datum/language/french
	name = LANGUAGE_FRENCH
	desc = "The most spoken language on Earth. Vive la France."
	speech_verb = "proclaims"
	ask_verb = "inquires"
	exclaim_verb = "bellows"
	color = "french"
	key = "7"

	syllables = list("la", "là", "pou", "tu", "cou", "fou", "sous", "chou", "je", "ro", "po", "me", "âge", "île", "ni", "moi", "ami", "pâtes", "fromage", "vin", "coup", "grâce", "rôle", "et", "beau", "cuit", "clé", "eau", "lit", "pain", "plus", "trop", "agi", "bien", "songé", "cure", "vite", "dur", "vide", "cru", "bas", "ta", "pis", "pire", "mieux", "meilleur", "bien", "mauvais", "à", "belle", "mur", "sac", "chez", "ai", "pomme", "que", "longe", "genre", "mon", "gérée", "série", "erreur", "ira", "jeu", "jou", "pu", "puis", "qui", "que", "côté", "côte", "vie", "ville", "sur", "tard", "les", "des", "voix", "pluie", "pont", "pot", "roue", "peu", "sec", "vis", "où", "ou", "seul", "mienne", "os", "né", "mort", "trou", "pâle", "tue", "cher", "en", "incroyable", "on", "un", "eu", "au", "œil", "aide", "oui", "non", "si", "été", "nez", "près", "après", "mûr", "sûr", "croît", "ère", "lui", "tâche")

/datum/language/generated/chinese
	name = LANGUAGE_CHINESE
	desc = "The secondary language of the UPP, widespread around Asia and with a notable immigrant population in other parts of the world. The most spoken language in charted space."
	speech_verb = "voices"
	ask_verb = "questions"
	exclaim_verb = "shouts"
	color = "chinese"
	key = "8"

/datum/language/ruspatois
	name = LANGUAGE_RUSPATOIS
	desc = "Russian patois spoken by Eastern Europeans residing for decades within the UA and TWE. Largely incompatible with contemporary Russian."
	speech_verb = "says"
	color = "ruspatois"
	key = "9"

	syllables = list("che", "de", "da", "du", "yo", "yu", "ty", "yon", "ka", "ke", "don", "yed", "mas", "kyen", "no", "ua", "khe", "kha", "o", "na", "has", "ya", "yen", "tra", "blo", "kho", "est", "soi", "dos", "par", "dya", "tan", "ey", "sa", "kom", "nyo", "min", "svi", "yan", "suy", "des", "ven", "vo", "ro", "ku", "tak", "u", "ov", "so", "ri", "kab", "ten", "nos", "mi", "an", "su", "men", "ma", "dro", "li", "ak", "om", "er", "ir", "ar", "ote", "op", "ki", "to")

/datum/language/filipino
	name = LANGUAGE_FILIPINO
	desc = "The fourth most common language spoken in the UA."
	speech_verb = "states"
	ask_verb = "quizes"
	exclaim_verb = "yells"
	color = "filipino"
	key = "f"

	syllables = list("ako", "ito", "dito", "an", "paa", "lam", "kai", "tay", "saan", "taba", "hok", "kama", "ta", "opi", "oo", "dya", "ryo", "kas", "ngi", "nga", "asu", "kal", "lupa", "damo", "baho", "yon", "mari", "pak", "gan", "king", "atin", "ang", "ng", "sa", "nag", "kita", "han", "kan", "araw", "mala", "laba", "baka", "kay", "kina", "ni", "nina", "para", "tung", "kol", "hing", "gil", "ayon", "tungo", "bag", "ba", "bay")

/datum/language/polish
	name = LANGUAGE_POLISH
	desc = "A West Slavic language spoken by Polish people. Currently the fifth most commonly spoken in the UPP."
	speech_verb = "says"
	ask_verb = "inquires"
	exclaim_verb = "shouts"
	color = "polish"
	key = "p"

	syllables = list("się", "w", "je", "na", "to", "nie", "że", "i", "z", "do", "tak", "jak", "o", "mnie", "za", "ja", "mi", "ale", "czy", "ty", "ci", "cię", "już", "ma", "mam", "pan", "coś", "dla", "dobrze", "szę", "być", "wię", "mogę", "są", "więc", "kurwa", "pierdole", "był", "moj", "chcę", "ją", "pęk", "gor", "żeb", "że", "źółć", "kto", "bo", "mu", "on", "ona", "tej", "ktoś", "sam", "ta", "czas", "raz", "daj", "kim", "przy", "nikt", "dwa", "cóż", "iść", "ile", "cały", "nią", "idź", "trzy", "rację", "chaj", "spójrz", "nasz", "lub", "kogo", "którą", "źle", "pew", "oto", "całą", "zrób", "wczor", "boga", "bog")

/datum/language/hellhound
	name = LANGUAGE_HELLHOUND
	desc = "A growling, guttural method of communication, only Hellhounds seem to be capable of producing these sounds."
	speech_verb = "growls"
	ask_verb = "grumbles"
	exclaim_verb = "snarls"
	color = "monkey"
	key = "h"

/datum/language/hellhound/scramble(input)
	return pick("Grrr...", "Grah!", "Gurrr...")

/datum/language/commando
	name = LANGUAGE_TSL
	desc = "TSL is a modern technique with a combination of modified American sign language, tactical hand signals and discreet and esoteric code names for radios only known by elite commando groups."
	speech_verb = "discreetly communicates"
	ask_verb = "interrogates"
	exclaim_verb = "orders"
	color = "commando"
	key = "l"

	syllables = list("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "?", "@", "#" ,"*")
	sentence_chance = 50
	space_chance = 50

/datum/language/sainja //Yautja tongue
	name = LANGUAGE_YAUTJA
	desc = "The deep, rumbling, guttural sounds of the Yautja predators. It is difficult to speak for those without facial mandibles."
	speech_verb = "rumbles"
	ask_verb = "rumbles"
	exclaim_verb = "roars"
	color = "tajaran"
	key = "s"
	flags = WHITELISTED

	syllables = list("!", "?", ".", "@", "$", "%", "^", "&", "*", "-", "=", "+", "e", "b", "y", "p", "|", "z", "~", ">")
	space_chance = 20

/datum/language/primitive
	name = LANGUAGE_MONKEY
	desc = "Ook ook ook."
	speech_verb = "chimpers"
	ask_verb = "chimpers"
	exclaim_verb = "screeches"
	color = "monkey"
	key = "m"

/datum/language/xenomorph
	name = LANGUAGE_XENOMORPH
	color = "xenotalk"
	desc = "The common tongue of the xenomorphs."
	speech_verb = "hisses"
	ask_verb = "hisses"
	exclaim_verb = "hisses"
	key = "x"
	syllables = list("sss", "sSs", "SSS")
	flags = RESTRICTED

/datum/language/xenos
	name = LANGUAGE_HIVEMIND
	desc = "Xenomorphs have the strange ability to commune over a psychic hivemind."
	speech_verb = "hiveminds"
	ask_verb = "hiveminds"
	exclaim_verb = "hiveminds"
	color = "xeno"
	key = "q"
	flags = RESTRICTED|HIVEMIND

//Make queens BOLD text
/datum/language/xenos/broadcast(mob/living/speaker, message, speaker_mask)
	if(iscarbon(speaker))
		var/mob/living/carbon/C = speaker

		if(!(C.hivenumber in GLOB.hive_datum))
			return

		C.hivemind_broadcast(message, GLOB.hive_datum[C.hivenumber])

/datum/language/apollo
	name = LANGUAGE_APOLLO
	desc = "The APOLLO Link is an AI subprocessor designed by SEEGSON, allowing for coordination of maintenance drones and Working Joes. WY denies claims the processor was stolen for ARES."
	color = "skrell"
	speech_verb = "states"
	ask_verb = "queries"
	exclaim_verb = "declares"
	key = "a"
	flags = RESTRICTED|HIVEMIND

/datum/language/apollo/broadcast(mob/living/speaker, message, speaker_mask)
	if(!speaker.hear_apollo())
		return

	if (!message)
		return

	///Font size
	var/scale = "message"
	if(isARES(speaker))
		scale = "large"

	var/message_start = "<i><span class='game say'>[name], <span class='name'>[speaker.name]</span>"
	var/message_body = "<span class='message'>broadcasts, \"[message]\"</span></span></i>"
	var/full_message = "<span class='[scale]'><span class='[color]'>[message_start] [message_body]</span></span>"


	GLOB.STUI.game.Add("\[[time_stamp()]]<font color='#FFFF00'>APOLLO: [key_name(speaker)] : [message]</font><br>")
	GLOB.STUI.processing |= STUI_LOG_GAME_CHAT
	log_say("[speaker.name != "Unknown" ? speaker.name : "([speaker.real_name])"] \[APOLLO\]: [message] (CKEY: [speaker.key]) (JOB: [speaker.job]) (AREA: [get_area_name(speaker)])")
	log_ares_apollo(speaker.real_name, message)
	for (var/mob/dead in GLOB.dead_mob_list)
		if(!istype(dead,/mob/new_player) && !istype(dead,/mob/living/brain)) //No meta-evesdropping
			var/dead_message = "<span class='[scale]'><span class='[color]'>[message_start](<a href='byond://?src=\ref[dead];track=\ref[speaker]'>F</a>) [message_body]</span></span>"
			dead.show_message(dead_message, SHOW_MESSAGE_VISIBLE)

	for (var/mob/living/listener in GLOB.alive_mob_list)

		if (!listener.hear_apollo())
			continue

		listener.show_message(full_message, SHOW_MESSAGE_VISIBLE)

	var/list/listening = hearers(1, src)
	listening -= src

	for (var/mob/living/M in listening)
		if(isSilicon(M) || M.hear_apollo())
			continue
		M.show_message("<i><span class='game say'><span class='name'>synthesised voice</span> <span class='message'>beeps, \"beep beep beep\"</span></span></i>",2)

/datum/language/event_hivemind
	name = LANGUAGE_TELEPATH
	desc = "An event only language that provides a hivemind for its users."
	speech_verb = "resonates"
	ask_verb = "resonates"
	exclaim_verb = "resonates"
	color = "tajaran"
	key = "t"
	flags = RESTRICTED|HIVEMIND
