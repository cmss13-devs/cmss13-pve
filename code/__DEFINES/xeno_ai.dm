#define XENO_CALCULATING_PATH(X) (X in SSxeno_pathfinding.hash_path)

#define DIRECTION_CHANGE_PENALTY 2
#define NO_WEED_PENALTY 2
#define DISTANCE_PENALTY 1
#define ASTAR_COST_FUNCTION(n) (abs(n.x - target.x)+abs(n.y - target.y))

#define DOOR_PENALTY 3
#define OBJECT_PENALTY 20
#define HUMAN_PENALTY 4
#define VEHICLE_PENALTY 25
#define SENTRY_PENALTY 25
#define WINDOW_FRAME_PENALTY 25
#define BARRICADE_PENALTY 50
#define WALL_PENALTY 50

// Xeno AI flags
#define XENO_AI_NO_DESPAWN (1<<0)
#define XENO_AI_CHOOSE_RANDOM_STRAIN (1<<1)

/*
  PROBABILITY CALCULATIONS ARE HERE
*/

#define XENO_SLASH 80

#define RETREAT_AT_PLASMA_LEVEL 0.2
#define RETREAT_AT_HEALTH_LEVEL 0.4

// Warrior

/// How likely should it be that you lunge when off cooldown?
#define WARRIOR_LUNGE 40
/// How far should the warrior be before they attempt to lunge?
#define WARRIOR_LUNGE_RANGE 7
/// How likely should it be that you punch when off cooldown?
#define WARRIOR_PUNCH 15
/// How likely should it be that you fling when off cooldown?
#define WARRIOR_FLING 25

// Spitter

#define SPITTER_SPIT 90
#define SPITTER_FRENZY 20
#define SPITTER_SPRAY 80
#define SPITTER_SPRAY_SPIT_PERIOD 3 SECONDS

// Sentinel

#define SENTINEL_SPIT 90

// Runner

#define RUNNER_POUNCE 75
#define RUNNER_POUNCE_RANGE 7
#define RUNNER_GRAB 100

// Lurker

#define LURKER_POUNCE 75
#define LURKER_POUNCE_RANGE 7
#define LURKER_INVISIBLE 100
#define LURKER_POWER_SLASH 100

// Defender

#define DEFENDER_TAILWHIP 40
#define DEFENDER_HEADBUTT 75

// Crusher

/// How often is the crusher going to stomp whilst they're standing over you
#define CRUSHER_STOMP 100
/// How often will a crusher stomp after a charge
#define CRUSHER_STOMP_CHARGE 40
#define CRUSHER_POUNCE_RANGE 7
#define CRUSHER_POUNCE 75
#define CRUSHER_SHIELD 100
/// At what health percentage to proc crusher's shield.
#define CRUSHER_SHIELD_HEALTH_PROC 0.25

// Praetorian

#define PRAETORIAN_DASH 100
#define PRAETORIAN_SPIT 80
#define PRAETORIAN_SPRAY 80

/*
	GAME DIRECTOR AI
*/

/datum/config_entry/number/ai_director
	abstract_type = /datum/config_entry/number/ai_director

#define IDEAL_T2_PERCENT 0.5
#define IDEAL_T3_PERCENT 0.25

/// The maximum amount of xenomorphs that can spawn, scaled up by population.
/datum/config_entry/number/ai_director/max_xeno_per_player
	config_entry_value = 1

// Xenos spawn
/datum/config_entry/number/ai_director/t2_spawn_at_percentage
	config_entry_value = 0.25

/datum/config_entry/number/ai_director/t3_spawn_at_percentage
	config_entry_value = 0.5

/// The minimum range at which a xeno can be spawned from a human
#define MIN_RANGE_TO_SPAWN_XENO 10
/// The maximum range at which a xeno can be spawned from a human
#define MAX_RANGE_TO_SPAWN_XENO 25

/// When a xeno gets despawned if there is no human within a specific range.
#define RANGE_TO_DESPAWN_XENO 25
/// When a xeno gets despawned if they can't find a target within a specific amount of time.
#define XENO_DESPAWN_NO_TARGET_PERIOD 200 SECONDS

// Director flags
#define XENO_SPAWN_T1 (1<<0)
#define XENO_SPAWN_T2 (1<<1)
#define XENO_SPAWN_T3 (1<<2)

