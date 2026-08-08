/// @description Insert description here
// You can write your code in this editor


slots = 12;

angles = 360 / slots;

spinning = false;

slice_message = "";

target_angle = 0;

needle_point = 90;

wheel_mapping = array_create(12);
wheel_mapping[0] = 4; //3 o clock (0 degrees)
wheel_mapping[1] = 3; //2 clock
wheel_mapping[2] = 2;
wheel_mapping[3] = 1;
wheel_mapping[4] = 0;
wheel_mapping[5] = 11;
wheel_mapping[6] = 10;
wheel_mapping[7] = 9;
wheel_mapping[8] = 8
wheel_mapping[9] = 7
wheel_mapping[10] = 6
wheel_mapping[11] = 5

//row 1 0G
//row 2 1R, 2B, 3R,
//row 3 4B, 5R, 6B,
//row 4 7R, 8B, 9R,
//row 5 10B, 11R, 
row_1 = [0] //green
row_2 = [1,2,3]
row_3 = [4,5,6]
row_4 = [7,8,9]
row_5 = [10,11]
//something for red and black at bottom

//squares to bet on
sqx1 = 80
sqy1 = 32
sqsz = 32
sqx2 = sqx1 + sqsz
sqy2 = sqy1 + sqsz

number_bets = array_create(12, 0);
red_bet = 0;
black_bet = 0;

chip_value = 5;