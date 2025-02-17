/particles/explosion_smoke
	icon = 'icons/effects/64x64.dmi'
	icon_state = "smoke"
	width = 1000
	height = 1000
	count = 40
	spawning = 40
	gradient = list("#FF8328", "#C3630C", "#333333", "#808080", "#FFFFFF")
	lifespan = 20
	fade = generator(GEN_NUM, 25, 15)
	color = generator(GEN_NUM, 0, 0.25)
	color_change = generator(GEN_NUM, 0.04, 0.05)
	velocity = generator(GEN_CIRCLE, 25, 25)
	drift = generator(GEN_CIRCLE, 0, 1, NORMAL_RAND)
	spin = generator(GEN_NUM, -20, 20)
	friction = generator(GEN_NUM, 0.35, 0.75)
	gravity = list(1, 3)
	scale = 0.5
	grow = 0.05

/particles/explosion_smoke/deva
	scale = 0.75
	velocity = generator(GEN_CIRCLE, 35, 35)
	count = 50
	spawning = 50
	grow = 0.075

/particles/explosion_smoke/small
	count = 20
	spawning = 20
	scale = 0.8

/particles/explosion_smoke/tiny
	count = 30
	spawning = 30
	scale = 0.3
	grow = 0.025
	velocity = generator(GEN_CIRCLE, 15, 15)
	gradient = list("#333333", "#808080", "#FFFFFF")
	fade = 25
	lifespan = 15

/particles/explosion_water
	icon = 'icons/effects/96x96.dmi'
	icon_state = list("smoke4" = 1, "smoke5" = 1)
	width = 1000
	height = 1000
	count = 40
	spawning = 40
	lifespan = 20
	fade = generator(GEN_NUM, 40, 30)
	velocity = generator(GEN_CIRCLE, 15, 15)
	drift = generator(GEN_CIRCLE, 0, 1, NORMAL_RAND)
	spin = generator(GEN_NUM, -20, 20)
	friction = generator(GEN_NUM, 0.1, 0.5)
	gravity = list(1, 3)
	scale = 0.125
	grow = 0.05

/particles/explosion_water/tiny
	count = 30
	spawning = 30
	scale = 0.2
	grow = 0.015
	velocity = generator(GEN_CIRCLE, 8, 8)
	fade = 25
	lifespan = 15

/particles/smoke_wave
	icon = 'icons/effects/96x96.dmi'
	icon_state = "smoke3"
	width = 750
	height = 750
	count = 75
	spawning = 75
	lifespan = 15
	fade = 45
	gradient = list("#BA9F6D", "#808080", "#FFFFFF")
	color_change = generator(GEN_NUM, 0.04, 0.05)
	velocity = generator(GEN_CIRCLE, 40, 40)
	rotation = generator(GEN_NUM, -45, 45)
	scale = generator(GEN_NUM, 0.2, 0.35)
	grow = 0.03
	drift = generator(GEN_CIRCLE, 0, 1, NORMAL_RAND)
	friction = 0.25

/particles/smoke_wave/small
	count = 45
	spawning = 45
	scale = generator(GEN_NUM, 0.1, 0.05)

/particles/wave_water
	icon = 'icons/effects/96x96.dmi'
	icon_state = "smoke5"
	width = 750
	height = 750
	count = 75
	spawning = 75
	lifespan = 15
	fade = 45
	velocity = generator(GEN_CIRCLE, 25, 25)
	rotation = generator(GEN_NUM, -45, 45)
	scale = generator(GEN_NUM, 0.2, 0.35)
	grow = 0.03
	drift = generator(GEN_CIRCLE, 0, 1, NORMAL_RAND)
	friction = 0.25

/particles/dirt_kickup
	icon = 'icons/effects/96x157.dmi'
	icon_state = "smoke"
	width = 500
	height = 500
	count = 80
	spawning = 10
	lifespan = 15
	fade = 8
	fadein = 3
	scale = generator(GEN_NUM, 0.18, 0.15)
	position = generator(GEN_SPHERE, 150, 150)
	color = COLOR_BROWN
	velocity = list(0, 12)
	grow = list(0, 0.01)
	gravity = list(0, -1.25)
	friction = 0.15

/particles/dirt_kickup/tiny
	count = 16
	spawning = 2
	position = generator(GEN_SPHERE, 64, 64)

/particles/water_splash
	icon = 'icons/effects/96x157.dmi'
	icon_state = "smoke2"
	width = 500
	height = 500
	count = 80
	spawning = 10
	lifespan = 15
	fade = 15
	fadein = 3
	scale = generator(GEN_NUM, 0.18, 0.15)
	position = generator(GEN_SPHERE, 150, 150)
	velocity = list(0, 12)
	grow = list(0, 0.01)
	gravity = list(0, -1.25)
	friction = 0.15

/particles/water_splash/tiny
	count = 16
	spawning = 2
	position = generator(GEN_SPHERE, 64, 64)

/particles/dirt_kickup_large
	icon = 'icons/effects/96x314.dmi'
	icon_state = "smoke"
	width = 750
	height = 750
	gradient = list("#FF8328", "#C3630C", "#333333", "#808080", "#FFFFFF")
	count = 20
	spawning = 5
	lifespan = 20
	fade = generator(GEN_NUM, 18, 15)
	scale = generator(GEN_NUM, 0.5, 1.2)
	color = generator(GEN_NUM, 0.25, 0.75)
	color_change = 0.1
	rotation = generator(GEN_NUM, 85, -85)
	position = generator(GEN_BOX, list(-4, -65), list(4, -70), NORMAL_RAND)
	velocity = list(0, 23)
	grow = list(0, 0.025)
	gravity = list(0, -1.75)
	friction = 0.15

/particles/dirt_kickup_large/deva
	scale = generator(GEN_NUM, 1.7, 1)
	grow = list(0, 0.03)
	velocity = list(0, 30)

/particles/dirt_kickup_large/small
	scale = generator(GEN_NUM, 0.3, 0.8)

/particles/water_splash_large
	icon = 'icons/effects/96x314.dmi'
	icon_state = "smoke2"
	width = 750
	height = 750
	count = 20
	spawning = 5
	lifespan = 20
	fade = generator(GEN_NUM, 30, 20)
	scale = generator(GEN_NUM, 0.5, 1.2)
	rotation = generator(GEN_NUM, 85, -85)
	position = generator(GEN_BOX, list(-4, -65), list(4, -70), NORMAL_RAND)
	velocity = list(0, 23)
	grow = list(0, 0.025)
	gravity = list(0, -1.75)
	friction = 0.15

/particles/falling_debris
	icon = 'icons/effects/particles/generic_particles.dmi'
	icon_state = "rock"
	width = 750
	height = 750
	count = 75
	spawning = 75
	lifespan = 20
	fade = 5
	position = generator(GEN_SPHERE, 16, 16)
	color = COLOR_DARK_BROWN
	velocity = list(0, 26)
	scale = 1
	gravity = list(0, -3)
	friction = 0.02
	drift = generator(GEN_CIRCLE, 0, 1.5)

/particles/falling_debris/small
	count = 40
	spawning = 40
	velocity = list(0, 22)
	fade = 10

/particles/falling_debris/tiny
	count = 20
	spawning = 20
	velocity = list(0, 19)
	fade = 15
	scale = 0.5

/particles/water_falling
	icon = 'icons/effects/particles/generic_particles.dmi'
	icon_state = "pixel"
	width = 750
	height = 750
	count = 75
	spawning = 75
	lifespan = 20
	fade = 5
	position = generator(GEN_SPHERE, 16, 16)
	velocity = list(0, 26)
	scale = 1
	gravity = list(0, -3)
	friction = 0.02
	drift = generator(GEN_CIRCLE, 0, 1.5)

/particles/water_falling/tiny
	count = 20
	spawning = 20
	velocity = list(0, 19)
	fade = 15
	scale = 0.5

/particles/water_outwards
	icon = 'icons/effects/particles/generic_particles.dmi'
	icon_state = "cross"
	width = 750
	height = 750
	count = 40
	spawning = 20
	lifespan = 15
	fade = 15
	position = generator(GEN_SPHERE, 8, 8)
	velocity = generator(GEN_CIRCLE, 30, 30)
	scale = 1.25
	friction = 0.1

/obj/effect/temp_visual/explosion
	name = "boom"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "explosion"
	light_system = STATIC_LIGHT
	duration = 25
	///smoke wave particle holder
	var/obj/effect/abstract/particle_holder/smoke_wave
	///explosion smoke particle holder
	var/obj/effect/abstract/particle_holder/explosion_smoke
	///debris dirt kickup particle holder
	var/obj/effect/abstract/particle_holder/dirt_kickup
	///falling debris particle holder
	var/obj/effect/abstract/particle_holder/falling_debris
	///large dirt kickup particle holder
	var/obj/effect/abstract/particle_holder/large_kickup

/obj/effect/temp_visual/explosion/Initialize(mapload, radius, color, power, tiny)
	. = ..()
	set_light(radius, radius, color)
	generate_particles(radius, power, tiny)
	var/turf/turf_type = get_turf(src)
	if(!turf_type.can_bloody || tiny)
		icon_state = null
		return
	var/image/I
	I = image(icon, src, icon_state, 10, -32, -32)
	var/matrix/rotate = matrix()
	rotate.Turn(rand(0, 359))
	I.transform = rotate
	overlays += I //we use an overlay so the explosion and light source are both in the correct location plus so the particles don't rotate with the explosion
	icon_state = null

/obj/effect/temp_visual/explosion/proc/generate_particles(radius, power, tiny)
	var/turf/turf_type = get_turf(src)
	if(!turf_type.can_bloody)
		if(tiny)
			explosion_smoke = new(src, /particles/explosion_water/tiny)
			falling_debris = new(src, /particles/water_falling/tiny)
			dirt_kickup = new(src, /particles/water_splash/tiny)
		else
			smoke_wave = new(src, /particles/wave_water)
			explosion_smoke = new(src, /particles/explosion_water)
			dirt_kickup = new(src, /particles/water_splash)
			falling_debris = new(src, /particles/water_falling)
			large_kickup = new(src, /particles/water_splash_large)
	else
		if(!tiny)
			if(power <= EXPLOSION_THRESHOLD_LOW)
				smoke_wave = new(src, /particles/smoke_wave/small)
			else
				smoke_wave = new(src, /particles/smoke_wave)

		if(tiny)
			explosion_smoke = new(src, /particles/explosion_smoke/tiny)
		else
			if(power > EXPLOSION_THRESHOLD_HIGH)
				explosion_smoke = new(src, /particles/explosion_smoke/deva)
			else if(power <= EXPLOSION_THRESHOLD_LOW)
				explosion_smoke = new(src, /particles/explosion_smoke/small)
			else
				explosion_smoke = new(src, /particles/explosion_smoke)

		if(tiny)
			dirt_kickup = new(src, /particles/dirt_kickup/tiny)
		else
			dirt_kickup = new(src, /particles/dirt_kickup)

		if(tiny)
			falling_debris = new(src, /particles/falling_debris/tiny)
		else
			if(power <= EXPLOSION_THRESHOLD_LOW)
				falling_debris = new(src, /particles/falling_debris/small)
			else
				falling_debris = new(src, /particles/falling_debris)

		if(!tiny)
			if(power > EXPLOSION_THRESHOLD_HIGH)
				large_kickup = new(src, /particles/dirt_kickup_large/deva)
			else if(power <= EXPLOSION_THRESHOLD_LOW)
				large_kickup = new(src, /particles/dirt_kickup_large/small)
			else
				large_kickup = new(src, /particles/dirt_kickup_large)

	if(!tiny)
		if(power > EXPLOSION_THRESHOLD_HIGH)
			smoke_wave.particles.velocity = generator(GEN_CIRCLE, 35, 35)
		else if(power <= EXPLOSION_THRESHOLD_LOW)
			smoke_wave.particles.velocity = generator(GEN_CIRCLE, 30, 30)
		else
			smoke_wave.particles.velocity = generator(GEN_CIRCLE, 25, 25)
	explosion_smoke.layer = layer + 0.1
	addtimer(CALLBACK(src, PROC_REF(set_count_short), tiny), 5)
	addtimer(CALLBACK(src, PROC_REF(set_count_long)), 10)

/obj/effect/temp_visual/explosion/proc/set_count_short(tiny = FALSE)
	if(tiny)
		explosion_smoke.particles.count = 0
		falling_debris.particles.count = 0
	else
		smoke_wave.particles.count = 0
		explosion_smoke.particles.count = 0
		large_kickup.particles.count = 0
		falling_debris.particles.count = 0

/obj/effect/temp_visual/explosion/proc/set_count_long()
	dirt_kickup.particles.count = 0

/obj/effect/temp_visual/explosion/Destroy()
	QDEL_NULL(smoke_wave)
	QDEL_NULL(explosion_smoke)
	QDEL_NULL(large_kickup)
	QDEL_NULL(falling_debris)
	QDEL_NULL(dirt_kickup)
	return ..()
