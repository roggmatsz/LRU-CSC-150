-----------------------------------------
--|NAME: Rogger Matamoros / Kelsey Willet
--|DATE: 04/27/11
--|ASSIGNMENT: Lab 17 Part 5
-----------------------------------------
function  expt (X: Integer; Y:Integer) return Integer is
   Sum: Integer := 1;
begin
   if (Y = 0) then
      return Sum;
   else
      Sum := Sum * X * expt(X, (Y - 1));
   end if;
end expt;
