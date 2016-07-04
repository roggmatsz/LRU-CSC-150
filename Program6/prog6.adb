--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros
--  *  DATE: 04/28/11
--  *  ASSIGNMENT: Program 6
--  *  ALGORITHM:
--------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with nt_console; use nt_console;

procedure prog6 is
	subtype actionType is character range 'l'..'q';
	subtype hotelRooms is integer range 1..10;
	type roomRecord is record
		occupied: boolean;
		firstName: string(1..15);
		lastName: string(1..15);
		checkinDate: string(1..5);
		stayLength: natural;
		roomType: string(1..2);
	end record;
	type arrayType is array(1..10) of roomRecord;
	type availList_a is array(1..10) of integer;
	hotel: arrayType;
	legit: boolean := false;
	action: character;
	availList: availList_a;
	data: File_Type;
	
	procedure tab (n: integer) is
	begin
		for i in 1..n loop
			put(ASCII.HT);
		end loop;
	end tab;
		
	procedure renderOptions (i: integer) is
	begin
		case i is
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
				for j in 1..74 loop
					put('=');
				end loop;
			when others =>
				null;
		end case;
	end renderOptions;	
	
	procedure renderMainMenu is
	begin
		for i in 1..75 loop
			put('=');
		end loop;
		new_line;
		tab(3);
		put("Heart-Break Hotel Main Menu");
		new_line;
		for i in 1..75 loop
			put('=');
		end loop;
		new_line;
		for i in 1..7 loop
			put('=');
			if (i > 1) and (i < 7) then 
				tab(3);
			elsif (i = 1) then
				tab(1);
			end if;
			renderOptions(i);
			if (i /= 4) and (i /= 6) and (i /= 3) then
				tab(5);
			elsif (i = 4) then
				tab(4);
			elsif (i = 6) then
				tab(6);
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
	
	procedure commandHandler (action: in out actionType; legit : in out boolean) is
	begin
		put("Command: ");
		begin
			get(action);
			legit := true;
		exception
			when data_error =>
				new_line;
				put(" Incorrect data type. Must be character. Try again.");
				legit := false;
			when constraint_error =>
				put(" Invalid Command. Must be l, m, n, o, p, or q. Try again.");
				legit := false;
				new_line;
		end;
	end commandHandler;
	
	procedure fetchData (hotel: in out arrayType; availList: in out availList_a) is
		middleMan: character;
		j: natural := 1;
	begin
		for i in 1..10 loop
			get(data, middleMan);
			if (middleMan = 't') then
				hotel(i).occupied := true;
				availList(i) := i;
				
			elsif (middleMan = 'f') then
				hotel(i).occupied := false;
				availList(i) := i;
			end if;
		end loop;
		while (middleMan /= '*') loop
			get(data, hotel(availList(j)).firstName);
			put(hotel(availList(j)).firstName);
			new_line;
			get(data, hotel(availList(j)).lastName);
			put(hotel(availList(j)).lastName);
			get(data, hotel(availList(j)).checkInDate);
			new_line;
			put(hotel(availList(j)).checkInDate);
			get(data, hotel(availList(j)).StayLength);
			put(hotel(availList(j)).stayLength);
			new_Line;
			get(data, middleMan);
			j := j + 1;
		end loop;
	end fetchData;
	
	procedure checkIn (hotel: arrayType; availList: availList_a; unAvailList: availList_a) is
		selection: natural;
		legit: boolean := false;
	begin
		new_line(2);
		put("Check In");
		new_line;
		for i in 1..10 loop
			put('-');
		end loop;
		new_line(2);
		put("Rooms Available");
		--display room numbers avail from the hotel array/record and their genre [king, queen, suite]
		--after choosing one, it will display cost and ask for confirmation.
		new_line;
		for i in 1..9 loop
			put("Room: ");
			put(AvailList(i), width => 2);
			tab(2);
			put("Room: ");
			put(AvailList(i + 1);
			new_line;
		loop
			exit when legit = true;
			put("Choose a room number: ");
			new_line;
			for i in 1..10 loop
				put(availList(i), width => 2);
				if (availList(i) > 0 ) and (availList(i) < 5) then
					put("Queen. Cost: $100/night");
				elsif (availList(i) > 4) and (availList(i) < 7) then
					put(" King. Cost: $175/night");
				elsif(availList(i) > 6) and (availList(i) < 11) then
					put(" Suite. Cost: $200/night");
				end if;
				new_line;
			end loop;
			
			begin
				get(selection);
				legit := true;
			exception
				when constraint_error =>
					new_line;
					put("Error. Room must be between 1 and 10. Try again.");
					new_line;
					legit := false;
				when data_error =>
					new_line;
					put("Error. Room must be a number. Try again.");
					new_line;
					legit := false;
			end;
			
		end loop;
		
	end checkIn;
	
begin
	startClean;
	clear_screen;
	open(data, in_file, "data.txt");
	fetchData(hotel, availList);
	loop
		exit when action = 'q';
		renderMainMenu;
		loop
			exit when legit = true;
			commandHandler(action, legit);
		end loop;
		case action is
			when 'l' =>
				checkIn(hotel);
		--	when 'M' =>
		--		checkOut;
		--	when 'N' =>
		--		DisplayVacancy;
		--	when 'O' =>
		--  when 'p' =>
		--		PrintBill;
			when 'q' =>
				null;
			when others =>
				null;
		end case;
	end	loop;
	clear_screen;
end prog6;
