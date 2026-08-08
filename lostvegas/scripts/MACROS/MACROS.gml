/// @description  Global macro definitions
/// @author       Casino Project
///
/// Centralized constants used across the project. Keeping these in one
/// place makes tuning easy and avoids "magic numbers" scattered through
/// the codebase.
// =============================================================================

// -----------------------------------------------------------------------------
// Engine
// -----------------------------------------------------------------------------
#macro FRAME_RATE            60      // Target game speed (frames per second)
#macro FRAME_TIME            (1 / FRAME_RATE)

// -----------------------------------------------------------------------------
// Player
// -----------------------------------------------------------------------------
#macro PLAYER_WALK_SPEED     2.5     // Pixels per frame
#macro PLAYER_RUN_SPEED      4.0
#macro PLAYER_ACCEL          0.35
#macro PLAYER_FRICTION       0.25

// -----------------------------------------------------------------------------
// Animation
// -----------------------------------------------------------------------------
#macro ANIM_DIRECTIONS       4       // 4-directional sprite sheets (R, U, L, D)
#macro ANIM_DEFAULT_SPEED    12      // Fallback animation speed (fps)

// -----------------------------------------------------------------------------
// Depth layers (lower = drawn on top)
// -----------------------------------------------------------------------------
#macro DEPTH_BACKGROUND      1000
#macro DEPTH_FLOOR            900
#macro DEPTH_FURNITURE        500
#macro DEPTH_ENTITIES         100
#macro DEPTH_UI               -100

enum MINIGAME
{
	SLOTS,
	CARDS,
	ROULETTE,
	EAGLE,
	MAZE,
}
