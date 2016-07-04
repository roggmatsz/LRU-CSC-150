----------------------------------------------------------
--| NAME: Kelsey Willet / Ben Goldston / Rogger Matamoros
--| DATE: 04/06/11
--| ASSIGNMENT: Lab 14 Part 1 No. 4
----------------------------------------------------------
procedure Lab14p1n4 is
	MaxEmp: constant Integer := 5;
	subtype NumE is range 1..MaxEmp;
	subtype RealRange is (HourlyPay, NumHoursWk, SalaryWk);
	type Real is array(RealRange) of Integer;
	type Pay_Info_Arr is array (1..3) of Real;
	type Arr_Arr is array(1..MaxEmp) of EmpRecType;
	type EmpRecType is record
		Name: String (1..15);
		Ssn: String (1..15);
		Pay_Info: Pay_Info_Arr;
	end record;
	type DataBaseType is record
		NumEmp: NumE;
		EmpRec: Arr_Arr;
	end record;
	dbase1: DataBaseType;
	foo: integer;
begin
	for I in 1..MaxEmp loop
      get(Dbase1.NumEmp);
		for J in 1..MaxEmp loop
			get(dbase1.NumEmp(J).name);
			get(dbase1.NumEmp(J).ssn);
			for k in 1..3 loop
				get(dbase1.NumEmp(J).Pay_Info(k).HourlyPay);
				get(dbase1.NumEmp(J).Pay_Info(k).NumHoursWk);
				dbase1.NumEmp(J).Pay_Info(k).SalaryWk := dbase1.NumEmp(J).Pay_Info(k).NumHoursWk * 
					dbase1.NumEmp(J).Pay_Info(k).HourlyPay;
			end loop;
		end loop;
	end loop;
end Lab14p1n4;
