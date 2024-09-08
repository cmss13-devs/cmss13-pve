#define HUMAN_AI_HEALTHITEMS "health"
#define HUMAN_AI_AMMUNITION "ammo"

/// Action is completed, delete this and move onto the next ongoing action
#define ONGOING_ACTION_COMPLETED "completed"
/// Action isn't finished, move onto the next ongoing action
#define ONGOING_ACTION_UNFINISHED "unfinished"
/// Action isn't finished, block any further actions from the AI this tick
#define ONGOING_ACTION_UNFINISHED_BLOCK "unfinished_block"

#define ADD_ONGOING_ACTION(brain, path, arguments...) brain:_add_ongoing_action(path, ##arguments)

#define HUMAN_AI_MAX_PATHFINDING_RANGE 45
