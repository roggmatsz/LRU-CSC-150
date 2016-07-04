----------------------------------------------
--|NAME: ROGGER MATAMOROS / Kelsey Willatt
--|DATE: 02/24/11
--|ASSIGNMENT: LAB 9
---------------------------------------------

with ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab9 is
	sum, num1, num0: integer;

begin
	--part A
	sum := 0;
	Put("Enter a number");
	get(num0);
	for i in 0..5 loop
		num1 := num0 + i;
		put(num1, width => 3);
		sum := sum + num1;
	end loop;
	new_line;
	put("the sum is:");
	put(sum, width => 3);

end Lab9;
