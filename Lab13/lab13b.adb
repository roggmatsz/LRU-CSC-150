-----------------------------------------------------
-- * NAME: Rogger Matamoros / Chelsea Smithey
-- * DATE: 03/30/11
-- * ASSIGNMENT: Lab 13 part "Switch Partners Here"
-----------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab13b is
   type Grades is (Exam1, Exam2, Quiz1, Final);
   type BaseArray is array(Grades) of Integer;
   Array1: BaseArray;
   type OtherArray is array(Integer range <>) of BaseArray;
   Array2: OtherArray(1..2);
   A, B: Integer;

begin
   Put("Enter grades");
   for I in 1..2 loop
      for J in 1..4 loop
         Get(A);
         Array1'Pos(J) := A;
      end loop;
   end loop;
end Lab13b;
