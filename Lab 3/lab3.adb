-------------------------------------------------------------------------------------
--|NAME: Rogger Matamoros / David Richardson
--|DATE: 01/25/11
--|ASSIGNMENT: Lab #3 (Spring 2011)
--|ALGORITHM DESCRIPTION: Program asks for variables first, 
--|then it outputs the result of performing predefined functions with input variables.
-------------------------------------------------------------------------------------

with ada.text_IO;
with ada.float_text_IO;
procedure lab3 is
	x : float;
    y : float;
	Z : float;
	result: float;
begin
	Ada.text_IO.put(item => "enter a value for x: ");
	ada.float_text_IO.get(item => x);
	ada.text_IO.put(item => "enter a value for y: ");
	ada.float_Text_IO.get(item => y);
	ada.text_IO.put(item => "enter a value for z: ");
	ada.float_text_IO.get(Item => z);

	result := 3.0 * x;
	Ada.text_IO.put(item => "the result for a is: ");
	Ada.float_text_IO.put(item => result, fore=> 1, aft=> 2, Exp=> 0);
	ada.Text_IO.new_line;
	result := 3.0 * x + y;
	Ada.text_IO.put(item => "the result for b is: ");
	ada.float_text_IO.Put(item => result, fore=> 1, aft=> 2, Exp=> 0);
	ada.Text_IO.new_line;
	result := (x + y) / 7.0;
    Ada.text_IO.put(item => "the result for c is: ");
	ada.float_Text_Io.Put(item => result, fore=> 1, aft=> 2, Exp=> 0);
	ada.Text_IO.new_line;
	result := ((3.0 * x) + y) / (z + 2.0);
	Ada.text_IO.put(item => "the result for d is: ");
	ada.float_Text_Io.Put(item => result, fore=> 1, aft=> 2, Exp=> 0);
end lab3;
