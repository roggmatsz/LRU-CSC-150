-----------------------------------------------------------
--| NAME: Rogger Matamoros / Brandon Harwood /  
--| Date: 03/04/11
--| ASSIGNMENT: Lab 11 Part 3
-----------------------------------------------------------
with Ada.Text_IO; use ada.text_IO;
with ada.Integer_Text_IO; use ada.integer_text_IO;

procedure lab11 is
	x, y: integer;
procedure lab11_3 (A, B:integer) is
begin
	if (b < 11) then
		while (a > 0) loop
			modul := a rem b;
			a := a / b;
			put(modul, width => 2);
		end loop;
	else
		put("new base cannot be greater than 10");
	end if;
end lab11_3;
	put("enter a digit and a base to convert it to ");
	get(a);
	get(b);
	lab11_3(a, b);
begin
	
