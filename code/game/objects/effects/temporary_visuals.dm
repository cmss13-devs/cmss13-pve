/obj/effect/temp_visual//ported (pasted) from TG13
	icon_state = null
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	//time, in deciseconds of duration
	var/duration = 10
	///if true, will pick a random direction when created.
	var/randomdir = TRUE
	///id of the deletion timer
	var/timerid

/obj/effect/temp_visual/Initialize(mapload)
	. = ..()
	if(randomdir)
		setDir(pick(GLOB.cardinals))

	timerid = QDEL_IN(src, duration)

/obj/effect/temp_visual/Destroy()
	. = ..()
	deltimer(timerid)

//-----------------------------------------
//HEAVY IMPACT
//-----------------------------------------

/obj/effect/temp_visual/heavy_impact
	icon = 'icons/effects/heavyimpact.dmi'
	icon_state = "heavyimpact"
	duration = 1.3 SECONDS

/obj/effect/temp_visual/heavyimpact/Initialize(mapload)
	. = ..()
	flick("heavyimpact", src)

/obj/effect/temp_visual/dir_setting
	randomdir = FALSE

/obj/effect/temp_visual/dir_setting/Initialize(mapload, set_dir)
	if(set_dir)
		setDir(set_dir)
	. = ..()

//------------------------------------------
//BLOOD HITS
//------------------------------------------

GLOBAL_LIST_EMPTY(blood_particles)
/particles/splatter
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	width = 500
	height = 500
	count = 20
	spawning = 20
	lifespan = 0.5 SECONDS
	fade = 0.7 SECONDS
	grow = 0.1
	scale = 0.2
	spin = generator(GEN_NUM, -20, 20)
	velocity = list(50, 0)
	friction = generator(GEN_NUM, 0.1, 0.5)
	position = generator(GEN_CIRCLE, 6, 6)

/particles/splatter/New(set_color)
	..()
	if(set_color != "red") // we're already red colored by default
		color = set_color

/obj/effect/temp_visual/dir_setting/bloodsplatter
	icon = 'icons/effects/blood.dmi'
	duration = 5
	randomdir = FALSE
	layer = ABOVE_XENO_LAYER
	alpha = 175
	var/splatter_type = "splatter"

/obj/effect/temp_visual/dir_setting/bloodsplatter/Initialize(mapload, angle, fx_duration, color_override)
	if(color_override)
		color = color_override
	var/x_component = sin(angle) * -15
	var/y_component = cos(angle) * -15
	if(!GLOB.blood_particles[color])
		GLOB.blood_particles[color] = new /particles/splatter(color)
	particles = GLOB.blood_particles[color]
	particles.velocity = list(x_component, y_component)
	icon_state = "[splatter_type][pick(1, 2, 3, 4, 5, 6)]"
	. = ..()
	if(fx_duration)
		duration = fx_duration
	var/target_pixel_x = 0
	var/target_pixel_y = 0
	switch(round(angle))
		if(0, 360)
			target_pixel_x = 0
			target_pixel_y = 8
		if(1 to 44)
			target_pixel_x = round(4 * ((angle) / 45))
			target_pixel_y = 8
		if(45)
			target_pixel_x = 8
			target_pixel_y = 8
		if(46 to 89)
			target_pixel_x = 8
			target_pixel_y = round(4 * ((90 - angle) / 45))
		if(90)
			target_pixel_x = 8
			target_pixel_y = 0
		if(91 to 134)
			target_pixel_x = 8
			target_pixel_y = round(-3 * ((angle - 90) / 45))
		if(135)
			target_pixel_x = 8
			target_pixel_y = -6
		if(136 to 179)
			target_pixel_x = round(4 * ((180 - angle) / 45))
			target_pixel_y = -6
		if(180)
			target_pixel_x = 0
			target_pixel_y = -6
		if(181 to 224)
			target_pixel_x = round(-6 * ((angle - 180) / 45))
			target_pixel_y = -6
		if(225)
			target_pixel_x = -6
			target_pixel_y = -6
		if(226 to 269)
			target_pixel_x = -6
			target_pixel_y = round(-6 * ((270 - angle) / 45))
		if(270)
			target_pixel_x = -6
			target_pixel_y = 0
		if(271 to 314)
			target_pixel_x = -6
			target_pixel_y = round(8 * ((angle - 270) / 45))
		if(315)
			target_pixel_x = -6
			target_pixel_y = 8
		if(316 to 359)
			target_pixel_x = round(-6 * ((360 - angle) / 45))
			target_pixel_y = 8
	animate(src, pixel_x = target_pixel_x, pixel_y = target_pixel_y, alpha = 0, time = duration)


/obj/effect/temp_visual/dir_setting/bloodsplatter/xenosplatter
	splatter_type = "csplatter"
	color = BLOOD_COLOR_XENO

/obj/effect/temp_visual/dir_setting/bloodsplatter/human
	splatter_type = "csplatter"
	color = BLOOD_COLOR_HUMAN

/obj/effect/temp_visual/dir_setting/bloodsplatter/hellhound
	splatter_type = "csplatter"
	color = BLOOD_COLOR_YAUTJA

/obj/effect/temp_visual/dir_setting/bloodsplatter/yautjasplatter
	splatter_type = "csplatter"
	color = BLOOD_COLOR_YAUTJA_DARK

/obj/effect/temp_visual/dir_setting/bloodsplatter/synthsplatter
	splatter_type = "csplatter"
	color = BLOOD_COLOR_SYNTHETIC

//------------------------------------------
//Shockwaves
//------------------------------------------

/obj/effect/shockwave
	icon = 'icons/effects/light_overlays/shockwave.dmi'
	icon_state = "shockwave"
	plane = DISPLACEMENT_PLATE_RENDER_LAYER
	pixel_x = -496
	pixel_y = -496

/obj/effect/shockwave/Initialize(mapload, radius, speed, easing_type = LINEAR_EASING, y_offset, x_offset)
	. = ..()
	if(!speed)
		speed = 1
	if(y_offset)
		pixel_y += y_offset
	if(x_offset)
		pixel_x += x_offset
	QDEL_IN(src, 0.5 * radius * speed)
	transform = matrix().Scale(32 / 1024, 32 / 1024)
	animate(src, time = 0.5 * radius * speed, transform=matrix().Scale((32 / 1024) * radius * 1.5, (32 / 1024) * radius * 1.5), easing = easing_type)


//------------------------------------------
//Flare
//------------------------------------------
GLOBAL_DATUM_INIT(flare_particles, /particles/flare_smoke, new)
/particles/flare_smoke
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	width = 400
	height = 400
	count = 1000
	spawning = 3
	lifespan = 2 SECONDS
	fade = 7 SECONDS
	velocity = list(0, 2.5, 0)
	drift = generator(GEN_CIRCLE, 0, 0.25, NORMAL_RAND)
	spin = generator(GEN_NUM, -20, 20)
	rotation = generator(GEN_NUM, -20, 20)
	fadein = 5
	scale = 0.3
	grow = 0.05
	friction = 0.01
	gravity = list(0, 0.15)

/obj/effect/temp_visual/above_flare
	icon = 'icons/effects/64x64.dmi'
	icon_state = "flare"
	layer = FLY_LAYER
	light_system = STATIC_LIGHT
	light_power = 12
	light_color = COLOR_VERY_SOFT_YELLOW
	light_range = 12 //Way brighter than most lights
	pixel_x = -18
	pixel_y = 150
	duration = 5.0 MINUTES
	alpha = 225

/obj/effect/temp_visual/above_flare/Initialize(mapload)
	. = ..()
	duration = rand(5.0 MINUTES, 6.0 MINUTES)
	particles = GLOB.flare_particles
	animate(src, time = duration, pixel_y = 0)

/particles/blood_explosion
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	width = 500
	height = 500
	count = 45
	spawning = 45
	lifespan = 0.7 SECONDS
	fade = 1.4 SECONDS
	grow = 0.1
	scale = 0.4
	spin = generator(GEN_NUM, -20, 20)
	velocity = generator(GEN_CIRCLE, 12, 12)
	friction = generator(GEN_NUM, 0.15, 0.65)
	position = generator(GEN_CIRCLE, 6, 6)

/particles/gib_splatter
	icon = 'icons/effects/blood.dmi'
	icon_state = list("mgibbl3" = 1, "mgibbl5" = 1)
	width = 500
	height = 500
	count = 22
	spawning = 22
	lifespan = 1 SECONDS
	fade = 5 SECONDS
	grow = 0.05
	gravity = list(0, -3)
	scale = generator(GEN_NUM, 1, 1.25)
	rotation = generator(GEN_NUM, -10, 10)
	spin = generator(GEN_NUM, -10, 10)
	velocity = list(0, 14)
	friction = generator(GEN_NUM, 0.15, 0.1)
	position = generator(GEN_CIRCLE, 9, 9)
	drift = generator(GEN_CIRCLE, 2, 1)

/obj/effect/temp_visual/gib_particles
	///blood explosion particle holder
	var/obj/effect/abstract/particle_holder/blood
	///gib blood splatter particle holder
	var/obj/effect/abstract/particle_holder/gib_splatter
	duration = 1 SECONDS

/obj/effect/temp_visual/gib_particles/Initialize(mapload, gib_color)
	. = ..()
	blood = new(src, /particles/blood_explosion)
	blood.color = gib_color
	gib_splatter = new(src, /particles/gib_splatter)
	gib_splatter.color = gib_color
	addtimer(CALLBACK(src, PROC_REF(stop_spawning)), 5, TIMER_CLIENT_TIME)

/obj/effect/temp_visual/gib_particles/proc/stop_spawning()
	blood.particles.count = 0
	gib_splatter.particles.count = 0
