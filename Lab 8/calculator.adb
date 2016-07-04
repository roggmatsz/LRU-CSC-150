-------------------------------------------
--| Rogger Matamoros / Evan Clough 
--| Lab 8
--| 02/15/11
-------------------------------------------

with ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body calculator is 
	
	function int_Add(num1, num2: integer) return integer is
		
	begin
		return num1 + num2;
	end int_Add;

	function int_subtract(num1, num2: integer) return integer is
	begin
		return num1 - num2;
	end int_subtract;
	
	function int_multiply(num1, num2: integer) return integer is
	begin
		return num1 * num2;
	end Int_multiply;

	function int_divide(num1, num2: integer) return integer is
	begin
		return num1 / num2;
	end int_divide;

	function float_add(num1, num2: float) return float is
	begin
		return num1 + num2;
	end float_add;

	function float_subtract(num1, num2: float) return float is
	begin
		return num1 - num2;
	end float_subtract;

	function float_multiply(num1, num2: float) return float is
	begin
		return num1 * num2;
	end Float_multiply;

	function float_Divide(num1, num2: float) return float is
	begin
		return Num1 / num2;
	end float_divide;

end calculator;
