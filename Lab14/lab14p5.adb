----------------------------------------------------------
--|NAME: Rogger Matamoros / Chelsea Willet / Ben Goldston
--|DATE: 04/05/11
--|ASSIGNMENT: Lab 14 Part 1 No. 5
---------------------------------------------------------
procedure Lab14p1n5 is
   type Arr1_Type is array(1..4) of Integer;
   Array1 is Arr1_Type;
   A: Integer;
begin
   for I in 1..3 loop
      if (Array1(I) > Array1(I + 1)) then
         A := Array1(I);
         Array1(I) := Array1(I + 1);
         Array1(I + 1) := A;
      end if;
   end loop;
end Lab14p1n5;
