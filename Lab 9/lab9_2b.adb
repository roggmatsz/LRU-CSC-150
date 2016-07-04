----------------------------------------------
--|NAME: ROGGER MATAMOROS / Kelsey Willatt
--|DATE: 02/24/11
--|ASSIGNMENT: LAB 9 part 2b
---------------------------------------------
with ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab9_2b is
	num0, num1, sum: integer;
begin
	sum := 1;
	for i in 1..1 loop
		put("    ");
		for j in 1..9 loop
			put(sum, width => 4);
			sum := sum + 1;
		end loop;
		new_line;
		for k in 1..9 loop
			for l in 1..k loop
				if (l = 1) then
					put(k * 1, width => 4);
				end if;
				put(l * k, width => 4);
			end loop;
			new_line;
		end loop;
	end loop;
end lab9_2b;
