---------------------------------------------------------
--| Lab #7
--| Ben Goldston / Rogger Matamoros
--| February 10, 2011
---------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab7p2 is
average, score, floatCounter, sentinel: float;
grade: character;
tests1: Ada.Text_IO.File_Type;
		
begin
open(File => tests1, mode => Ada.Text_IO.In_File,
		Name => "/Users/J4NUS/Dropbox/CSC 150 Stuff/Lab 7/tests1.txt");
average := 0.0;
	floatcounter := 1.0;
	score := 0.0;
	grade := 'i';
	get(tests1, sentinel);
	while score /= sentinel loop
		get(tests1, score);
		--2a
		if (score <= 100.0) and (score >= 90.0) then
			grade := 'A';
		elsif (score <= 89.0) and (score >= 80.0) then
			grade := 'B';
		elsif (score <= 79.0) and (score >= 70.0) then
			grade := 'C';
		elsif (score <= 69.0) and (score >= 60.0) then
			grade := 'D';
		elsif (score <= 60.0) then
			grade := 'F';
		end if;
		--2b
		put("Score = ");
		put(score, aft => 1, exp => 0);
		put(" and letter grade = ");
		put(grade);
		new_line;
		--2c
		average := score + average;
		floatcounter := floatcounter + 1.0;
 	end loop;
	average := average / floatCounter;
	new_line;
	new_line;
	put("average is ");
	put(average, aft => 1, exp => 0);

end lab7p2;
