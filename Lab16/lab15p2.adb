---------------------------------------------------------------
--| NAME: Rogger Matamoros / Ben Goldston
--| DATE: 04/14/11
--| ASSIGNMENT: Lab 16 Part 1
---------------------------------------------------------------
procedure Lab15p3 is
   type Supplies_Cat is (Paper, Ribbon, Labels, unknown);
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

