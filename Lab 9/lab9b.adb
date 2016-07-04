----------------------------------------------
--|NAME: ROGGER MATAMOROS / Kelsey Willatt
--|DATE: 02/24/11
--|ASSIGNMENT: LAB 9 part 1b
---------------------------------------------

with ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab9b is
	sum, num1, num0: integer;

begin	--part b
	sum := 0;
	put("Enter 5 test scores");
	new_Line;
	for i in 1..5 loop	
		get(num0);
		new_line;
		put(num0, width => 15);
		new_line;
 	end loop;

end lab9b;
