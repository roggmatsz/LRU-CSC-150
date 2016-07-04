--------------------------------------------------------------------------------
--  NAME: Rogger Matamoros / Ben Goldston

--  DATE: 02/09/11 
--  ASSIGNMENT: Lab6 Part 2
--------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_IO; use Ada.Integer_Text_IO;

procedure part2 is
	y, z: integer;
	x: constant 5;
	function red;
	function red is
		begin
			put(x);
		end red;
	function blue(y: integer);
	function blue return integer is
		begin
			y := y + 1;
			return y;
		end blue;
begin
	put("enter numbers");
	get(y);
	put(blue(y));
	red;
end part2;
