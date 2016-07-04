----------------------------------------------
--|NAME: ROGGER MATAMOROS / Kelsey Willatt
--|DATE: 02/24/11
--|ASSIGNMENT: LAB 9 part 2a
---------------------------------------------
with ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab9_2a is
	type abc is (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z);
	package abc_IO is new Ada.Text_IO.Enumeration_IO (enum => abc); use abc_IO;
	
begin
	for bar in abc loop
		if (bar /= a) and (bar /= e) and (bar /= i) and (bar /= o) and (bar /= u) then
				put(bar);
				put(" ");
		end if;
	end loop;
end lab9_2a;
