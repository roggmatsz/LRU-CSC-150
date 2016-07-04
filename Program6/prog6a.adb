--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros
--  *  DATE: 04/28/11
--  *  ASSIGNMENT: Program 6
--  *  ALGORITHM:
--------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with nt_console; use nt_console;
--* - - - Main Function - - - *--
procedure prog6a is
	--convenient declaration for string size
	subtype foostring is string(1..15);
	--type definition for selection variable found in most sub-procedures
	subtype selSub is natural range 1..10;
	type roomRecord is record
		occupied: boolean; --whether or not the room is occupied.
		firstName: foostring; --holds first name of customer
		lastName: foostring; --holds last name of customer
		checkinDate: string(1..5); --date the customer checked in
		stayLength: natural; --amount in days customer will stay
		roomType: character; --kind of room customer will stay in (q, k, or s)
	end record;
	--type definition for hotel array
	type arrayType is array(1..10) of roomRecord;
	--type definition for available/unavailable arrays 
	type availList_a is array(1..10) of integer;
	--type definition for command variable
	subtype commandList is character range 'l'..'q';
	hotel: arrayType; --master array, holder of all things guest
	legit: boolean := false; --used as a flag variable
	action: commandList := 'l'; --stores action wants to take, declared to stave off warnings
	availList: availList_a; --holds list of available/vacant rooms
	unAvailList: availList_a; --holds list of unavailable/occupied rooms
	data: File_Type; --logical name for data.txt
	bill: File_Type; --logical name for bill.txt
	
	--* - - - tab function (for convenience) - - - *--
	procedure tab (n: integer) is
	begin
		for i in 1..n loop
			put(ASCII.HT); --ASCII value for the tab key
		end loop;
	end tab;
	
	--* - - - displays program options on standard out/display - - - *--
	procedure renderOptions (i: integer) is
	begin
		case i is --each number is a different line on-screen
			when 1 =>
				put("Menu:");
				tab(2);
				put("(l) Check In");
			when 2 =>
				put("(m) Check Out");
			when 3 =>
				put("(n) Display Vacancy");
			when 4 =>
				put("(o) Display Ocuppied");
			when 5 =>
				put("(p) Print Bill");
			when 6 =>
				put("(q) Quit");
			when 7 =>
				for j in 1..74 loop --makes a bar 74 characters long
					put('=');
				end loop;
			when others =>
				null;
		end case;
	end renderOptions;
	
	--* - - - displays the entire menu, including options - - - *--
	procedure renderMainMenu is
	begin
		for i in 1..75 loop --displays a bar 75 characters long
			put('=');
		end loop;
		new_line;
		tab(3);
		put("Heart-Break Hotel Main Menu");
		new_line;
		for i in 1..75 loop --displays a bar 75 characters long
			put('=');
		end loop;
		new_line;
		for i in 1..7 loop --displays the borders and tabs according to specifications
			put('=');
			if (i > 1) and (i < 7) then 
				tab(3);
			elsif (i = 1) then
				tab(1);
			end if;
			renderOptions(i); --options begin to be displayed here
			if (i /= 4) and (i /= 6) and (i /= 3) then
				tab(5);
			elsif (i = 4) then
				tab(4);
			elsif (i = 6) then
				tab(5);
			elsif (i = 3) then
				tab(4);
			end if;
			if (i /= 7) then
				put("  =");
			end if;
			new_line;
		end loop;
		new_line;
	end renderMainMenu;

	--* - - - Retrieves previous state from data.txt - - - *--
	procedure fetchData (hotel: in out arrayType; availList: in out availList_a;
						 unAvailList: in out availList_a) is
		middleMan: character; --a variable used to read the data file
		j: natural := 1; --counter
		k : natural := 1; --counter
	begin
		--reads the first line of text, character by character. If it finds a f, it assigns false
		--to the hotel room number that's the same as the character's position in the string.
		--If it finds a t, it assigns false in the same manner.
		for i in 1..10 loop
			get(data, middleMan);
			if (middleMan = 't') then
				hotel(i).occupied := true;
				unAvailList(j) := i;
				j := j + 1;
			elsif (middleMan = 'f') then
				hotel(i).occupied := false;
				availList(k) := i;
				k := k + 1;
			end if;
		end loop;
		j := 1; --used to change the room as the read progresses
		while not End_of_File(data) loop
			get(data, hotel(unAvailList(j)).firstName);
			get(data, hotel(unAvailList(j)).lastName);
			get(data, hotel(unAvailList(j)).checkInDate);
			get(data, hotel(unAvailList(j)).StayLength);
			get(data, middleMan);
			j := j + 1;
		end loop;
	end fetchData;
	
	--* - - - takes in command inputs from user and validates them - - - *--
	procedure commandHandler (action: in out commandList; legit : in out boolean) is
	begin
		put("Command: ");
		begin
			get(action); --exception source
			legit := true; --used to signal its parent function to continue
		exception
			when data_error =>
				new_line;
				put(" Incorrect data type. Must be a single character. Try again.");
				legit := false;
			when constraint_error =>
				put(" Invalid Command. Must be l, m, n, o, p, or q. Try again.");
				legit := false;
				new_line;
		end;
	end commandHandler;
	
	--* - - - used to translate characters into room types. Used in printBill() only
	procedure resolveRoomType (room: character) is
	begin
		case room is
			when 'q' =>
				put("Queen. Cost: $100/night.");
			when 'k' =>
				put("King. Cost: $175/night.");
			when 's' =>
				put("Suite. Cost: $200/night.");
			when others =>
				null;
		end case;
	end resolveRoomType;
	
	--* - - - handles the entire check-in process - - - *--
	procedure checkIn (hotel: in out arrayType; availList: in out availList_a; 
					   unAvailList: in out availList_a) is
		selection: selSub; --stores user input (room number)
		legitA: boolean := false; --flag boolean
		INDENT: constant natural := 3; --used to control the amount of indention 
		--n: integer; riddle me this: why didn't the get_line() work?
		--didn't work = not prompting for any input, skipping itself in other words
	begin
		new_line(1);
		put("Check In");
		new_line;
		for i in 1..15 loop --displays a line 15 characters long
			put('-');
		end loop;
		new_line(2);
		put("Rooms Available:");
		new_line;
		for i in 1..9 loop
			if (availList(i) > 0) then --considers only those entries that aren't 0 aka empty
				if (i rem 2 /= 0) then --even numbers go on the left
					for j in 1..INDENT loop --indents by INDENT (3) spaces
						put(' ');
					end loop;
					put("Room ");
					put(AvailList(i), width => 2);
					put(" - ");
					resolveRoomType(hotel(availList(i)).roomType);
				elsif (i rem 2 = 0) then --and odd numbers go in the right, thus making a table!
					tab(1);
					put("Room ");
					put(AvailList(i), width => 2);
					put(" - ");
					resolveRoomType(hotel(availList(i)).roomType); --determines string et displays it
					new_line;
				end if;
			end if;
		end loop;
		new_line(2);
		loop --goes on until legitA becomes true (once input has been validated)
			exit when legitA = true;
			for j in 1..INDENT loop --indention
				put(' ');
			end loop;
			put("Choose a room number (input must be a NUMBER): ");
			begin
				get(selection);
				legitA := true;
				hotel(selection).occupied := true;
			exception
				when constraint_error =>
					for j in 1..INDENT loop
						put(' ');
					end loop;
					put("Error. Room must be between 1 and 10. Try again.");
					new_line;
				when data_error => --riddle me this: if a character is entered and this is triggered,
					--rather than asking for a new value it enters an infinite loop!
					for j in 1..INDENT loop --indention
						put(' ');
					end loop;
					put("Error. Room must be a number. Try again.");
					new_line;
			end;
		end loop;
		new_line;
		for j in 1..INDENT loop --indention
			put(' ');
		end loop;
		put("Enter customer information:");
		new_line;
		put("   *Directions: When entering names, if the first/last name isn't 15 characters");
		new_line;
		put("    long, add empty spaces to make it so.");
		new_line;
		for i in 1..4 loop --for loop that contains all the different data to be asked for
			tab(1);
			if (i = 1) then
				put("First Name: ");
				get(hotel(selection).firstName);
				--get_line(hotel(selection).firstName, n); --wanted to use this, but didn't work.. =(
			elsif(i = 2) then
				put("Last Name: ");
				get(hotel(selection).lastName);
			elsif(i = 3) then
				put("Check-in Date (mm/dd): ");
				get(hotel(selection).checkInDate);
			elsif(i = 4) then
				put("Length of Stay (in days): ");
				get(hotel(selection).stayLength);
			end if;
		end loop;
		for i in 1..10 loop --checks availList for the room selected. Once it finds it, it removes it
		--(turns it into a 0)
			if (availList(i) = selection) then
				availList(i) := 0;
			end if;
		end loop;
		for i in 1..10 loop --checks for empty (0'ed) cell in unAvailableList, adds room chosen to it
			if (unAvailList(i) = 0) then
				unAvailList(i) := selection;
				exit;
			end if;
		end loop;
	end checkIn;
	
	--* - - - Handles the entire checkOut process - - - *--
	procedure checkOut (hotel: in out arrayType; availList: in out availList_a; 
						unAvailList: in out availList_a) is
		selection: selSub; -- holds the user input (room number)
		legitA: boolean := false; --used as a flag 
		INDENT: constant natural := 3; --indention size constant
		good2Go: boolean := false; --controls program flow (another flag)
	begin
		new_line;
		put("Check Out");
		new_line;
		for i in 1..15 loop --indention
			put('-');
		end loop;
		new_line(2);
		loop --stops when legitA is true (the input has been validated)
			exit when legitA = true;
			for i in 1..INDENT loop --indention
				put(' ');
			end loop;
			put("Enter room number (must be a NUMBER): ");
			begin
				get(selection); --again, if you enter a character, it enters an infinite loop.. Why?
				for i in 1..10 loop --checks to see if the room is indeed occupied or not
					if (selection = availList(i)) then
						for j in 1..INDENT loop
							put(' ');
						end loop;
						put(" Error. Room is not ocuppied. Try again.");
						new_line;
					else --if not, it carries on.
						good2Go := true;
					end if;
				end loop;
				if (good2Go = true) then -- if the previous validation passed, do all of this
					legitA := true; --don't repeat the loop
					hotel(selection).occupied := false; --set room to vacant
					new_line;
					for i in 1..INDENT loop --indention
						put(' ');
					end loop;
					put("Customers from room number ");
					put(selection, width => 2);
					put(" have been successfully checked out.");
					new_line;
					for i in 1..10 loop --look for room number in occupied rooms list, 0 it
						if (unAvailList(i) = selection) then
							unAvailList(i) := 0;
						end if;
						if (availList(i) = 0) then --look for 0'ed cell in vacant rooms list, put
						--room number in it
							availList(i) := selection;
						end if;
					end loop;
				else
					legitA := false; --keep the loop going
				end if;
				exception
					when constraint_error =>
						for j in 1..INDENT loop
							put(' ');
						end loop;
						put(" Error. Room must be between 1 and 10. Try again.");
						new_line;
					when data_error => --still enters into an infinite loop
						for j in 1..INDENT loop --indention
							put(' ');
						end loop;
						put(" Error. Room must be a number. Try again.");
						new_line;
				end;
		end loop;
	end checkOut;
	
	--* - - - displays list of vacant rooms, room kind, and cost into screen - - - *--
	procedure displayVacancy (availList: availList_a) is
		INDENT: constant natural := 3; --indention size constant
	begin
		new_line;
		put("Vacant Rooms");
		new_line;
		for i in 1..15 loop --sets line 15 characters long
			put('-');
		end loop;
		new_line;
		for i in 1..10 loop -- goes throught availableList and displays rooms in two columns
			if (availList(i) > 0) then
				if (i rem 2 /= 0) then --even numbers on the left
					for j in 1..INDENT loop
						put(' ');
					end loop;
					put("Room ");
					put(AvailList(i), width => 2);
					put(" - ");
					resolveRoomType(hotel(availList(i)).roomType); 
				elsif (i rem 2 = 0) then -- and odd numbers on the right!
					tab(1);
					put("Room ");
					put(AvailList(i), width => 2);
					put(" - ");
					resolveRoomType(hotel(availList(i)).roomType);
					new_line;
				end if;
			end if;
		end loop;
		new_line(2);
	end displayVacancy;
	
	--* - - - Displays list of occupied rooms and information about guests on-screen - - - *--
	procedure displayOccupants (hotel: arrayType; unAvailList: availList_a) is
		INDENT: constant natural := 3;  --indention size constant
	begin
		new_line;
		put("List of Current Occupants");
		new_line;
		for i in 1..15 loop --makes a line 15 characters long
			put('-');
		end loop;
		new_line(2);
		for i in 1..10 loop --goes through all occupied rooms, feeds them into hotel db, and displays
		--all available data
			if (unAvailList(i) /= 0) then
				for j in 1..INDENT loop --indention 
					put(' ');
				end loop;
				put("Room ");
				put(unAvailList(i), width => 2);
				put(':');
				new_line;
				for j in 1..(INDENT + 3) loop --indention
					put(' ');
				end loop;
				put("First Name: ");
				put(hotel(unAvailList(i)).firstName);
				new_line;
				for j in 1..(INDENT + 3) loop --indention
					put(' ');
				end loop;
				put("Last Name: ");
				put(hotel(unAvailList(i)).lastName);
				new_line;
				for j in 1..(INDENT + 3) loop --indention
					put(' ');
				end loop;
				put("Check-In Date: ");
				put(hotel(unAvailList(i)).checkInDate);
				new_line;
				for j in 1..(INDENT + 3) loop --indention
					put(' ');
				end loop;
				put("Length of Stay: ");
				put(hotel(unAvailList(i)).stayLength, width => 2);
				new_line;
			end if;
		end loop;
		new_line(2);
	end displayOccupants;
	
	
	--* - - - Generates a "bill" and saves it into a text file called bill.txt - - - *--
	procedure printBill (hotel: arrayType; unAvaiList: availList_a; bill: in out File_Type) is
		selection: selSub; --holds user input (room number)
		fee: natural; --holds fee per night for different types of room types
		total: natural; --once days stayed and fee are multiplied together, result stored here
		legitA: boolean := false; --flag boolean (for data verification)
		INDENT: constant natural := 3; --indentation size constant
		good2Go: boolean; --helps control program flow
	begin
		create(bill, out_file, "bill.txt"); --creates the bill.txt file
		new_line;
		put("Print Bill");
		new_line;
		for i in 1..15 loop --creates line 15 characters long
			put('-');
		end loop;
		new_line(2);
		loop
			exit when legitA = true; --once input has been validated
			for i in 1..INDENT loop --indentation
				put(' ');
			end loop;
			put("Enter room number (must be a NUMBER): ");
			begin
				get(selection); -- character goes in, infinite loop comes out
				for i in 1..10 loop --checks to see if you're not messing with it
					if (selection = availList(i)) then
						for j in 1..INDENT loop
							put(' ');
						end loop;
						put(" Error. Room is not occupied. Try again.");
						new_line;
					else
						good2Go := true; --continues once it verifies the room number's taken
					end if;
				end loop;
			exception
				when constraint_error =>
					for j in 1..INDENT loop
						put(' ');
					end loop;
					put(" Error. Room must be between 1 and 10. Try again.");
					new_line;
				when data_error => --infinite.looop.why?
					for j in 1..INDENT loop
						put(' ');
					end loop;
					put(" Error. Room must be a number. Try again.");
					new_line;
			end;
			if (good2Go = true) then --if room is taken, do all of this
				legitA := true; --don't loop again
				for i in 1..(INDENT + 6) loop --indentation
					put(bill, ' ');
				end loop;
				put(bill, "HEART-BREAK HOTEL - BILL");
				new_line(bill);
				for i in 1..40 loop --makes line 40 characters long
					put(bill, '-');
				end loop;
				new_line(bill, 2);
				put(bill, "Billed to: ");
				put(bill, hotel(selection).firstName);
				new_line(bill);
				for i in 1..(INDENT + 8) loop --indentation
					put(bill, ' ');
				end loop;
				put(bill, hotel(selection).lastName);
				new_line(bill, 2);
				put(bill, "Length of Stay | Room Type | Room Fee | Amount Owed");
				new_line(bill);
				for i in 1..60 loop --indentation
					put(bill, '-');
				end loop;
				new_line(bill);
				put(bill, hotel(selection).stayLength, width => 9);
				case hotel(selection).roomType is --parses the roomType character
					when 'q' =>
						put(bill, "         Queen");
						fee := 100;
					when 'k' =>
						put(bill, "         King");
						fee := 175;
					when 's' =>
						put(bill, "         Suite");
						fee := 200;
					when others =>
						null;
				end case;
				put(bill, "       $");
				put(bill, fee, width => 4);
				total := fee * hotel(selection).stayLength; --calculates the total
				put(bill, "       $");
				put(bill, total, width => 6);
				new_line(2);
				put("   Bill has been printed successfully.");
				new_line(3);
			end if;
		end loop;
		close(bill);
	end printBill;
	
	--* - - - Saves whatever activity went on - - - *--
	procedure saveState (hotel: arrayType; data: in out file_type) is
	begin
		new_line(data);
		for i in 1..10 loop --if the room is taken, it writes a t
			if (hotel(i).occupied = true) then
				put(data, 't');
			elsif (hotel(i).occupied = false) then --else it writes an f 
				put(data, 'f');
			end if;
		end loop;
		new_line(data);
		for i in 1..10 loop --goes through all room entries in hotel db and dumps its contents into 
		--text file
			if (unAvailList(i) > 0) then
				put(data, hotel(unAvailList(i)).firstName);
				new_line(data);
				put(data, hotel(unAvailList(i)).lastName);
				new_line(data);
				put(data, hotel(unAvailList(i)).checkInDate);
				new_line(data);
				put(data, hotel(unAvailList(i)).StayLength, width => 2);
				new_line(data);
				put(data, '-'); --separator in case humans want to look at the code
				new_line(data);
			end if;
		end loop;
	end saveState;
	
begin
	open(data, in_file, "data.txt"); --opens data.txt for reading
	clear_Screen; --starts with a clean slate, er, CLI
	for i in 1..10 loop --zeroes out all avail/unavail cells, declares roomTypes for hotel db
		unAvailList(i) := 0;
		availList(i) := 0;
		case i is
			when 1..4 =>
				hotel(i).roomType := 'q';
			when 5..7 =>
				hotel(i).roomType := 'k';
			when 8..10 =>
				hotel(i).roomType := 's';
			when others =>
				null;
		end case;
	end loop;
	fetchData(hotel, availList, unAvailList); --gets data from data.txt
	loop
		exit when action = 'q'; --quits program when user enters q
		renderMainMenu;
		loop
			exit when legit = true; --stops loop when input has been validated
			commandHandler(action, legit);
		end loop;
		case action is
				when 'l' =>
					checkIn(hotel, availList, unAvailList);
					clear_Screen;
				when 'm' =>
					checkOut(hotel, availList, unAvailList);
					clear_Screen;
				when 'n' =>
					DisplayVacancy(availList);
				when 'o' =>
					DisplayOccupants(hotel, unAvailList);
				when 'p' =>
					PrintBill(hotel, unAvailList, bill);
				when 'q' =>
					null;
				when others =>
					null;
		end case;
		legit := false; --resets the flag, so that input may be taken again
	end loop;
	close(data); --closes data.txt
	create(data, out_File, "data.txt"); --opens data.txt in write mode to save state
	saveState(hotel, data); --actually saves state
	close(data); --closes it again, for funsises
end prog6a; --ta-da!
