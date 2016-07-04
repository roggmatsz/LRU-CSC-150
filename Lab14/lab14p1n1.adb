----------------------------------------------------------
--| NAME: Ben Goldston / Rogger Matamoros / Kelsey Willet
--| DATE: 04/05/11
--| ASSIGNMENT: Lab 14 Part 1 No. 1
----------------------------------------------------------
function Lab14p1n1 (A: Integer) Returns Boolean is
   type Arr_Type is array(1..10) of Integer;
   Array1 is Arr_Type;
   J: Integer;
begin
   for I in 1..5 loop
      J = 2 * I - 1;
      if (I = J) and (Array1(I) = A) then
         return True;
      end if;
   end loop;
end Lab14p1n1;
