--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros / Chelsey Smithey
--  *  DATE: 03/30/11
--  *  ASSIGNMENT: Lab 13 part "Arrays and Record Types"
--------------------------------------------------------------------------------

procedure lab13a is
   --Part 1
   type MemberType_Type is (Mom, Dad, Brother, Sister);
   type Name_Record is record
      FirstName: String (1..15);
      LastName: String (1..15);
   end record;
   type Address_Record is record
      Street: String (1..15);
      City: String (1..15);
      State: String (1..2);
      ZipCode: Integer (1..99999);
   end record;
   type ExpirationDate_Record is record
      Month: Integer (1..12);
      Year: Integer (1..9999);
   end record;
   type RenewalNotice_Record is record
      Month: Integer (1..12);
      Day: Integer (1..31);
      Year: Integer (1..9999);
      SentNotices: Integer (1.9999);
   end record;
   type FamilyMember_Record is record
      MemberType: MemberType_Type;
      Name: String (1..15);
      Age: Integer (1..150);
   end record;
   type Family_Record is record
      Individual: FamilyMember_Record;
      SiblingNum: Integer (1..12);
   end record;
   type Subscriber_Record is record
      Name: Name_Record;
      Address: Address_Record;
      Expiration_Date: ExpirationDate_Record;
      RenewalNotices: RenewalNotices_Record;
      SubscriptionDuration: Integer (0..3);
      SubscriberPrivacy: Boolean;
      SubscriberFamily: Family_Record;
   end record;
   --part 2
   type PartB is array (Integer range 1..11);
   Foo: PartB;
   Num: Integer;
   Odd: Integer;
   Bool: Boolean;
   function Part2 (A: Integer) Returns Boolean is
      I: Integer;
      for J in foo'Range loop
         I := 2 * J - 1;
         if (A = Foo(I) then
            return True;
         end if;
         J := I;
      end loop;
   end Part2;

begin
   --part 2
   Put("Enter a number from 1 to 11");
   Get(Num);
   Bool := Part2(Num);
   --...
end lab13a;
