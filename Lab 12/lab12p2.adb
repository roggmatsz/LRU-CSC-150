--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros / Chelsey Smithey
--  *  DATE: 03/17/11
--  *  ASSIGNMENT: Lab 12 part 2
--------------------------------------------------------------------------------

with Ada.Text_IO; use ada.Text_IO;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

procedure lab12p2 is
function digit2alpha (a:string) return string is
	finalStr: string (1..60);
	subtype inStringType is string(1..10);
	inStr: inStringType;
	month, monthDay, dayTens, dayOnes, yearFirst, yearTens, yearOnes: string (1..20);
begin
	inStr := a;
	 case inStr(1) is
		when '0' =>
			case inStr(2) is
				when '1' =>
					month := "January";
				when '2' =>
					month := "February";
				when '3' =>
					month := "March";
				when '4' =>
					month := "April";
				when '5' =>
					month := "May";
				when '6' =>
					month := "June";
				when '7' =>
					month := "July";
				when '8' =>
					month := "August";
				when '9' =>
					month := "September";
				when others =>
					put("something has gone terribly wrong. (Months)");
			end case;
		when '1' =>
			case inStr(2) is
				when '0' =>
					month := "October";
				when '1' =>
					month := "November";
				when '2' =>
					month := "December";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when others =>
			put("something has gone terribly wrong");
	end case;
	case inStr(4) is
		when '0' =>
			case inStr(5) is
				when '1' =>
					dayOnes := "first";
				when '2' =>
					dayOnes := "second";
				when '3' =>
					dayOnes := "third";
				when '4' =>
					dayOnes := "fourth";
				when '5' =>
					dayOnes := "fifth";
				when '6' =>
					dayOnes := "sixth";
				when '7' =>
					dayOnes := "seventh";
				when '8' =>
					dayOnes := "eight";
				when '9' =>
					dayOnes := "ninth";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '1' =>
			case inStr(5) is
				when '0' =>
					dayOnes := "tenth";
				when '1' =>
					dayOnes := "eleventh";
				when '2' =>
					dayOnes := "twelfth";
				when '3' =>
					dayOnes := "thirtheenth";
				when '4' =>
					dayOnes := "fourtheenth";
				when '5' =>
					dayOnes := "fifteenth";
				when '6' =>
					dayOnes := "sixteenth";
				when '7' =>
					dayOnes := "seventeenth";
				when '8' =>
					dayOnes := "eighteenth";
				when '9' =>
					dayOnes := "ninetheenth";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '2' =>
			dayTens := "twenty";
			case inStr(5) is
				when '1' =>
					dayOnes := "-first";
				when '2' =>
					dayOnes := "-second";
				when '3' =>
					dayOnes := "-third";
				when '4' =>
					dayOnes := "-fourth";
				when '5' =>
					dayOnes := "-fifth";
				when '6' =>
					dayOnes := "-sixth";
				when '7' =>
					dayOnes := "-seventh";
				when '8' =>
					dayOnes := "-eight";
				when '9' =>
					dayOnes := "-ninth";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '3' =>
			dayTens := "thirty";
			if (inStr(5) = '1') then
				dayOnes := "-first";
			end if;
		when others =>
			put("something has gone terribly wrong");
	end case;
	finalStr := month & " " & dayTens & " " & dayOnes & ", ";
	case inStr(7) is
		when '1' =>
			case inStr(8) is
				when '0' =>
					yearFirst := "ten";
				when '1' =>
					yearFirst := "eleven";
				when '2' =>
					yearFirst := "twelve";
				when '3' =>
					yearFirst := "thirteen";
				when '4' =>
					yearFirst := "fourteen";
				when '5' =>
					yearFirst := "fifteen";
				when '6' =>
					yearFirst := "sixteen";
				when '7' =>
					yearFirst := "seventeen";
				when '8' =>
					yearFirst := "eighteen";
				when '9' =>
					yearFirst := "nineteen";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '2' =>
			yearFirst := "twenty";
		when others =>
			put("something has gone terribly wrong");
	end case;
	finalStr := finalStr & yearFirst & " hundred and ";
	case inStr(9) is
		when '0' =>
			case inStr(10) is
				when '0' =>
					yearOnes := "one";
				when '1' =>
					yearOnes := "two";
				when '2' =>
					yearOnes := "three";
				when '3' =>
					yearOnes := "four";
				when '4' =>
					yearOnes := "five";
				when '6' =>
					yearOnes := "six";
				when '7' =>
					yearOnes := "seven";
				when '8' =>
					yearOnes := "eight";
				when '9' =>
					yearOnes := "nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '1' =>
			case inStr(10) is
				when '0' =>
					yearOnes := "ten";
				when '1' =>
					yearOnes := "eleven";
				when '2' =>
					yearOnes := "twelve";
				when '3' =>
					yearOnes := "thirteen";
				when '4' =>
					yearOnes := "fourteen";
				when '5' =>
					yearOnes := "fifteen";
				when '6' =>
					yearOnes := "sixteen";
				when '7' =>
					yearOnes := "seventeen";
				when '8' =>
					yearOnes := "eighteen";
				when '9' =>
					yearOnes := "nineteen";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '2' =>
			yearTens := "twenty";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "-seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '3' =>
			yearTens := "thirty";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "-seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '4' =>
			yearTens := "fourty";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "-seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '5' =>
			yearTens := "fifty";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "-seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '6' =>
			yearTens := "sixty";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "-seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '7' =>
			yearTens := "seventy";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "-seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '8' =>
			yearTens := "eighty";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "=seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
		when '9' =>
			yearTens := "ninety";
			case inStr(10) is
				when '0' =>
					yearOnes := "-one";
				when '1' =>
					yearOnes := "-two";
				when '2' =>
					yearOnes := "-three";
				when '3' =>
					yearOnes := "-four";
				when '4' =>
					yearOnes := "-five";
				when '6' =>
					yearOnes := "-six";
				when '7' =>
					yearOnes := "-seven";
				when '8' =>
					yearOnes := "-eight";
				when '9' =>
					yearOnes := "-nine";
				when others =>
					put("something has gone terribly wrong");
			end case;
	end case;
	return finalStr;
end digit2alpha;

	inDate: string (1..10);
begin
	put("Enter a date in the form of mm dd yyyy (year ranges from 1000 to 2099)");
	new_line;
	get(inDate);
	put(digit2alpha(inDate));
	
end lab12p2;