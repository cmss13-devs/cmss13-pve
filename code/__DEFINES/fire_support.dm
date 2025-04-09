///Can this firesupport type be used
#define FIRESUPPORT_AVAILABLE (1<<0)

//Firemodes for Campaign gamemode
///GAU gun run
#define FIRESUPPORT_TYPE_GUN "gun"
///Laser beam run
#define FIRESUPPORT_TYPE_LASER "laser"
///Rocket barrage
#define FIRESUPPORT_TYPE_ROCKETS "rockets"
///Cruise missile strike
#define FIRESUPPORT_TYPE_MISSILE "missile"
///Sentry drop pod
#define FIRESUPPORT_TYPE_SENTRY_POD "sentry_pod"
///SOM Incendiary rocket barrage
#define FIRESUPPORT_TYPE_INCEND_ROCKETS "incend_rockets"
///HE Mortar barrage
#define FIRESUPPORT_TYPE_HE_MORTAR "he_mortar"
///Incendiary mortar barrage
#define FIRESUPPORT_TYPE_INCENDIARY_MORTAR "incendiary_mortar"
///Smoke mortar barrage
#define FIRESUPPORT_TYPE_SMOKE_MORTAR "smoke_mortar"
///Acid smoke mortar barrage
#define FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR "nerve_smoke_mortar"
///SOM HE Mortar barrage
#define FIRESUPPORT_TYPE_HE_MORTAR_SOM "he_mortar_som"
///SOM Incendiary mortar barrage
#define FIRESUPPORT_TYPE_INCENDIARY_MORTAR_SOM "incendiary_mortar_som"
///SOM Smoke mortar barrage
#define FIRESUPPORT_TYPE_SMOKE_MORTAR_SOM "smoke_mortar_som"
#define FIRESUPPORT_TYPE_OB "ob"

///Assoc list of firesupport types
GLOBAL_LIST_INIT(fire_support_types, list(
	FIRESUPPORT_TYPE_GUN = new /datum/fire_support/gau,
	FIRESUPPORT_TYPE_LASER = new /datum/fire_support/laser,
	FIRESUPPORT_TYPE_ROCKETS = new /datum/fire_support/rockets,
	FIRESUPPORT_TYPE_MISSILE = new /datum/fire_support/missile,
	FIRESUPPORT_TYPE_SENTRY_POD = new /datum/fire_support/droppod,
	FIRESUPPORT_TYPE_INCEND_ROCKETS = new /datum/fire_support/incendiary_rockets,
	FIRESUPPORT_TYPE_HE_MORTAR = new /datum/fire_support/mortar,
	FIRESUPPORT_TYPE_INCENDIARY_MORTAR = new /datum/fire_support/mortar/incendiary,
	FIRESUPPORT_TYPE_SMOKE_MORTAR = new /datum/fire_support/mortar/smoke,
	FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR = new /datum/fire_support/mortar/smoke/cn,
	FIRESUPPORT_TYPE_HE_MORTAR_SOM = new /datum/fire_support/mortar/som,
	FIRESUPPORT_TYPE_INCENDIARY_MORTAR_SOM = new /datum/fire_support/mortar/incendiary/som,
	FIRESUPPORT_TYPE_SMOKE_MORTAR_SOM = new /datum/fire_support/mortar/smoke/som,
	))
