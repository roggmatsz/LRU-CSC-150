--------------------------------------------
--|NAME: Rogger Matamoros / David Richardson
--|DATE: 01/25/11
--|ASSIGNMENT: Lab #3 (Spring 2011)
--|ALGORITHM DESCRIPTION: Program asks for time in seconds and then proceeds to make
--|the necessary calculations programatically to figure out days, hours, minutes, and seconds
with ada.text_IO;
with ada.integer_text_IO;

procedure lab3_b is
	seconds, days, hours, minutes : integer;
begin 
	Ada.text_IO.put(item => "enter number of seconds");
	ada.integer_text_IO.get(item => seconds);

	days := seconds / 86400;
	hours := (seconds rem 86400) / 3600;
	minutes := ((seconds rem 86400) rem 3600) / 60;--(seconds rem 86400) rem 3600;
	seconds := ((seconds rem 86400) rem 3600) rem 60;
	
	Ada.text_IO.put(item => "number of days is: ");
	ada.integer_Text_IO.put(item => days);
	Ada.text_Io.new_line;
	Ada.text_IO.put(item => "number of hours is: ");
	ada.integer_Text_IO.put(item => Hours);
	Ada.text_Io.new_line;
	Ada.text_IO.put(item => "number of minutes is: ");
	ada.integer_Text_IO.put(item => minutes);
	Ada.text_Io.new_line;
	Ada.text_IO.put(item => "number of seconds is: ");
	ada.integer_Text_IO.put(item => seconds);
end lab3_B;
