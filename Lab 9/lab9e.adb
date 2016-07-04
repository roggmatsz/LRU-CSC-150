----------------------------------------------
--|NAME: ROGGER MATAMOROS / Kelsey Willatt
--|DATE: 02/24/11
--|ASSIGNMENT: LAB 9 part 1e
---------------------------------------------
with ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab9e is
sum: integer;
begin
	sum := 1;
	for foo in 1..10 loop
		sum := sum * 3;
		put(sum, width => 7);
	end loop;
end lab9e;
