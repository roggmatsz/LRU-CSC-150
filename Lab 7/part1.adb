With ada.text_IO; use ada.text_iO;
with ada.float_text_iO; use ada.float_Text_IO;
with ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure part1 is
	
---------------------------------------------------------
--| Lab #7
--| Ben Goldston / Rogger Matamoros
--| February 10, 2011
---------------------------------------------------------

TaxCode: character;
price: float;
taxRate: float;
squareRoot, floatSquare: float;

Code: natural;
X: Natural;
Y: Natural;
Sum: Natural;

LeapYear: Boolean;
Year: Natural;
square, counter: integer;
tests: Ada.Text_IO.File_Type;
honors, awards, goodStudent: boolean;

Begin --part1
	price := 50.0;
	code := 1;
	TaxRate := 0.08;
	--1a
	put("Part A");
	new_line;
	taxCode := 'T';
	if TaxCode = 'T' then
		Price := Price + (Price * TaxRate);
		put("price = ");
		put(Price, aft => 2, exp => 0);
	end if;

	--1b
	new_line;
	new_line;
	put("Enter code ");
	get(Code);
	new_line;
	if Code = 1 then
		put("Enter 2 numbers ");
		Get(x);
		Get(Y);

		Sum := x + y;
		Put("Sum = ");
		Put(Sum, width => 3);
	else
		Put("Error");
	end if;

	--1c
	new_line;
	new_line;
	put("leap years");
	new_line;
	year := 1994;
	if (Year rem 4 = 0) and (Year rem 100 = 0) and (Year rem 400 = 0) then
		LeapYear := true;
		put("the year ");
		put(year);
		
	else 
		put("the year ");
		put(year);
		put(" is not a leap year.");
	end if;

	
	--2
	new_line;
	new_line;
	put("Determine if student is good or bad");
	new_line;
	Honors := true;
	Awards := False;
	If (honors = true) and (awards =  true) then
			GoodStudent:= true;
			put("Student is a good student");
		else
			GoodStudent:= False;
			put("Student is a bad student");
	end if;
--part 2
	--a
	x := 1;
	new_line;
	new_line;
	put("Prints squares of the first 100 positive integers");
	loop
		if x = 100 then
			exit;
		end if;
		square := x * x;
		put(square, width => 4);
		put(" ");
		x := x + 1;
	end loop;
	--b
	new_line;
	new_line;
	floatSquare:= 1.0;
	counter := 1;
	put("prints the square roots of the first 25 odd positive integers");
	loop
		if Counter = 25 then
			exit;
	    end if;
		squareRoot := Ada.Numerics.Elementary_Functions.sqrt(floatSquare); 
		put(squareRoot, aft	=> 1, exp => 0);
		put(" ");
		floatSquare := floatSquare + 2.0;
		Counter := Counter + 1;
	end loop;

end part1;
