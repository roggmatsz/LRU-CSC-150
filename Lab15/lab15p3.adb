----------------------------------------------
--| NAME: David Richardson / Rogger Matamoros
--| DATE: 04/12/11
--| ASSIGNMENT: Lab 15 Part 3
----------------------------------------------

procedure Lab15p3 is
   type Supplies_Cat is (Paper, Ribbon, Labels);
   type Kind_Type is (Carbon, Cloth);
   type Supplies (Category: Supplies_Cat := Uknown) is record
      Cost: Integer;
      NumOnNand: Integer;
      ReorderPt: Integer;

      case Category is
         when Paper =>
            SheetsPerBox: Integer := 11.5;
            PaperSize: Integer;
         when Ribbon =>
            Size: Integer := 55;
            Color: String (1..11);
            Kind: Kind_Type;
         when Labels =>
            Size: Integer;
            NumPerBox: Integer := 66;
         when Unknown =>
            null;
      end case;
   end record;
   Foo: Supplies;
begin
   Get(Foo(Paper).PaperSize);
   Get(Foo(Labels).Size);
   Put(Foo(Paper).PaperSize);
   Put(Foo(Labels).Size);
end Lab15p3;
