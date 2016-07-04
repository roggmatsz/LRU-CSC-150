--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros / Chelsey Smithey
--  *  DATE: 03/17/11
--  *  ASSIGNMENT: Lab 12 part 2
--------------------------------------------------------------------------------

with Ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure lab12p1 is

function cardTypeDetectorz return string is
	subtype randRange is positive range 1..52;
	package rand_52 is new Ada.Numerics.Discrete_Random (RandRange);
	g: Rand_52.Generator;
	cardType: string (1..8);
	cardVal: string (1..5);
	randNum: integer;
	answer: string (1..14);
begin
	rand_52.Reset(Gen => g);
	randNum := rand_52.Random(gen => g);
	if (randNum > 0 ) and (randNum < 14) then 
		cardType := "   Clubs";
		case randNum is 
			when 1 =>
				cardVal := "  ace";
			when 2 =>
				cardVal := "    2";
			when 3 =>
				cardVal := "    3";
			when 4 =>
				cardVal := "    4";
			when 5 =>
				cardVal := "    5";
			when 6 =>
				cardVal := "    6";
			when 7 =>
				cardVal := "    7";
			when 8 =>
				cardVal := "    8";
			when 9 =>
				cardVal := "    9";
			when 10 =>
				cardVal := "   10";
			when 11 =>
				cardVal := " jack";
			when 12 =>
				cardVal := "queen";
			when 13 => 
				cardVal := " king";
			when others =>
				put("Something has gone terribly wrong w/ the randNum_Generator");
		end case;
	elsif (randNum > 13) and (randNum < 27) then
		cardType := "Diamonds";
		case randNum is 
			when 14 =>
				cardVal := "  ace";
			when 15 =>
				cardVal := "    2";
			when 16 =>
				cardVal := "    3";
			when 17 =>
				cardVal := "    4";
			when 18 =>
				cardVal := "    5";
			when 19 =>
				cardVal := "    6";
			when 20 =>
				cardVal := "    7";
			when 21 =>
				cardVal := "    8";
			when 22 =>
				cardVal := "    9";
			when 23 =>
				cardVal := "   10";
			when 24 =>
				cardVal := " jack";
			when 25 =>
				cardVal := "queen";
			when 26 => 
				cardVal := " king";
			when others =>
				put("Something has gone terribly wrong w/ the randNum_Generator");
		end case;
	elsif (randNum > 26) and (randNum < 40) then
		cardType := "  Hearts";
		case randNum is 
			when 27 =>
				cardVal := "  ace";
			when 28 =>
				cardVal := "    2";
			when 29 =>
				cardVal := "    3";
			when 30 =>
				cardVal := "    4";
			when 31 =>
				cardVal := "    5";
			when 32 =>
				cardVal := "    6";
			when 33 =>
				cardVal := "    7";
			when 34 =>
				cardVal := "    8";
			when 35 =>
				cardVal := "    9";
			when 36 =>
				cardVal := "   10";
			when 37 =>
				cardVal := " jack";
			when 38 =>
				cardVal := "queen";
			when 39 => 
				cardVal := " king";
			when others =>
				put("Something has gone terribly wrong w/ the randNum_Generator");
		end case;
	elsif (randNum > 39) and (randNum < 53) then
		cardType := "  Spades";
		case randNum is 
			when 40 =>
				cardVal := "  ace";
			when 41 =>
				cardVal := "    2";
			when 42 =>
				cardVal := "    3";
			when 43 =>
				cardVal := "    4";
			when 44 =>
				cardVal := "    5";
			when 45 =>
				cardVal := "    6";
			when 46 =>
				cardVal := "    7";
			when 47 =>
				cardVal := "    8";
			when 48 =>
				cardVal := "    9";
			when 49 =>
				cardVal := "   10";
			when 50 =>
				cardVal := " jack";
			when 51 =>
				cardVal := "queen";
			when 52 => 
				cardVal := " king";
			when others =>
				put("Something has gone terribly wrong w/ the randNum_Generator");
		end case;
	end if;
	answer := cardType & " " & cardVal;
	return answer;
end cardTypeDetectorz;

begin
	put("Your hand consists of");
	for i in 1..5 loop
		put(cardTypeDetectorz);
		if (i < 4) then
			put(", ");
		elsif (i = 4) then
			put(", and ");
		end if;
	end loop;
	
end lab12p1;
