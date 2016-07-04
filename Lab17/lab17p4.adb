-----------------------------------------
--|NAME: Rogger Matamoros / Kelsey Willet
--|DATE: 04/27/11
--|ASSIGNMENT: Lab 17 Part 4
-----------------------------------------
function  Mult (X: Integer; Y:Integer) return integer is
   Sum: Integer := 0;
begin
   if (Y = 0) then
      return Sum;
   else
      Sum := X + Mult(X, (Y - 1));
   end if;
 end Mult;
