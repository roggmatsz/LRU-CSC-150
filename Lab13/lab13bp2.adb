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
   for I in LolCatz loop
      if (I = 2 * I - 1) then
         LolCatz(I) :=
