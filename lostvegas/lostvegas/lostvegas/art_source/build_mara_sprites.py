"""Build GameMaker-ready Mara frames from the generated source sheets."""

from pathlib import Path
from PIL import Image


ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIR = Path(__file__).resolve().parent
WALK_DIR = ROOT / "sprites" / "spr_playceholder_walk"
IDLE_DIR = ROOT / "sprites" / "spr_playceholder_idle"
LAYER_ID = "3a646771-9051-44be-914a-e06d8831d624"

WALK_IDS = [
    "0af1b307-f9ae-4333-ae14-fff2153d286a",
    "fc351657-582f-4db3-9081-0da98cb73b50",
    "cac83d57-3c93-451c-b675-3438105665b8",
    "b25f1c1d-72e7-4052-8fe6-6fc3d71d3a9a",
    "59e140ff-69cf-48dc-bf6d-4bef2da7a6ca",
    "f0b527c6-ca36-4925-808d-3356f8e48dd0",
    "958961d9-45ab-4afb-88a6-8498a2109c53",
    "e3928d92-bbf2-40b8-bd92-0e270f94606b",
    "84edd173-2b76-4bf8-9f8d-67674c747079",
    "84605219-dc00-456c-bfe2-264cc80e3742",
    "30314e03-3611-4928-9635-f84d7ba37324",
    "b65bb368-1f0a-4653-a582-e8cd8c8e120f",
    "1b7f2781-a4df-4b6f-af29-f9631bb6fc2f",
    "58892b82-09fa-4fc3-b6e4-9cb88b5d2da0",
    "2a3d961e-a0eb-4f16-afe2-84721b8b4815",
    "bbfd80a5-a0d4-47ad-a7e6-f591726652eb",
]

IDLE_IDS = [
    "0af1b307-f9ae-4333-ae14-fff2153d286a",
    "58b4173b-1698-4056-ac04-c8a07eb6c593",
    "b730db05-deea-43a3-b747-247b334125ec",
    "1b7f2781-a4df-4b6f-af29-f9631bb6fc2f",
]


def cell(sheet: Image.Image, column: int, row: int, columns: int, rows: int) -> Image.Image:
    left = round(column * sheet.width / columns)
    top = round(row * sheet.height / rows)
    right = round((column + 1) * sheet.width / columns)
    bottom = round((row + 1) * sheet.height / rows)
    return sheet.crop((left, top, right, bottom))


def game_frame(source: Image.Image) -> Image.Image:
    alpha_box = source.getchannel("A").getbbox()
    if alpha_box is None:
        raise ValueError("Generated frame has no visible character.")
    character = source.crop(alpha_box)
    scale = min(28 / character.width, 38 / character.height)
    size = (
        max(1, round(character.width * scale)),
        max(1, round(character.height * scale)),
    )
    character = character.resize(size, Image.Resampling.NEAREST)
    output = Image.new("RGBA", (32, 40), (0, 0, 0, 0))
    output.alpha_composite(character, ((32 - size[0]) // 2, 40 - size[1]))
    return output


def save_frame(frame: Image.Image, sprite_dir: Path, frame_id: str) -> None:
    frame.save(sprite_dir / f"{frame_id}.png")
    layer_dir = sprite_dir / "layers" / frame_id
    layer_dir.mkdir(parents=True, exist_ok=True)
    frame.save(layer_dir / f"{LAYER_ID}.png")


main_sheet = Image.open(SOURCE_DIR / "mara_walk_transparent.png").convert("RGBA")
up_sheet = Image.open(SOURCE_DIR / "mara_up_transparent.png").convert("RGBA")

# Direction order required by player_anim_script: right, up, left, down.
walk_sources = (
    [cell(main_sheet, index, 0, 4, 4) for index in range(4)]
    + [cell(up_sheet, index, 0, 4, 1) for index in range(4)]
    + [cell(main_sheet, index, 2, 4, 4) for index in range(4)]
    + [cell(main_sheet, index, 3, 4, 4) for index in range(4)]
)

for source, frame_id in zip(walk_sources, WALK_IDS):
    save_frame(game_frame(source), WALK_DIR, frame_id)

idle_sources = [walk_sources[index] for index in (0, 4, 8, 12)]
for source, frame_id in zip(idle_sources, IDLE_IDS):
    save_frame(game_frame(source), IDLE_DIR, frame_id)

print("Built 16 walk frames and 4 directional idle frames at 32x40 pixels.")
