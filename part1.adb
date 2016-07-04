--------------------------------------------------------------------------------
--  NAME:
--  DATE: 02/08/11
--  ASSIGNMENT: Lab6 part 1
--------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Integer_Text_IO;
with Ada.Integer_Text_IO; use Ad.Integer_Text_IO;

procedure part1 is
	product, num1, num2, num3, sum: integer;
begin
	put("enter 3 numbers ");
	get(num1);
	get(num2);
	get(num3);
	if num1 < 0 then
		product := num1 * num2 * num3;
		put(product);
	else
		sum:= num1 + num2 + num3;
		put(sum);
	end if;
	
--part 2a of part 1
	if item > 0 then
		product := product * item;
		put(product);
	else
		put(product);
	end if;
--part 2b of part 1
	if x - y >= 0 then
		z := x - y;
	elsif y - x >=0 then
		z := y - x;
	end if;
end part1;
