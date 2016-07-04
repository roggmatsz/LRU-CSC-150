--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros
--  *  DATE: 04/04/11
--  *  ASSIGNMENT: Program 4
--  *  ALGORITHM: The program reads a series of inputs from a text input file.
--  *  First it reads the date, followed by a transaction code. Depending on the
--  *  code, the program will perform either a sell, accept an incoming shipment,
--  *  it will create a new pasta, or will skip a line if there is no valid code.
--------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

--main program
procedure program4 is
	--  * - - - Global Definitions / Variables - - - *
	MAXPASTAS: constant integer := 30; -- Max Number of Pastas permitted
	SHIPMENTLIMIT: constant integer := 2001; -- Max size of shipments + 1 (to use only < or > )
	WAREHOUSELIMIT: constant integer := 20001; -- Max storage capacity of warehouse + 1 ( ^ )
	subtype transType_Type is integer range 2..SHIPMENTLIMIT; -- Sets limits for shipments
	subtype warehouse_Type is integer range 0..WAREHOUSELIMIT; -- Sets limits for stocks of pasta
	subtype pastaRange_Type is integer range 1..MAXPASTAS; -- Sets limits on number of pastas 
	type pastaRec_Type is record -- defines the record and elements for Pasta Records
		name: string (1..12); -- stores name of pasta. No bigger than 12 chars in length
		stock: warehouse_Type; -- stores the stock of pasta available for a given pasta
	end record;
	type transRec_Record is record --defines the record and elements for transaction records
		date: string (1..5); -- stores dates. No bigger than 5 characters in length
		pastaID: pastaRange_Type; -- stores pasta ID number. Has pastaRange parameters/limits
		transType: character; -- stores the transaction character.
		transAmt: transType_Type; --stores the amount of transactions. Has transType_type limits
	end record;
	type array_arr is array(1..MAXPASTAS) of pastaRec_Type; --defines masterArray type + bounds
	type trans_arr is array(1..100) of transRec_Record; --defines transArray type + bounds
	masterArray: array_arr; -- creates masterArray w/ properties of array_arr + pastaRec_Type
	transArray: trans_arr; -- creates transArray w/ properties of trans_arr + transRec_Record
	numErr: integer; --counts the number of errors found by program
	data: Ada.Text_IO.File_Type; -- establishes logical name for data.txt in-file
	bizSummary: Ada.Text_IO.File_Type; -- establishes logical name for bizSummary.txt out-file
	index: integer; -- counter for entries found
	newPastaCount: integer; -- counts number of new pastas added
	sumSales:integer; -- sum of all sales conducted

	--  * - - -  Sale Function - - - * --
	procedure sale (transArray: in out trans_arr; masterArray: in out array_arr; 
					numErr: in out integer; index: in integer) is
		pastaID:pastaRange_Type; -- intermediary variable for pastaIDs
	begin
		begin -- start of an exception block
			get(data, pastaID); -- gets pastaID. Possible source of exceptions
		exception
			when data_error =>
				-- displays an error message on-screen
				put("Error: pasta ID for entry "); 
				put(index, width => 2);
				put(" could not be parsed. Wrong data type.");
				new_line;
				numErr := numErr + 1; -- adds 1 to error counter
			when constraint_error =>
				-- displays an error message on-screen with useful information
				put("Error: pasta ID for entry ");
				put(index, width => 2);
				put(" cannot be processed by the program. ID is too big.");
				new_line;
				numErr := numErr + 1; -- adds 1 to error counter
		end; --end of exception block
		-- checks if there is no entry on database for ID
		if (masterArray(pastaID).name = "           ") then
			-- Error message on-screen
			put("Error. Pasta does not exist in the system.");
		else
			-- if there is an entry on the database for the specified ID
			transArray(index).pastaID := pastaID;
			begin -- starts an excemption block
			get(data, transArray(index).transAmt); -- gets transaction amount. Source of exceptions
			exception
				when data_error =>
					--display message on-screen
					put("Error: transaction amount for entry ");
					put(index, width => 2);
					put(" could not be parsed. Wrong data type.");
					new_line;
					numErr := numErr + 1; -- adds 1 to error counter
				when constraint_error =>
					-- display error message with useful information
					put("Error: transaction amount for entry ");
					put(index, width => 2);
					put(" could not be processed. ");
					new_line;
					put("   Amount must be greater than 2lb but less than 2000lb.");
					put(" Amount was ");
					put(transArray(index).transAmt, width => 4);
					put("lbs.");
					new_line;
					numErr := numErr + 1; -- adds 1 to error counter
			end; --ends excemption block
			begin -- starts excemption block
				-- adds transaction amount to stock. Can create exceptions due to subtype restrictions
				masterArray(pastaID).stock := masterArray(pastaID).stock - transArray(index).transAmt;
				sumSales := sumSales + transArray(index).transAmt;
				put("Info: entry No. ");
				put(index, width => 2);
				put(" successful.");
				new_line;
			exception
				when constraint_error =>
					put("Error: Sale cannot be completed. Not enough stock of ");
					put(masterArray(pastaID).name);
					put(" exists in warehouse.");
					new_line;
					numErr := numErr + 1;
			end; -- end of excemption block
		end if;
	end sale;
	
	-- * - - - Incoming Shipment Function - - - * --
	procedure incoming (transArray: in out trans_arr; masterArray: in out array_arr; 
						numErr: in out integer; index: in integer) is
		middleMan: integer; -- intermediary variable used to store and validate shipments
	begin
		begin -- starts exception block
			get(data, transArray(index).pastaID); --gets pasta ID. Source of exception
		exception
			when data_error =>
				-- Display on-screen message with useful information
				put("Error: pasta ID for entry ");
				put(index, width => 2);
				put(" could not be parsed. Wrong data type.");
				new_line;
				numErr := numErr + 1;
			when constraint_error =>
				-- Display on-screen message with useful information
				put("Error: pasta ID for entry ");
				put(index, width => 2);
				put(" cannot be processed by the program. ID is too big.");
				new_line;
				numErr := numErr + 1; -- add 1 to error counter
		end;
		-- checks if there name entry on the database for the specified ID is blank
		if (masterArray(transArray(index).pastaID).name = "") then
			put("Error. Pasta does not exist in the system.");
		else --if there is a name on the database for the specified ID
			begin --starts exception block "FOO"
				get(data, middleMan); -- gets transaction amount. Source of exception
				-- checks to see if transaction lies outside specified parameters
				if (middleMan < 2) and (middleMan > SHIPMENTLIMIT) then
					raise constraint_error; -- error will be captured by exception block "FOO"
				else -- transaction lies within specified parameters
					transArray(index).transAmt := middleMan; -- puts transaction in database
					begin --starts exception block "BAR"
					-- adds the transaction into the ID's stock. Source of exception
					masterArray(transArray(index).pastaID).stock :=
					masterArray(transArray(index).pastaID).stock + transArray(index).transAmt;
					-- on-screen feedback message
					put("Info: Entry No. ");
					put(index, width => 2);
					put(" successful.");
					new_line;
					exception
						when constraint_error =>
							--onscreen error message with relevant information
							put("Error: Incoming shipment cannot be processed.");
							new_line;
							put("       Not enough room of");
							put(masterArray(transArray(index).pastaID).name);
							put(" exists in warehouse.");
							new_line;
							numErr := numErr + 1; -- adds 1 to error counter
					end; -- ends exception block "BAR"
				end if;
			exception -- core of exception block "FOO"
				when data_error =>
					-- displays onscreen error message with relevant information
					put("Error: transaction amount for entry ");
					put(index, width => 2);
					put(" could not be parsed. Wrong data type.");
					new_line;
					numErr := numErr + 1; --adds 1 to error counter
				when constraint_error =>
					-- displays onscreen error message with relevant information
					put("Error: Transaction amount for entry ");
					put(index, width => 2);
					put(" could not be processed. ");
					new_line;
					put("       Amount must be greater than 2lb but less than 2000lb.");
					new_line;
					put("       Amount was ");
					put(middleMan, width => 5);
					put("lbs.");
					new_line;
					numErr := numErr + 1; -- adds 1 to error counter
			end; -- ends exception block "FOO"
		end if;
	end incoming;
	
	-- * - - - Create New Pasta Function - - - * --
	procedure newPasta (transArray: in out trans_arr; masterArray: in out array_arr;
						numErr: in out integer; index: in integer; 
						newPastaCount: in out integer) is
	begin
		begin -- begin exception block
			get(data, transArray(index).pastaID); -- gets pasta iD. Source of exception
		exception
			when data_error =>
				-- Displays onscreen error message with relevant information
				put("Error: pasta ID for entry ");
				put(index, width => 2);
				put(" could not be parsed. Wrong data type.");
				new_line;
				numErr := numErr + 1; -- adds 1 to error counter
			when constraint_error =>
				-- displays onscreen error message with relevant information
				put("Error: pasta ID for entry ");
				put(index, width => 2);
				put(" cannot be processed by the program. ID is too big.");
				new_line;
				numErr := numErr + 1; -- adds 1 to error message
		end; -- end of exception block
		-- checks whether there isn't a name entry for the pasta ID
		if (masterArray(transArray(index).pastaID).name = "            ") then
			begin -- begin exception block
				-- gets pasta name, puts it in masterArray. Source of exception
				get(data, masterArray(transArray(index).pastaID).name);
				-- displays feedback message onscreen
				put("Info: Entry No. ");
				put(index, width => 2);
				put(" successful.");
				new_line;
			exception
				when data_error =>
					-- display error message onscreen with relevant information
					put("Error: name of new pasta for entry ");
					put(index, width => 2);
					put(" cannot be parsed. Wrong data type.");
					new_line;
					numErr := numErr + 1; -- adds 1 to error counter
				when constraint_error =>
					-- display error message onscreen with relevant information
					put("Error: name of new pasta for entry ");
					put(index);
					put(" is too big. Setting name field to blank.");
					masterArray(index).name := "            ";
					new_line;
					numErr := numErr + 1; -- add 1 to error count
			end; -- end exception block
		else -- if there is already a name entry in database for pasta ID
			-- display error message with relevant information
			put("Error: Pasta ID ");
			put(transArray(index).pastaID, width => 2);
			put(" already exists.");
			new_line;
			numErr := numErr + 1; -- add 1 to error count
		end if;
		newPastaCount := newPastaCount + 1; --add 1 to new pasta count
	end newPasta;
	
	-- * - - - Create the Report Function - - - * --
	procedure createReport (transArray: in out trans_arr; masterArray: in out array_arr;
							numErr: in integer; newPastaCount: in integer) is
	begin
		-- writes table header to outfile
		put(bizSummary, "Transaction Date   Transaction Type    Pasta Name   Transaction Amount");
		new_line(bizSummary);
		put(bizSummary, "======================================================================");
		new_line(bizSummary);
		-- reads each entry in transSummary and writes it below the table header
		for i in 1..index loop
			put(bizSummary, "     ");
			put(bizSummary, transArray(i).Date);
			put(bizSummary, "                 ");
			put(bizSummary, transArray(i).transType);	
			put(bizSummary, "           ");
			put(bizSummary, masterArray(transArray(i).pastaID).name);
			put(bizSummary, "      ");
			-- this should add additional spaces if transAmount is 0. Doesn't always work for some
			-- reason
			if (transArray(i).transAmt = 0) then
				put(bizSummary, "            ");
			end if;
			put(bizSummary, transArray(i).transAmt);
			new_line(bizSummary);
		end loop;
		put(bizSummary, "======================================================================");
		new_line(bizSummary, 2);
		-- writes Stock remaining table header
		put(bizSummary, "Stock Remaining");
		new_line(bizSummary);
		put(bizSummary, "=====================");
		new_line(bizSummary);
		--writes remaining stocks for each pasta type
		for i in 1..16 loop
			put(bizSummary, masterArray(i).name);
			put(bizSummary, ": ");
			put(bizSummary, masterArray(i).Stock, width => 4);
			put(bizSummary, "lbs");
			new_line(bizSummary);
		end	loop;
		put(bizSummary, "=====================");
		new_line(bizSummary, 2);
		-- Remaining lines write total number of errors and new pastas introduced to report
		put(bizSummary, "Total amount of new pastas introduced: ");
		put(bizSummary, newPastaCount, width => 2);
		new_line(bizSummary);
		put(bizSummary, "Number of Errors found: ");
		put(bizSummary, numErr, width => 2);
		new_line(bizSummary);
	end createReport;
	
begin
	-- initializes count variables and the first 7 pastas with a name
	index := 1;
	numErr := 0;
	newPastaCount := 0;
	masterArray(1).name := "  Fettuccini";
	masterArray(2).name := "   Spaghetti";
	masterArray(3).name := "    Fidelini";
	masterArray(4).name := "     Barbina";
	masterArray(5).name := "    Bucatini";
	masterArray(6).name := "        Pici";
	masterArray(7).name := "     Fusilli";
	--initializes the remaining pastas with spaces
	for i in 8..30 loop
		masterArray(i).name := "            ";
	end loop;
	-- initializes the stock variables
	for i in 1..30 loop
		masterArray(i).stock := 0;
	end loop;
	begin -- starts exception block
		open(data, in_file, name => "data.txt"); -- looks for and opens data.txt. Source of exception
	exception
	when Name_Error =>
		-- Displays onscreen message
		put("data.txt cannot be found.");
		new_line;
		numErr := numErr + 1; -- adds 1 to error count
	end; -- ends exception block
	create(bizSummary, out_file, name => "bizSummary.txt");
	while not end_of_file(data) loop -- keeps reading until end of file is reached
		begin -- starts exception block
		get(data, transArray(index).date); -- reads date. Source of exception	
		exception
			when data_error =>
				-- displays error message onscreen with relevant information
				put("Error: Date on entry ");
				put(index, width => 2);
				put(" could not be parsed.");
				transArray(index).date := "     ";
				numErr := numErr + 1; -- adds 1 to error counter
			when constraint_error =>
				-- displays error message onscreen with relevant information
				put("Error: Constraints have been crossed.");
				new_line;
				put("Index contents: ");
				put(index);
				new_line;
				numErr := numErr + 1; -- adds 1 to error count
		end; --ends exception block
			--"fake gets" a transaction type to skip space between date and character
			get(data, transArray(index).transType); 
		begin -- starts exception block
			-- reads transaction character. Source of exception
			get(data, transArray(index).transType);
		exception
			when data_error =>
				--display error message onscreen with relevant information
				put("Error: Transaction code on entry ");
				put(index, width => 2);
				put(" could not be parsed.");
				-- sets type to blank
				transArray(index).transType := ' ';
				numErr := numErr + 1; -- adds 1 to error count
		end; --ends exception block
		case transArray(index).transType is
			when 'S' => -- Sale
				sale(transArray, masterArray, numErr, index);
			when 'I' => -- Incoming Shipment
				incoming(transArray, masterArray, numErr, index);
			when 'N' => -- New Pasta
				newPasta(transArray, masterArray, numErr, index, newPastaCount);
			when others => -- Transaction type / character is unrecognized
				skip_line(data);
				put("Error: No valid transaction type character found. Skipping entry.");
				new_line;
				put("       Transaction Type found was ");
				put(transArray(index).transType);
				put(".");
				new_line;
				transArray(index).transType := ' ';
				numErr := numErr + 1; -- add 1 to error count
		end case;
		index := index + 1; -- add 1 to index aka number of entries read
	end loop;
	createReport(transArray, masterArray, numErr, newPastaCount);
end program4;
