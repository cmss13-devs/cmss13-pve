/datum/emote/living/carbon/human/scream
	species_type_allowed_typecache = list(/datum/species/human, /datum/species/synthetic, /datum/species/yautja, /datum/species/sectoid)

/datum/emote/living/carbon/human/scream/get_sound(mob/living/user)
	if(istype(user?:species, /datum/species/sectoid))
		return pick('void-marines/sound/xcom_aliens/sectoid/AlienDeathScream2.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/sectoid/AlienDeathScream3.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/sectoid/AlienDeathScream4.SoundNodeWave_0000009c.ogg', )
	if(istype(user?:species, /datum/species/human/thin_man))
		return pick('void-marines/sound/xcom_aliens/thinmen/ThinManDeath03.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/thinmen/ThinManDeath04.SoundNodeWave_0000009c.ogg')
	. = ..()

/datum/emote/living/carbon/human/pain
	species_type_allowed_typecache = list(/datum/species/human, /datum/species/synthetic, /datum/species/yautja, /datum/species/sectoid)

/datum/emote/living/carbon/human/pain/get_sound(mob/living/user)
	if(istype(user?:species, /datum/species/sectoid))
		return pick('void-marines/sound/xcom_aliens/sectoid/AlienDeathScream2.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/sectoid/AlienDeathScream3.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/sectoid/AlienDeathScream4.SoundNodeWave_0000009c.ogg', )
	if(istype(user?:species, /datum/species/human/thin_man))
		return pick('void-marines/sound/xcom_aliens/thinmen/ThinManDeath03.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/thinmen/ThinManDeath04.SoundNodeWave_0000009c.ogg')
	. = ..()
