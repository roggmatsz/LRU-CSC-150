----------------------------------------------
--|NAME: ROGGER MATAMOROS / Kelsey Willatt
--|DATE: 02/24/11
--|ASSIGNMENT: LAB 9 part 1c
---------------------------------------------

with ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab9c is
	sum, num1, num0: integer;
	type employees is (Bob, bill, ann, dale, susie);
	package employees_IO is new Ada.Text_IO.enumeration_IO(enum => employees);
	use employees_IO;
begin	--part c
	for foo in Bob..Susie loop
    	Put("Enter # of sick leave taken by ");
		Put(foo);
		new_line;
		get(num0);
		new_line;
		put(foo);
		put(" had ");
		put(num0);
		put(" sick days");
		new_line;
	end loop;
end lab9c;
