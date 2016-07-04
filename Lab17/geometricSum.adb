-----------------------------------------
--|NAME: Rogger Matamoros
--|DATE: 04/27/11
--|ASSIGNMENT: Lab 17 Part 3
-----------------------------------------
with Ada.Math;
function GeometricSum (K: Positive) return Integer is
   Sum: Integer;
begin
   Sum := Sum + 1 / GeometricSum(Math.Pow(2, (K + 1)));
end GeometricSum;


