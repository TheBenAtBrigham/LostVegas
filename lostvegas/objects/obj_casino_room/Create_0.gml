/// First casino room setup and collision rectangles
global.casino_solids = [];

function casino_add_solid(_x1, _y1, _x2, _y2) {
    array_push(global.casino_solids, [_x1, _y1, _x2, _y2]);
}

// Outer walls. The entrance gap is between x=292 and x=348.
casino_add_solid(0, 0, 640, 24);
casino_add_solid(0, 24, 20, 360);
casino_add_solid(620, 24, 640, 360);
casino_add_solid(20, 340, 292, 360);
casino_add_solid(348, 340, 620, 360);
casino_add_solid(292, 356, 348, 360);

// Cashier/reception counter.
casino_add_solid(42, 58, 158, 82);

// Bar counter and back cabinet.
casino_add_solid(452, 46, 594, 68);
casino_add_solid(468, 82, 586, 100);

// Slot machine banks (three machines per bank).
for (var _row = 0; _row < 2; _row++) {
    for (var _col = 0; _col < 3; _col++) {
        casino_add_solid(62 + _col * 44, 132 + _row * 62, 94 + _col * 44, 170 + _row * 62);
        casino_add_solid(446 + _col * 44, 132 + _row * 62, 478 + _col * 44, 170 + _row * 62);
    }
}

// Central roulette and card tables.
casino_add_solid(264, 116, 376, 174);
casino_add_solid(238, 216, 302, 264);
casino_add_solid(338, 216, 402, 264);

// Decorative planters in the lower corners.
casino_add_solid(44, 292, 72, 324);
casino_add_solid(568, 292, 596, 324);

global.casino_exit_x1 = 292;
global.casino_exit_x2 = 348;
global.casino_exit_y = 32;
