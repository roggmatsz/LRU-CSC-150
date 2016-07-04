--------------------------------------------
--|NAME: Rogger Matamoros
--|DATE: 02/04/11
--|ASSIGNMENT: Lab #5
--|ALGORITHM DESCRIPTION: Calculates the weekly pay, totals, and checks
--|of employees 
--------------------------------------------
with ada.Text_IO; use Ada.Text_IO;
with Ada.Float_text_IO; use Ada.Float_text_iO;
with Ada.Integer_text_IO; use Ada.Integer_text_IO;

procedure employeeSkittles is
	name: string (1..16);
	hoursWorked: float; -- ** tried to set boundaries on all these vars. Compiler gave errors tho.
	payRate: float; -- **
	weeklyPay: float; -- **
	data: Ada.Text_IO.File_Type;
	checks: Ada.Text_IO.File_Type;
	sumHours: float; -- **
	sumPay: float; -- **
	checkNumber: integer; -- **
	type pArray is array(1 .. 4) of float; -- array used to store weekly pay
	payArray: pArray;
	type nArray is array(1 .. 4) of string(1..16); --array used to store employee names
	nameArray: nArray;
	counter: integer; -- **
begin
	--table-creating segment starts here.
	sumPay := 0.0;
	sumHours := 0.0;
	counter := 1;
	open(File => data, mode => Ada.Text_IO.In_File,
		Name => "/Users/J4NUS/Desktop/foo/data.txt"); --change this
	put(item => "                    Weekly Payroll - February 2, 2011");
	new_line;
	put(item => "________________________________________________________________________");
	new_line;
	put(item => "Name              ");
	put(item => "Hours Worked            ");
	put(item => "Pay Rate            ");
	put(item => "Weekly Pay");
	new_line;
	loop -- in charge of displaying the table of employees
		if end_of_File(file => data) then
			exit;
		end if;
		get(file => data, item => name);
		nameArray(counter) := name;
		get(file => data, item => hoursWorked);
		get(file => data, item => payRate);
		weeklyPay := PayRate * HoursWorked;
		sumHours := sumHours + hoursWorked;
		sumPay := sumPay + weeklyPay;
		payArray(counter) := sumPay;
		counter:= counter + 1;
		put(name);
		put("     ");
		put(hoursWorked, aft => 2, Exp => 0);
		put("                 ");
		put(payRate, aft => 2, exp => 0);
		put("               $");
		Put(weeklyPay, aft => 2, exp => 0);
		new_line;
	end loop;
	put("________________________________________________________________________");
	new_line;
	put(item => "Totals              ");
	put(item => sumHours, aft => 2, exp => 0);
	put(item => "                                     $");
	put(item => sumPay, aft => 2, exp => 0);
	new_line;
	new_line;
	put("The checks have been printed out successfully to checks.txt.");
	new_line;
	
	-- Check-creating segment starts here.
	create(checks, out_file, "/Users/J4NUS/Desktop/foo/checks.txt"); --change this
	reset(checks);
	reset(data, In_File);
	counter := 1;
	checkNumber := 23450;
	loop --in charge of printing checks.
		if counter > 4 then
			exit;
		end if;
		put(checks, "________________________________________________________________________");
		new_line(checks);
		put(checks, "|    Lenoir-Rhyne University                          Check # ");
		put(checks, checkNumber, width => 5);
		checkNumber := checkNumber + 1;
		put(checks, "    |");
		new_line(checks);
		put(checks, "|                                                                      |");
		new_line(checks);
		put(checks, "|                                                                      |");
		new_line(checks);
		put(checks, "|    Pay to the");
		put(checks, "                                                        |");
		new_line(checks);
		put(checks, "|    Order of:   ");
		put(checks, nameArray(counter));
		put(checks, "                 $ ");
		put(checks, payArray(counter), aft => 2, exp => 0);
		put(checks, "             |");
		new_line(checks);
		put(checks, "|                _________________                  ____________       |");
		new_line(checks);
		put(checks, "|                                                                      |");
		new_line(checks);
		put(checks, "|                                                                      |");
		new_line(checks);
		put(checks, "|                                            Gail Miles                |");
		new_line(checks);
		put(checks, "|______________________________________________________________________|");
		counter := counter + 1;
		new_line(checks);
		
	end loop;

end EmployeeSkittles;


