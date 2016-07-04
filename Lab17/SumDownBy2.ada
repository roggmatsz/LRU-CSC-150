--Lab 17
--Kelsey Willett
--Rogger Matamoios
with Ada.text_iO;
use Ada.Text_IO;

function sumDownBy2(n:integer) return integer is
	sum: integer := 0;
begin
	for i in 0..n loop
		if (N = 0) then
			return sum;
		else	
			sum:= sum + sumDownBy2(n-2);
		end if;
	end loop;
end sumDownBy2;
