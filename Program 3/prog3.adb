--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros
--  *  DATE: 03/18/11
--  *  ASSIGNMENT: Program 3
--  *  ALGORITHM: The program reads a text file with several entries using a looped sequence,
--     which performs different actions according to the type of transaction found within the 
--     entry. If the transaction amount doesn't fall within the program's constraints, the program
--     displays error messages. While the program parses the text file, it also generates another
--     text file, which tabulates the transactions found in the parsed text file. 
--------------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure prog3 is
	transType: character;                      --type of transaction that took place.
	transAmt: integer;                         --amount of pasta shipped.
	pastaType: integer;                        --type of pasta that was involved in transaction.
	newPastasNum: integer;                     --number of new pastas introduced.
	amt1, amt2, amt3: integer;                 --|
	amt4, amt5, amt6: integer;                 --|pasta of each type available in warehouse.
	amt7, amt8, amt9: integer;                 --|
	numErr: integer;                           --number of errors found
	totalSales: integer;                       --total amount of pasta sold.
	SHIPMENTLIMIT: constant integer := 2001;   --shipping limit + 1 (to avoid using (</>)= )
	WAREHOUSELIMIT: constant integer := 20001; --warehouse limit + 1 (to avoid using (</>)= )
	date: string (1..5);                       --date of transaction
	data: Ada.Text_IO.File_Type;               --interface variable for data.txt
	bizSummary: Ada.Text_IO.File_Type;         --interface variable for bizSummary.txt
	
begin
	--All recurring sum variables are initialized
	amt1 := 0;
	amt2 := 0;
	amt3 := 0;
	amt4 := 0;
	amt5 := 0;
	amt6 := 0;
	amt7 := 0;
	amt8 := 0;
	amt9 := 0; 
	numErr := 0;
	totalSales := 0;
	newPastasNum := 0;
	--External text files are opened to be read and created.
	open(data, mode => in_file, name => "data.txt");
	create(bizSummary, out_file, name => "bizSummary.txt");
	--header for the bizSummary file
	put(bizSummary, "Transaction Date       Transaction Type       Transaction Amount");
	new_line(bizSummary);
	put(bizSummary, "================================================================");
	new_line(bizSummary);
	--main program loop
	loop
		get(data, date);
		if (date = "#    ") then --because it wouldn't stop after reaching EOF, a 5-char long 
			exit;                --sentinel was added to the end of data.txt to get the loop to
		end if;                  --stop.
		--Getting the char twice so that it doesn't pick up the space in-between values.
		get(data, transType);
		get(data, transType);
		--Main case starts here
		case transType is
			when 'I' => --if the transaction was an incoming shipment
				get(data, transAmt);
				get(data, pastaType);
				--a message is displayed on-screen 
				put("Transaction: Incoming Shipment: ");
				put(transAmt, width => 4);
				put("lbs of ");
				put(pastaType, width => 1);
				new_line;
				--error-handling statement. Establishes shipping criteria.
				if (transAmt < SHIPMENTLIMIT) and (transAmt > 1) then 
					--case used to determine which pasta type its dealing with (1-9)
					case pastaType is
						when 1 =>
							--error-handling if statement
							if (amt1 < WAREHOUSELIMIT) and (transAmt + amt1 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt1 := amt1 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line(2);
								numErr := numErr + 1;
							end if;
						when 2 =>
							--error-handling if statement
							if (amt2 < WAREHOUSELIMIT) and (transAmt + amt2 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt2 := amt2 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end	if;
						when 3 =>
							--error-handling if statement
							if (amt3 < WAREHOUSELIMIT) and (transAmt + amt3 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt3 := amt3 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end if;
						when 4 =>
							--error-handling if statement
							if (amt4 < WAREHOUSELIMIT) and (transAmt + amt4 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt4 := amt4 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end	if;
						when 5 =>
							--error-handling if statement
							if (amt5 < WAREHOUSELIMIT) and (transAmt + amt5 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt5 := amt5 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end if;
						when 6 =>
							--error-handling if statement
							if (amt6 < WAREHOUSELIMIT) and (transAmt + amt6 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt6 := amt6 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end if;
						when 7 =>
							--error-handling if statement
							if (amt7 < WAREHOUSELIMIT) and (transAmt + amt7 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt7 := amt7 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end if;
						when 8 =>
							--error-handling if statement
							if (amt8 < WAREHOUSELIMIT) and (transAmt + amt8 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt8 := amt8 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end if;
						when 9 =>
							--error-handling if statement
							if (amt9 < WAREHOUSELIMIT) and (transAmt + amt9 < WAREHOUSELIMIT) then
								--displays entry in bizSummary.txt table
								amt9 := amt9 + transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Incoming Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
							else 
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough room for incoming shipment of ");
								put(pastaType, width => 1);
								put(".");
								new_line;
								numErr := numErr + 1;
							end if;
						when others =>
							--When the pasta type isn't recognized, an error msg. is displayed
							put("Error. Pasta type ");
							put(pastaType, width => 1);
							put(" does not exist.");
							--Error counter increases by 1.
							numErr := numErr + 1;
							new_line;
					end case;
				else
					--if the shipment doesn't fit the criteria, an error msg. is displayed.
					put("Error. The shipment cannot be greater than 2000lbs or less than 2lbs.");
					new_line;
					put("Shipment is ");
					put(transAmt, width => 4);
					put("lbs.");
					--Error counter increases by 1.
					numErr := numErr + 1;
					new_line;
				end if;
			when 'S' => --if transaction was a sale of pasta
				--display message on screen for feedback
				get(data, transAmt);
				get(data, pastaType);
				put("Transaction: ");
				put(transAmt, width => 4);
				put("lbs sold of pasta type ");
				put(pastaType, width => 1);
				put(".");
				new_line;
				--error-handling if. Establishes shipping criteria.
				if (transAmt < SHIPMENTLIMIT) and (transAmt > 1) then
					case pastaType is
						when 1 =>
							--error-handling if statement
							if (amt1 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt1 := amt1 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 2 =>
							--error-handling if statement
							if (amt2 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt2 := amt2 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 3 =>
							--error-handling if statement
							if (amt3 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt3 := amt3 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 4 =>
							--error-handling if statement
							if (amt4 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt4 := amt4 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 5 =>
							--error-handling if statement
							if (amt5 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt5 := amt5 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 6 =>
							--error-handling if statement
							if (amt6 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt6 := amt6 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 7 =>
							--error-handling if statement
							if (amt7 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt7 := amt7 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 8 =>
							--error-handling if statement
							if (amt8 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt8 := amt8 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when 9 =>
							--error-handling if statement
							if (amt9 >= transAmt) then
								--displays entry in bizSummary.txt table
								amt9 := amt9 - transAmt;
								put(bizSummary, "      ");
								put(bizSummary, date);
								put(bizSummary, "            ");
								put(bizSummary, "Outgoing Shipment              ");
								put(bizSummary, transAmt, width => 4);
								put(bizSummary, "       ");
								new_line(bizSummary);
								--changes amount available in warehouse
								totalSales := totalSales + transAmt;
							else
								--error message is displayed and error counter is raised by 1.
								put("Error. There is not enough pasta type ");
								put(pastaType, width => 1);
								put(" in warehouse to fullfill the order.");
								new_line;
								numErr := numErr + 1;
							end if;
						when others =>  
							--should the pasta type not be recognized, error is displayed.
							put("Error. Pasta type ");
							put(pastaType, width => 1);
							put(" does not exist.");
							--Error counter is raised by 1.
							numErr := numErr + 1;
							new_line;
					end case;
				else
					--if the shipment lies outside limits, an error is displayed.
					put("Error. The shipment cannot be greater than 2000lbs or less than 2lbs.");
					new_line;
					put("       Shipment is ");
					put(transAmt, width => 4);
					put("lbs.");
					--error counter is increased by 1.
					numErr := numErr + 1;
					new_line;
				end if;
			when 'N' => --if a new pasta is to be added
				get(data, pastaType);
				if (pastaType > 9) then
					--if more than 9 pastas are added into the program, an error will be displayed.
					put("Error. Pasta type ");
					put(pastaType, width => 1);
					put(" requires a newer version of the software than the one currentl installed.");
					new_line;
					put("Contact your system administrator for additional information.");
					new_line;
					--error counter is raised by 1.
					numErr := numErr + 1;
				else
					--message confirming operation will be displayed.
					put("Pasta type ");
					put(pastaType, width => 1);
					put(" has been successfully added to the system.");
					--number of new pastas counter is increased by 1.
					newPastasNum := newPastasNum + 1;
					new_line;
				end if;
			when others => --if the transaction type isn't recognized, a msg. is displayed.
				put("Error. Unknown transaction type. Transaction read was: ");
				put(transType);
				put(".");
				--error counter is increased by 1.
				numErr := numErr + 1;
				new_line;
		end case;
	end loop;
	--footer of the table
	put(bizSummary, "================================================================");
	new_line(bizSummary, 2);
	put(bizSummary, "Stock Remaining");
	new_line(bizSummary);
	put(bizSummary, "==================");
	new_line(bizSummary);
	put(bizSummary, "Type 1: ");
	put(bizSummary, amt1, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 2: ");
	put(bizSummary, amt2, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 3: ");
	put(bizSummary, amt3, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 4: ");
	put(bizSummary, amt4, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 5: ");
	put(bizSummary, amt5, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 6: ");
	put(bizSummary, amt6, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 7: ");
	put(bizSummary, amt7, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 8: ");
	put(bizSummary, amt8, width => 4);
	new_line(bizSummary);
	put(bizSummary, "Type 9: ");
	put(bizSummary, amt9, width => 4);
	new_line(bizSummary);
	put(bizSummary, "==================");
	new_line(bizSummary, 2);
	--some general statistics
	put(bizSummary, "Total amount of pasta shipped: ");
	put(bizSummary, totalSales, width => 4);
	put(bizSummary, "lbs");
	new_line(bizSummary);
	put(bizSummary, "Number of new pastas introduced: ");
	put(bizSummary, newPastasNum, width => 1);
	new_line(bizSummary);
	put(bizSummary, "Number of errors found: ");
	put(bizSummary, numErr, width => 2);
	new_line(bizSummary);
	close(data);
end prog3;
