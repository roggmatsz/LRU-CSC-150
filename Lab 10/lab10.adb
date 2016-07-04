-----------------------------------------------
--| ROGGER MATAMOROS / BRANDON LUCACIU
--| 03/01/21
--| LAB 10
-----------------------------------------------

with ada.Text_IO; use ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Lab10 is

	type days_missed is(john,jacob,david,brandon,chris);
subtype employees is days_missed range john .. chris;
package Day_missed_IO is
	new ada.Text_IO.Enumeration_IO (Enum => Days_missed);
subtype Letters is character range 'A'..'Z';
use day_missed_IO;
exam_score: float;
Sick_days: integer;
sum: Integer;
power: integer;
product: Integer;
H, i, j, k : integer;
char: character;
infile: File_type;
bar: employees;
begin
open(infile, in_file, "E:\Computer Science\CSC 150\Lab10\foo.txt");
i := 1;
J := 1;
k := 1;	
--part 1a
loop
	exit when i = 11; 	
	sum:= i + I;
    I := I + 1;
	put(sum, width => 3);
end loop;
new_line;
--part 1b
while j < 6 loop
	Put("Enter exam score ");
	get(exam_score);
	new_line;
	j := j + 1;
end loop;
--part 1c
H := 0;
loop
	put("Enter the days missed for ");
	Put(Days_Missed'val(H));
	get(sick_days);
	new_line;
	Put(Days_missed'Val(H));
	Put(Sick_Days, Width => 3);
	New_line;
	exit when days_Missed'Val(H) = Days_missed'last;
	h := h + 1;
end loop; 

--part 1e
loop
	begin
	put("enter an integer");
	get(i);
	exit;
exception
	when constraint_error =>
		put("Value is out of range, kid!");
		new_line;
	when Data_Error =>
		put("Please enter an integer, not a float, char, or string");
		new_line;
	end;
end loop;

--part 1f
while k < 11 loop
	power:= 3**k;
	put(power, width => 3);
	k := k + 1;
	new_line;
end loop;

--part 1g
loop
	put("enter a character");
	get(char);
	new_line;
	put(char);
	new_line;
	exit when char = '?';
end loop;
--part 1h
new_line;
power := 1;
K := 1;
loop 
	power:= 2**k;
	exit when power > 240;
	put(power, width => 3);
	k := k + 1;
	new_line;
end loop;
--Part 2
new_line;
while not end_of_file loop
begin	
	get(infile, i);
	put(i);
	exit;
exception
	when constraint_Error =>
		put("Something went horribly wrong, has to do with constraints");
		new_line;
	when data_Error =>
		put("I can't haz cheeze! Something went wrong, related to data_error!!11!!1!");
		new_line;
end;
end loop;

end lab10;
