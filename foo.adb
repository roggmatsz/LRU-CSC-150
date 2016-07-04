--------------------------------------------------------------------------------
--  NAME: Rogger Matamoros / Ben Goldston
--  DATE: 02/09/11
--  ASSIGNMENT: Lab 6 part 1
--------------------------------------------------------------------------------
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure foo is
	sign: character;
	result, num1, num2: integer;
begin
	put("enter two numbers");
	get(num1);
	get(num2);
	put("enter a calculation symbol");
	get(sign);
	if sign = '+' then
		result := num1 + num2;
	elsif sign = '-' then
		result := num1 - num2;
	elsif sign = '*' then
		result := num1 * num2;
	elsif sign = '/' then
		result := num1 / num2;
	end if;
	put("result is ");
	put(result);
end foo;
