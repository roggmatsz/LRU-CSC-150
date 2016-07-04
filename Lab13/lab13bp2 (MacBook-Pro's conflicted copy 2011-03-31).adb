-----------------------------------------------
-- * NAME: Rogger Matamoros / Chelsey Smithey
-- * DATE: 03/30/11
-- * ASSIGNMENT: Lab 13B part 2
-----------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab13bp2 is
   type Arrayz is array(Integer range <>) of Integer;
   LolCatz: Arrayz(1..10);
   Cheezeburgurz: Integer;
begin
   --put some values in the matrix.
   for I in LolCatz'range loop
      if (I = 2 * I - 1) then
         LolCatz(I) := (-1) ** I * (2 * I - 2);
      elsif (I rem 2 = 0) then
         LolCatz(I) := I * (2 * I - 1);
      end if;
   end loop;
   for I in LolCatz'range loop
      if (LolCatz(I) > LolCatz(I + 1)) and (I < 11) then
         cheezeburgurz := LolCatz(I + 1);
         LolCatz(I + 1) := LolCatz(I);
         Lolcatz(I) := cheezeburgurz;
      end if;
   end loop;
end Lab13bp2;
