///Can this firesupport type be used
#define FIRESUPPORT_AVAILABLE (1<<0)

///Assoc list of fire support points
GLOBAL_LIST_INIT(fire_support_points, list())

//Type of fire support, used for changing callsigns
#define FIRESUPPORT_CAS "cas"
#define FIRESUPPORT_ARTY "artillery"
#define FIRESUPPORT_ORBITAL "orbital"
#define FIRESUPPORT_CAS_UPP "cas_upp"
#define FIRESUPPORT_ARTY_UPP "artillery_upp"
#define FIRESUPPORT_ORBITAL_UPP "orbital_upp"

///GAU gun run
#define FIRESUPPORT_TYPE_GUN "gun"
///Laser beam run
#define FIRESUPPORT_TYPE_LASER "laser"
///Rocket barrage
#define FIRESUPPORT_TYPE_ROCKETS "rockets"
///Incendiary rocket barrage
#define FIRESUPPORT_TYPE_INCEND_ROCKETS "incend_rockets"
///Missile strike
#define FIRESUPPORT_TYPE_MISSILE "missile"
///Smoke missile strike
#define FIRESUPPORT_TYPE_SMOKE_MISSILE "smoke_missile"
///Nerve missile strike
#define FIRESUPPORT_TYPE_NERVE_MISSILE "nerve_missile"
///Napalm missile strike
#define FIRESUPPORT_TYPE_NAPALM_MISSILE "napalm_missile"
///LSD missile strike
#define FIRESUPPORT_TYPE_LSD_MISSILE "lsd_missile"
///UPP Gau gun run
#define FIRESUPPORT_TYPE_GUN_UPP "gun_upp"
///UPP Laser beam run
#define FIRESUPPORT_TYPE_LASER_UPP "laser_upp"
///UPP Rocket barrage
#define FIRESUPPORT_TYPE_ROCKETS_UPP "rockets_upp"
///UPP Incendiary rocket barrage
#define FIRESUPPORT_TYPE_INCEND_ROCKETS_UPP "incend_rockets_upp"
///UPP Missile strike
#define FIRESUPPORT_TYPE_MISSILE_UPP "missile_upp"
///UPP Smoke missile strike
#define FIRESUPPORT_TYPE_SMOKE_MISSILE_UPP "smoke_missile_upp"
///UPP Napalm missile strike
#define FIRESUPPORT_TYPE_NAPALM_MISSILE_UPP "napalm_missile_upp"
///UPP Nerve missile strike
#define FIRESUPPORT_TYPE_NERVE_MISSILE_UPP "nerve_missile_upp"
///UPP LSD missile strike
#define FIRESUPPORT_TYPE_LSD_MISSILE_UPP "lsd_missile_upp"
///HE Mortar barrage
#define FIRESUPPORT_TYPE_HE_MORTAR "he_mortar"
///Incendiary mortar barrage
#define FIRESUPPORT_TYPE_INCENDIARY_MORTAR "incendiary_mortar"
///Flare mortar barrage
#define FIRESUPPORT_TYPE_FLARE_MORTAR "flare_mortar"
///Smoke mortar barrage
#define FIRESUPPORT_TYPE_SMOKE_MORTAR "smoke_mortar"
///Nerve smoke mortar barrage
#define FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR "nerve_smoke_mortar"
///LSD Smoke mortar barrage
#define FIRESUPPORT_TYPE_LSD_SMOKE_MORTAR "lsd_smoke_mortar"
///HE MLRS barrage
#define FIRESUPPORT_TYPE_HE_MLRS "he_mlrs"
///Nerve MLRS barrage
#define FIRESUPPORT_TYPE_NERVE_MLRS "nerve_mlrs"
///UPP HE Mortar barrage
#define FIRESUPPORT_TYPE_HE_MORTAR_UPP "he_mortar_upp"
///UPP Incendiary mortar barrage
#define FIRESUPPORT_TYPE_INCENDIARY_MORTAR_UPP "incendiary_mortar_upp"
///UPP Flare mortar barrage
#define FIRESUPPORT_TYPE_FLARE_MORTAR_UPP "flare_mortar_upp"
///UPP Smoke mortar barrage
#define FIRESUPPORT_TYPE_SMOKE_MORTAR_UPP "smoke_mortar_upp"
///UPP LSD Smoke mortar barrage
#define FIRESUPPORT_TYPE_LSD_SMOKE_MORTAR_UPP "lsd_smoke_mortar_upp"
///UPP Nerve smoke mortar barrage
#define FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR_UPP "nerve_smoke_mortar_upp"
///UPP HE MLRS barrage
#define FIRESUPPORT_TYPE_HE_MLRS_UPP "he_mlrs_upp"
///UPP Nerve MLRS barrage
#define FIRESUPPORT_TYPE_NERVE_MLRS_UPP "nerve_mlrs_upp"
///Orbital bombardment
#define FIRESUPPORT_TYPE_OB "ob"
///UPP Orbital bombardment
#define FIRESUPPORT_TYPE_OB_UPP "ob_upp"
///Supply drop
#define FIRESUPPORT_TYPE_SUPPLY_DROP "supply_drop"
///Sentry drop pod
#define FIRESUPPORT_TYPE_SENTRY_POD "sentry_pod"
///UPP Sentry drop pod
#define FIRESUPPORT_TYPE_SENTRY_POD_UPP "sentry_pod_upp"
///UPP Supply drop
#define FIRESUPPORT_TYPE_SUPPLY_DROP_UPP "supply_drop_upp"

///Assoc list of firesupport types
GLOBAL_LIST_INIT(fire_support_types, list(
	FIRESUPPORT_TYPE_SUPPLY_DROP = new /datum/fire_support/supply_drop,
	FIRESUPPORT_TYPE_SENTRY_POD = new /datum/fire_support/sentry_drop,
	FIRESUPPORT_TYPE_SUPPLY_DROP_UPP = new /datum/fire_support/supply_drop/upp,
	FIRESUPPORT_TYPE_SENTRY_POD_UPP = new /datum/fire_support/sentry_drop/upp,
	FIRESUPPORT_TYPE_GUN = new /datum/fire_support/gau,
	FIRESUPPORT_TYPE_LASER = new /datum/fire_support/laser,
	FIRESUPPORT_TYPE_ROCKETS = new /datum/fire_support/rockets,
	FIRESUPPORT_TYPE_INCEND_ROCKETS = new /datum/fire_support/incendiary_rockets,
	FIRESUPPORT_TYPE_MISSILE = new /datum/fire_support/missile,
	FIRESUPPORT_TYPE_NAPALM_MISSILE = new /datum/fire_support/missile/napalm,
	FIRESUPPORT_TYPE_SMOKE_MISSILE = new /datum/fire_support/missile/smoke,
	FIRESUPPORT_TYPE_NERVE_MISSILE = new /datum/fire_support/missile/smoke/nerve,
	FIRESUPPORT_TYPE_LSD_MISSILE = new /datum/fire_support/missile/smoke/lsd,
	FIRESUPPORT_TYPE_GUN_UPP = new /datum/fire_support/gau/upp,
	FIRESUPPORT_TYPE_LASER_UPP = new /datum/fire_support/laser/upp,
	FIRESUPPORT_TYPE_ROCKETS_UPP = new /datum/fire_support/rockets/upp,
	FIRESUPPORT_TYPE_INCEND_ROCKETS_UPP = new /datum/fire_support/incendiary_rockets/upp,
	FIRESUPPORT_TYPE_MISSILE_UPP = new /datum/fire_support/missile/upp,
	FIRESUPPORT_TYPE_NAPALM_MISSILE_UPP = new /datum/fire_support/missile/napalm/upp,
	FIRESUPPORT_TYPE_SMOKE_MISSILE_UPP = new /datum/fire_support/missile/smoke/upp,
	FIRESUPPORT_TYPE_NERVE_MISSILE_UPP = new /datum/fire_support/missile/smoke/nerve/upp,
	FIRESUPPORT_TYPE_LSD_MISSILE_UPP = new /datum/fire_support/missile/smoke/lsd/upp,
	FIRESUPPORT_TYPE_HE_MORTAR = new /datum/fire_support/mortar,
	FIRESUPPORT_TYPE_INCENDIARY_MORTAR = new /datum/fire_support/mortar/incendiary,
	FIRESUPPORT_TYPE_FLARE_MORTAR = new /datum/fire_support/mortar/flare,
	FIRESUPPORT_TYPE_SMOKE_MORTAR = new /datum/fire_support/mortar/smoke,
	FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR = new /datum/fire_support/mortar/smoke/cn,
	FIRESUPPORT_TYPE_LSD_SMOKE_MORTAR = new /datum/fire_support/mortar/smoke/lsd,
	FIRESUPPORT_TYPE_HE_MLRS = new /datum/fire_support/mortar/mlrs,
	FIRESUPPORT_TYPE_NERVE_MLRS = new /datum/fire_support/mortar/smoke/mlrs_cn,
	FIRESUPPORT_TYPE_HE_MORTAR_UPP = new /datum/fire_support/mortar/upp,
	FIRESUPPORT_TYPE_INCENDIARY_MORTAR_UPP = new /datum/fire_support/mortar/incendiary/upp,
	FIRESUPPORT_TYPE_FLARE_MORTAR_UPP = new /datum/fire_support/mortar/flare/upp,
	FIRESUPPORT_TYPE_SMOKE_MORTAR_UPP = new /datum/fire_support/mortar/smoke/upp,
	FIRESUPPORT_TYPE_LSD_SMOKE_MORTAR_UPP = new /datum/fire_support/mortar/smoke/lsd/upp,
	FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR_UPP = new /datum/fire_support/mortar/smoke/cn/upp,
	FIRESUPPORT_TYPE_HE_MLRS_UPP = new /datum/fire_support/mortar/mlrs/upp,
	FIRESUPPORT_TYPE_NERVE_MLRS_UPP = new /datum/fire_support/mortar/smoke/mlrs_cn/upp,
	FIRESUPPORT_TYPE_OB = new /datum/fire_support/ob,
	FIRESUPPORT_TYPE_OB_UPP = new /datum/fire_support/ob/upp,
	))
