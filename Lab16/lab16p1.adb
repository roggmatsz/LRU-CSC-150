---------------------------------------------------------------
--| NAME: Rogger Matamoros / Ben Goldston
--| DATE: 04/14/11
--| ASSIGNMENT: Lab 16 Part 1
---------------------------------------------------------------
with ada.Text_IO; use ada.Text_IO;
procedure lab16p1 is
	type page is (page1, page2, page3);
	type array_type is array (1..4, 1..2, 1..3) of character;
	matrix: array_Type;
begin
	for Z in 1..3 loop
		for x in 1..2 loop
			for y in 1..4 loop
				get(matrix(y, x, z));
			end loop;
		 end loop;
	end loop;
 end lab16p1;


