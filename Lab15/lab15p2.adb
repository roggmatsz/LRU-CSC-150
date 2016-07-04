----------------------------------------------
--| NAME: Rogger Matamoros / David Richardson
--| DATE: 04/10/11
--| ASSIGNMENT: Lab 15 Part 2
----------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab15p2 is
   type Arr_Type is array(1..10, 1..10) of Character;
   Array1: Arr_Type;
   Foo: Ada.Text_IO.File_Type;
begin
   --Part A
   Open(Foo, In_File, "foo.txt");
   for R in 1..10 loop
      for C in 1..10 loop
         Get(Foo, Array1(R, C));
      end loop;
   end loop;

   --part B
   for R in 1..10 loop
      for C in 1..10 loop
         Put(Array1(R, C));
         Put(' ');
      end loop;
      New_Line;
   end loop;

   --part C
   New_Line;
   for C in 1..10 loop
      for R in 1..10 loop
         Put(array1(R, C));
         Put(' ');
      end loop;
      New_Line;
   end loop;

   --part D
   New_Line;
   for R in reverse 1..10 loop
      for C in 1..10 loop
         Put(Array1(R, C));
         Put(' ');
      end loop;
      New_Line;
   end loop;
   New_Line;
end Lab15p2;
