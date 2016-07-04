------------------------------------------------------------------------------------------------
--| NAME: Rogger Matamoros
--| DATE: 04/23/11
--| ASSIGNMENT: Program 5
--| ALGORITHM: The program generates random numbers which then are translated into card suits
--| and values. Both the user and the dealer keep drawing cards until a)the user stops at his 
--| discretion and when the dealer's score is greater than 16. The scores are then compared 
--| to see which of the two was closest to the number 21 and then a winner is declared based on 
--| the findings.
------------------------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random; 

--main program
procedure Prog5 is
	type CardType is (Clubs, Diamonds, Hearts, Spades); --specifies possible card suits
	subtype cardTypeRange is cardType range Spades..Diamonds; --for for loops use only
	subtype RandRange is Positive range 1..52; --specifies number of cards in a deck
	package Rand_52 is new Ada.Numerics.Discrete_Random (RandRange); -- instantiates rand # gen
	G: Rand_52.Generator; --declares variable used in rand # gen
	WinCount: Integer := 0; --running sum of user victories
	LoseCount: Integer := 0; --running sum of user losses
	DrawCount: Integer := 0; --running sum of ties
	userScore: integer := 0; --running sum of user "hand" value
	dealerScore: integer := 0; --holds sum of dealer "hand" value
	pointVal: integer := 0; --value of card
	score: integer := 0; --holds the rand # generated from generator
	option: Character := 'i'; --holds response to mainscreen prompt
	option2: Character := 'y'; --holds response to keep drawing cards? prompt
	drawPrompt: Character := 'y'; --holds the response to another prompt
	
	--* - - - Used to determine the value of an ace card. - - - *--
	procedure aceHandler(pointVal: in out integer) is
		response: integer; --holds answer to prompt
	begin
		new_line;
		put("Will the ace count as 1 or as 11?");
		get(response);
		pointVal := response;
		new_line(2);
	end aceHandler;

	--* - - - Converts randNum into card value and displays the card. - - - *--
	procedure displayCard (cardVal: integer; pointVal: in out integer) is
		num: integer; --holds the value to be displayed in cards
	begin
		--Depending on the cardVal value, a point value will be obtained and the card rendered.
		--1..13 is Clubs, 14..26 is Diamonds, 27..39 is spades, and 40..52 is hearts.
		case cardVal is
			when 1 =>
				put(" ------------------- ");
				new_line;
				put("| A                 |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|     C L U B S     |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                 A |");
				new_line;
				put(" ------------------- ");
				new_line;
				aceHandler(pointVal);
			when 2..10 =>
				put(" ------------------- ");
				new_line;
				put("| ");
				put(cardVal, width => 1);
				put("                 |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|     C L U B S     |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                 ");
				put(cardVal, width => 1);
				put(" |");
				new_line;
				put(" ------------------- ");
				new_line;
				pointVal := cardVal;
			when 11..13 =>
				case cardVal is
					when 11 =>
						put(" ------------------- ");
						new_line;
						put("| J                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|     C L U B S     |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 J |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when 12 =>
						put(" ------------------- ");
						new_line;
						put("| Q                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|     C L U B S     |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 Q |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when 13 =>
						put(" ------------------- ");
						new_line;
						put("| K                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|     C L U B S     |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 K |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when others =>
						null;
				end case;
			when 14 =>
				put(" ------------------- ");
				new_line;
				put("| A                 |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|  D I A M O N D S  |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                 A |");
				new_line;
				put(" ------------------- ");
				new_line;
				aceHandler(pointVal);
			when 15..23 =>
				num := cardVal - 13;
				put(" ------------------- ");
				new_line;
				put("| ");
				put(num, width => 2);
				put("                |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|  D I A M O N D S  |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                 ");
				put(num, width => 1);
				put(" |");
				new_line;
				put(" ------------------- ");
				new_line;
				pointVal := cardVal - 13;
		when 24..26 =>
			case cardVal is
				when 24 =>
					put(" ------------------- ");
					new_line;
					put("| J                 |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|  D I A M O N D S  |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|                 J |");
					new_line;
					put(" ------------------- ");
					new_line;
					pointVal := 10;
				when 25 =>
					put(" ------------------- ");
					new_line;
					put("| Q                 |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|  D I A M O N D S  |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|                 Q |");
					new_line;
					put(" ------------------- ");
					new_line;
					pointVal := 10;
				when 26 =>
					put(" ------------------- ");
					new_line;
					put("| K                 |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|  D I A M O N D S  |");
					new_line;
					put("|                   |");
					new_line;
					put("|                   |");
					new_line;
					put("|                 K |");
					new_line;
					put(" ------------------- ");
					new_line;
					pointVal := 10;
				when others =>
					null;
				end case;
			when 27 =>
				put(" ------------------- ");
				new_line;
				put("| A                 |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|    H E A R T S    |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                 A |");
				new_line;
				put(" ------------------- ");
				new_line;
				aceHandler(pointVal);
			when 28..36 =>
				num := cardVal - 26;
				put(" ------------------- ");
				new_line;
				put("| ");
				put(num, width => 2);
				put("                |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|    H E A R T S    |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                ");
				put(num, width => 1);
				put(" |");
				new_line;
				put(" ------------------- ");
				new_line;
				pointVal := cardVal - 26;
			when 37..39 =>
				case cardVal is
					when 37 =>
						put(" ------------------- ");
						new_line;
						put("| J                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|    H E A R T S    |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 J |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when 38 =>
						put(" ------------------- ");
						new_line;
						put("| Q                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|    H E A R T S    |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 Q |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when 39 =>
						put(" ------------------- ");
						new_line;
						put("| K                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|    H E A R T S    |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 K |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when others =>
						null;
				end case;
			when 40 =>
				put(" ------------------- ");
				new_line;
				put("| A                 |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|    S P A D E S    |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                 A |");
				new_line;
				put(" ------------------- ");
				new_line;
				aceHandler(pointVal);
			when 41..49 =>
				num := cardVal - 39;
				put(" ------------------- ");
				new_line;
				put("| ");
				put(num, width => 2);
				put("                |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|    S P A D E S    |");
				new_line;
				put("|                   |");
				new_line;
				put("|                   |");
				new_line;
				put("|                 ");
				put(num, width => 1);
				put(" |");
				new_line;
				put(" ------------------- ");
				new_line;
				pointVal := cardVal - 39;
			when 50..52 =>
				case cardVal is
					when 50 =>
						put(" ------------------- ");
						new_line;
						put("| J                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|    S P A D E S    |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 J |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when 51 =>
						put(" ------------------- ");
						new_line;
						put("| Q                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|    S P A D E S    |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 Q |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
						when 52 =>
						put(" ------------------- ");
						new_line;
						put("| K                 |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|    S P A D E S    |");
						new_line;
						put("|                   |");
						new_line;
						put("|                   |");
						new_line;
						put("|                 K |");
						new_line;
						put(" ------------------- ");
						new_line;
						pointVal := 10;
					when others =>
						null;
				end case;
			when others =>
				null;
		end case;
	end displayCard;

	--*  - - - Updates the scores of the user and the dealer. - - - *--
	procedure scoreKeeper (id: Character; score: in out integer; pointVal: in integer) is
	begin
		case id is
			when 'u' =>  --when it is the user's turn
				score := score + pointVal; --card's value is added to score
				--feedback is displayed.
				put("User count updated. Count = ");
				put(score, width => 2);
				new_line(2);
			when 'd' => --when it is the dealer's turn
				score := score + pointVal; --card's value is added to score
				--feedback is displayed.
				put("Dealer count updated. Count = ");
				put(score, width => 2);
				new_line(2);
		when others => --if id is something else for whatever reason, do nothing.
				null;
		end case;
	end scoreKeeper;
	--* - - - Determines who's the winner by comparing the scores of the user and dealer - - - *--
	procedure winDetector (userScore: out integer; dealerScore: out integer; WinCount: in out integer;
							LoseCount: in out integer; DrawCount: in out integer) is
	begin
		userScore := userScore - 21; --the difference is how close score is to 21
		dealerScore := dealerScore - 21; --the difference is how close score is to 21
		--if user score is 21 or greater than dealers but less than 21
		if (userScore = 0) or ((userScore < 0) and (userScore > dealerScore)) or (dealerScore > 0) then
			new_line;
			--feedback message
			put("U S E R  W I N S ! "); 
			new_line(2);
			put("User victories: ");
			--updates user victory count, then displays it
			WinCount := WinCount + 1;
			put(WinCount, width => 2);
			new_line;
			--if dealer score is 21 or greater than users but less than 21
		elsif (dealerScore = 0) or ((dealerScore < 0) and (dealerScore > userScore)) or (userScore > 0) then
			new_line;
			--feedback message
			put("D E A L E R  W I N S ! ");
			new_line(2);
			put("Dealer victories: ");
			--updates user loss count, then displays it
			LoseCount := LoseCount + 1;
			put(LoseCount, width => 3);
			new_line;
			--if scores are equal
		elsif (userScore = dealerScore) then
			new_line;
			--feedback message
			put("U S E R  T I E S  W I T H  D E A L E R");
			new_line(2);
			put("Ties: ");
			--updates tie count, displays it
			DrawCount := DrawCount + 1;
			put(DrawCount, width => 3);
			new_line;
		end if;
	end winDetector;

begin --main program body
	put("_________________________________________");
	new_line;
	put("*        Twenty-One: The Game           *");
	new_line;
	put("-----------------------------------------");
	new_line(3);
	Put("Options:     (s): Start the game");
	new_line;
	put("             (q): Quit game");
	new_line;
	put("Enter option:");
	get(Option);
	case Option is
		when 's' =>
			loop --main loop
				--exit sequence
				if (Option = 'n') then
					exit;
				end if;
				--initialize variables
				userScore := 0;
				dealerScore := 0;
				score := 0;
				--feeback message
				Put("Commencing to deal initial cards.");
				new_line;
				put("User goes first.");
				rand_52.reset(gen => g);
				--2 cards dealt to user
				for i in 1..2 loop
					new_line(2);
					rand_52.reset(gen => g); --"resets" the generator. You'll see it alot.
					score := rand_52.Random(gen => g); --generates a number
					displayCard(score, pointVal); --displays card
					rand_52.reset(gen => g); --"resets" the generator
					--updates user score
					scoreKeeper('u', userScore, pointVal);
					new_line;
				end loop;
				rand_52.reset(gen => g); --"resets" the generator
				new_line;
				--feedback message
				put("Dealer goes next.");
				new_line;
				rand_52.reset(gen => g); --"resets" the generator
				--2 cards are dealt to dealer
				for i in 1..2 loop
					new_line(2);
					rand_52.reset(gen => g); --"resets" the generator
					score := rand_52.Random(gen => g);
					displayCard(score, pointVal);
					rand_52.reset(gen => g); --"resets" the generator
					--updates dealer score
					scoreKeeper('d', dealerScore, pointVal);
					new_line;
				end loop;
				rand_52.reset(gen => g); --"resets" the generator
				new_line;
				--feedback message
				put("User's turn to draw.");
				new_line;
				loop --stops until user says 'n' in prompt
					case drawPrompt is
						when 'y' =>
							rand_52.reset(gen => g); --"resets" the generator
							score := rand_52.Random(gen => g);
							displayCard(score, pointVal);
							rand_52.reset(gen => g); --"resets" the generator
							scoreKeeper('u', userScore, pointVal);
							put("Draw again? (y/n)");
							get(drawPrompt);
						when 'n' =>
							exit;
						when others =>
							null;
					end case;
				end loop;
				new_line(2);
				--feedback message
				put("Dealer's turn to draw.");
				new_line;
				loop --stops when count is greater than 16
					if (dealerScore > 16) then
						exit;
					end if;
					rand_52.reset(gen => g); --"resets" the generator
					score := rand_52.Random(gen => g);
					displayCard(score, pointVal);
					rand_52.reset(gen => g); --"resets" the generator
					--updates dealer score
					scoreKeeper('d', dealerScore, pointVal);
					new_line;
				end loop;
				--feedback message
				put("Determining Winners.");
				new_line(2);
				--determines winner
				winDetector(userScore, dealerScore, WinCount, LoseCount, DrawCount);
				new_line(3);
				--prompt
				put("Would you like to play again? (y/n)");
				get(Option);
				new_line;
			end loop;
		when 'q' => -- ends the program
			null;
		when others => --in case user enters something unrecognized. error message.
			put("Unable to recognize input. Try again.");
	end case;
end Prog5;
				
			

