--------------------------------------------------------------------------------
--  *  NAME: Rogger Matamoros
--  *  DATE: 02/15/11
--  *  ASSIGNMENT: Program 2
--  *  ALGORITHM: the program first fetches the necessary data for the top part
--  *  of the statement. Then, using two loops, one as a statement layout instantiator,
--  *  and the other as a transaction tabulator, a statement is generated. 
--------------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure program2 is

	name: string(1 .. 11);             --holds the name of the account holder
	balance: float;                    --holds the balance of the account throughout the algorithm
	transaction: float;                --holds the monetary value of individual credits and debits
	depositSum: float;                 --sum of all the deposits
	withdrawSum: float;                --sum of all the withdrawals
	minBalance: float;                 --holds the minimum balance of an account
	serviceCharge: float;              --holds the total service charge to be deducted
	depositCounter: natural            --counts the # of times a deposit is made per account
	withdrawCounter: natural;          --counts the # of times a withdrawal is made per account
	totalTransactions: natural;        --counts the number of transactions that took place
	transactionID: character;          --stores the type of transaction that took place
	data: Ada.Text_IO.File_Type;       --declares an interface variable for data.txt
	statements: Ada.Text_IO.File_Type; --declares an interface variable for statements.txt
	
begin

	--Variables are initialized and the necessary external files are created/opened.
	depositCounter := 0;
	withdrawCounter := 0;
	withdrawSum := 0.0;
	depositSum := 0.0;
	minBalance := 0.0;
	totalTransactions := 0;
	open(data, Ada.Text_IO.In_File, "data.txt");
	create(statements, out_file, "statements.txt");
	
	loop -- in charge of creating new statement "instances" until it reaches the end of data.txt
		
		if End_of_File(data) then
			exit;
		end if;
		get(data, name);
		get(data, balance);      
		get(data, transactionID);
		new_line(statements);
		--The top part of the statement is created after this line.
		put(statements, "Account Name: ");
		put(statements, name);
		new_line(statements);
		put(statements, "Initial Balance as of 01/01/2011 was $");
		put(statements, balance, aft => 2, exp => 0);
		new_line(statements);
		new_line(statements);
		--The "spreadsheet" layout is created after this line.
		put(statements, "Transaction Type                Credits    Debits     New Balance");
		new_line(statements);
		put(statements, "=======================================================================");
		new_line(statements);

		while (transactionID /= '#') loop --in charge of fetching transactions, display accordingly
			
			--credits are isolated with this if statement. Makes group manipulation easier.
			if (transactionID = 'M') or (transactionID = 'D') or (transactionID = 'A')
			   or (transactionID = 'I') then
			   
			   --These conditionals determine the transaction type based on the transactionID
			   --Spaces are used for formatting.
				if (transactionID = 'M') then
					put(statements, "Deposit By Mail");
					put(statements, "                 ");
				elsif (transactionID = 'D') then
					put(statements, "In-Person Deposit");
					put(statements, "               ");
				elsif (transactionID = 'A') then
					put(statements, "Deposit by Automatic Teller");
					put(statements, "     ");
				elsif (transactionID = 'I') then
					put(statements, "Interest");
					put(statements, "                 ");
				end if;
				--adds 1 to the counter each time the credit/deposit branch is run.
				depositCounter := DepositCounter + 1;
				get(file => data, item => transaction);
				--adds the credit/deposit transaction to a deposit sum.
				depositSum := depositSum + transaction;
				--transaction is factored into the balance.
				balance := balance + transaction;
				--transaction is outputted to statements.txt with necessary formatting.
				put(statements, transaction, fore => 4, aft => 2, exp => 0);
				put(statements, "                ");
				put(statements, balance, fore => 4, aft => 2, exp => 0);
			
			--isolates the debits/withdrawals with this if statement. Easier to manipulate.		
			elsif (transactionID = 'C') or (transactionID = 'S' or (transactionID = 'W') 
				   or transactionID = '$') then
				
				--determines what description to write under transaction type.      
				if (transactionID = 'C') then
					put(statements, "Check");
					put(statements, "                                      ");
				elsif (transactionID = 'S') then
					put(statements, "Service Charge");
					put(statements, "                   ");
				elsif (transactionID = 'W') then
					put(statements, "In-Person Withdrawal");
					put(statements, "                       ");
				elsif (transactionID = '$') then
					put(statements, "Cash from an Automatic Teller");
					put(statements, "             ");
				end if;
				--adds 1 to the counter each time this branch is run.		
				withdrawCounter := withdrawCounter + 1;
				get(file => data, item => transaction);
				--adds debit/withdrawal to a withdrawal sum.
				withdrawSum := withdrawSum + transaction;
				--factors the transaction into the balance.
				balance := balance - transaction;
				--transaction is outputted to statements.txt with necessary formatting.
				put(statements, transaction,fore => 4, aft => 2, exp => 0);
				put(statements, "     ");
				put(statements, balance, fore => 4, aft => 2, exp => 0);
			end if;
			
			--fetches the next transactionID to process.
			get(file => data, item => transactionID);
			new_line(statements);
			--Service Charge Logic starts after this line.
			totalTransactions := DepositCounter + withdrawCounter;
			if (minBalance = 0.0) or (minBalance > balance) then
				minBalance := balance;
			end if;
			if (minBalance >= 200.00) and (minBalance < 300.00) and (totalTransactions > 20) then
				serviceCharge := float(1 * (totalTransactions - 20));
			elsif (minBalance >= 100.00) and (minBalance < 200.00) and (totalTransactions > 10) then
				serviceCharge := float(1 * (totalTransactions - 10));
			elsif (minBalance < 100.00) then
				serviceCharge := float(totalTransactions);
			end if;
			--Service charge logic ends at this line.
			
		end loop;
	
		--Conditional in charge of including the service charge in the transaction tabulation.
		--Does not print anything unless there is actually a service charge.
		if (serviceCharge > 0.0) then
			put(statements, "Service Charge");
			put(statements, "                              ");
			put(statements, serviceCharge, fore => 3, aft => 2, exp => 0);
			put(statements, "     ");
			--Case converts serviceCharge into a float so that it can be subtracted from the 
			--balance.
			balance := balance - float(serviceCharge);
			put(statements, balance, fore => 4, aft => 2, exp => 0);
		end if;
		--additional formatting starts after this line.
		new_line(statements);
		put(statements, "====================================================================");
		new_line(statements);
		new_line(statements);
		--Figures like number of deposits/withdrawals, service charges, and final balance are
		--formatted and displayed after this line.
		put(statements, "There were");
		put(statements, depositCounter, width => 3);
		put(statements, " deposits, totaling $");
		put(statements, depositSum, fore => 4, aft => 2, exp => 0);
		new_line(statements);
		put(statements, "There were");
		put(statements, withdrawCounter, width => 3);
		put(statements, " withdrawals, totaling $");
		put(statements, withdrawSum, fore => 4, aft => 2, exp => 0);
		new_line(statements);
		new_line(statements);
		put(statements, "The service charge is $");
		put(statements, serviceCharge, aft => 2, exp => 0);
		new_line(statements);
		new_line(statements);
		put(statements, "The final balance as of 01/31/11 is $");
		put(statements, balance, aft => 2, exp => 0);
		new_line(statements);
		new_line(statements);
	end loop;
	put("Successfully generated bank statements!");
	new_line;
	new_line;
end program2;
