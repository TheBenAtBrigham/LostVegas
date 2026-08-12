# Lost Vegas

Lost Vegas is a top-down GameMaker escape game set inside the Golden Ace casino. Explore the building, play casino mini-games, collect clues, solve inventory puzzles, and find a route out that does not depend on gambling.

## Requirements

- Windows 10 or Windows 11
- GameMaker IDE 2023.11 or a newer compatible release
- The GameMaker Windows runtime installed through GameMaker's Package Manager
- A keyboard and mouse

No external libraries, command-line packages, databases, or environment variables are required.

## Opening the correct project

The active GameMaker project is:

```text
lostvegas/lostvegas.yyp
```

Do not open the older `LostVegas.yyp` directory at the repository root. It is an incomplete earlier copy and does not contain the current story, inventory, title, or save systems.

To open the game:

1. Install and start GameMaker.
2. Select **Open** from the GameMaker start screen.
3. Browse to this repository.
4. Open `lostvegas/lostvegas.yyp`.
5. Allow GameMaker to convert project metadata if a newer IDE requests it.
6. Confirm that `rm_title` is first in **Room Order**. It is already configured as the startup room in the repository.

## Running from GameMaker

1. Select the **Windows** target in the upper-right target selector.
2. Wait for GameMaker to finish importing resources and compiling shaders and textures.
3. Press **F6** or click **Run**.
4. The game should open at the **Lost Vegas** title screen.
5. Choose **New Game** for a fresh playthrough or **Continue** when save data exists.

If the Windows runtime is missing, open **GameMaker > Tools > Package Manager**, install a Windows runtime compatible with the IDE, and run the project again.

## Creating a Windows build

1. Open `lostvegas/lostvegas.yyp` in GameMaker.
2. Select the **Windows** target.
3. Choose **Build > Create Executable** or press **Ctrl+F8**.
4. Select an empty output directory outside the source project.
5. GameMaker will generate the executable and its required data files.
6. Keep all generated files together when copying the build to another computer.

## Controls

### Title screen

| Input | Action |
| --- | --- |
| Up / Down | Select Continue or New Game |
| Enter / Space | Confirm selection |

### Casino exploration

| Input | Action |
| --- | --- |
| Arrow keys | Move Mara |
| Space | Advance dialogue, inspect, or enter a nearby mini-game |
| E | Advance dialogue or use the selected inventory item on a nearby puzzle |
| I | Open or close inventory |
| Esc / P | Open or close the pause menu |

### Inventory

| Input | Action |
| --- | --- |
| Left / Right or Up / Down | Change selected item |
| E | Use the selected item on the nearby target |
| I | Close inventory |

### Pause menu

| Input | Action |
| --- | --- |
| Up / Down | Select an option |
| Enter / Space | Confirm |
| Esc / P | Resume gameplay |

The pause menu provides **Resume**, **Save Game**, **Load Game**, and **Return to Title**. Saving requires a room containing the player and is unavailable during a mini-game.

### Slot machine

| Input | Action |
| --- | --- |
| Shift | Place a one-chip bet |
| Space | Spin after placing a bet |
| Enter | Return to the casino |

### Blackjack

| Input | Action |
| --- | --- |
| Shift | Place a one-chip bet |
| Space | Deal or continue to the next round |
| Z | Hit |
| X | Stand |
| Enter | Return to the casino |

### Roulette

| Input | Action |
| --- | --- |
| Mouse | Select a betting square |
| Space | Spin |
| Enter | Return to the casino |

## Save and load behavior

The game stores one versioned save file named:

```text
lostvegas_save.ini
```

GameMaker places this file in its platform-managed writable save area, not inside the repository. The save includes:

- Mara's last supported room, coordinates, and facing direction
- Money and mini-game progression
- Story stage and essential story flags
- Puzzle and escape state
- Collected inventory item IDs and the selected inventory slot

Use **Save Game** from the pause menu to write the file. Use **Load Game** from the pause menu or **Continue** on `rm_title` to restore it. If no valid compatible file exists, Continue is disabled and New Game is selected automatically.

To reset progress, start **New Game**. To remove the save completely, delete `lostvegas_save.ini` from GameMaker's local save area for the game.

## Basic playthrough

1. Start a New Game and finish the opening dialogue.
2. Inspect the locked north exit.
3. Play a slot game and return to the casino.
4. Take the resulting payout stub to the cashier.
5. Select the appropriate inventory clue and use it at each highlighted puzzle location.
6. Look beyond the gaming floor for service routes and staff access items.

## Project structure

```text
lostvegas/
  lostvegas.yyp              Main GameMaker project
  rooms/                     Title, casino, escape, and mini-game rooms
  objects/                   Player, managers, puzzles, UI, and mini-games
  scripts/                   Animation, card-game, macro, and save helpers
  sprites/                   Character, environment, cards, and UI artwork
  sounds/                    Game audio resources
  options/                   GameMaker platform configuration
  art_source/                Source and rebuild files for Mara's generated sprites
```

Important systems are located in:

- `objects/obj_game_manager`: story, dialogue, inventory, puzzles, pause menu, and UI
- `scripts/save_system`: versioned save/load functions
- `objects/obj_title`: title screen and Continue/New Game flow
- `objects/obj_player`: movement, collision, and animation integration
- `objects/obj_minigame_manager`: shared mini-game progress and casino return flow

## Troubleshooting

### The project opens but appears to be missing newer features

Close it and open `lostvegas/lostvegas.yyp`. You likely opened the obsolete root-level project copy.

### The game starts somewhere other than the title screen

Open **Asset Browser > Room Order** and move `rm_title` to the first position.

### Continue does not work

Continue requires a valid `lostvegas_save.ini` written by the current save format. Start New Game, open the pause menu in a player-controlled room, choose Save Game, return to the title, and try Continue again.

### Saving says it is unavailable

Finish or leave the current mini-game with Enter, then save from a room where Mara is present.

### A runtime or compiler is missing

Use GameMaker's Package Manager to install a Windows runtime compatible with the installed IDE. No repository dependency installation is needed.

### GameMaker reports stale or unexpected errors after updating files

Close the running game, use **Build > Clean**, then run the project again. If necessary, close and reopen GameMaker so it reloads changed `.gml` and `.yy` files.

## Credits

Programming: Henry Ugochukwu, Asa Benson, Freedom Mukanza, and Emeribe Stanley Chibuike Ameiz.

Original game idea: Asa Benson. Roger the Scorp-Bear was created by Asa Benson.
