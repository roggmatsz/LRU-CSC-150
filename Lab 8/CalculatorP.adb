-------------------------------------------
--| Rogger Matamoros / Evan Clough 
--| Lab 8
--| 02/15/11
-------------------------------------------
with Ada.text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.float_Text_IO; use Ada.Float_Text_IO;
With calculator; use calculator;

procedure calculatorP is 
	
int1, int2, sentinel : Integer;
float1,float2 : Float;
Sign: character;

begin
	while (sentinel /= 9001) loop
		Put("Integer arithmetic, float arithmetic, or exit? (enter i / f / e) : ");
		get(response);
		new_line;
		
		if response = 'i' then
			put("Enter two integer numbers followed by sign operator (+ - * /) ");
			get(Int1);
			put(" ");
			get(int2);
			put(" ");
			Get(sign);
			new_line;
			new_line;
			put("The result of ");
			put(Int1);
			put(" ");
			put(sign);
			put(" ");
			put(int2);
			put(" is ");
		
			if sign = '+' then 
				put(Int_add(int1, int2), width => 5);
			elsif sign = '-' then
				put(int_subtract(int1, int2), width => 5);
			elsif sign = '/' then 
				if (int2 = 0) then
					put("Error. Denominator is a zero.");
					new_line;
				else
					put(int_Divide(Int1, int2), width => 5);
				end if;
			elsif sign = '*' then 
				put(Int_Multiply(Int1, int2), width => 5);
			end if;

		elsif response = 'f' then 
			put("Enter two float numbers, followed by sign operator (+ - * /) ");
			get(FLoat1);
			put(" ");
			get(Float2);
			put(" ");
			Get(sign);
			new_line;
			new_line;
			put("The result of ");
			put(float1, aft => 1, exp => 0);
			put(" ");
			put(sign);
			put(" ");
			put(float2, aft => 1, exp => 0);
			put(" is ");

			if sign = '+' then
				put(Float_add(float1, float2), aft => 2, exp =>0);
			elsif sign = '-' then
				put(float_subtract(float1, float2), aft =>2, exp =>0);
			elsif sign = '/' then
				if (float2 = 0.0) then
					put("Error. Denominator is a zero.");
					new_line;
				else 
					put(float_Divide(float1, float2), aft => 2, exp =>0);
				end if;
			elsif sign = '*' then 
				put(float_Multiply(float1, float2), aft => 2, exp =>0);
			end if;
		
		elsif response = 'e' then
			sentinel := 9001;
		end if;
	end loop;

end CalculatorP;


	


