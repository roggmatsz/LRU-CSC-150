------------------------------------
--|NAME: Willet, Goldston, Matamoros
--|DATE: 04/05/11
--|ASSIGNMENT: Lab 14 Part 1 No. 3
------------------------------------
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
procedure Lab14p1n3 is
   type Record_Rec is record
      Foo: Integer;
      Bar: Integer;
   end record;
   type Array_Arr is array(1..5) of Record_Rec;
   Array1: Array_Arr;
   A: Integer;
begin
   for I in 1..5 loop
      Put("Enter an integer");
      Get(A);
      Array1(I.Foo) = A;
      New_Line;
      Put("enter another");
      Get(A);
      Array1(I.Bar) = A;
   end loop;
   end Lab14p1n3;

