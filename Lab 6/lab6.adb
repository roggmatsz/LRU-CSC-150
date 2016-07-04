--|NAME: Rogger Matamoros / Ben Goldston
--|DATE: 02/08/11
--|ASSIGNMENT: LAB 6

with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with ada.text_IO; use ada.Text_IO;
with ada.float_Text_IO; use ada.Float_Text_IO;
procedure lab6 is
	num, num1, num2, num3, product, sum, item, x, y, z, sales: integer;
	commision: float;
begin
	put("Enter 3 numbers");
	get(num1);
	get(num2);
	get(num3);


	if num1 < 0 then
		product := Num1 * Num2 * num3;
		put("product = ");
		Put(product);
	else 
		Sum := Num1 + num2 + num3;
		put("sum is ");
		put(sum);
	end if;
	
	--part 2a
	get(item);
	if item /= 0 then
		product := product * item;
		put("value of product is ");
	  	put(product);
	else
		put("value of product is ");
	  	put(product);
	end if;
	--part 2b
	if (x - Y) => 0 then
		z := x - y;
	elsif (y - x) >= 0 then
    	z := y - x;
	end if;
	--part 3
	if (sales > 0) and (sales < 1000) then
		commision := 0.00;
	elsif (sales > 1000) and (sales < 10000) then
		commision := 5.00;
	elsif (sales > 10000) and (sales < 50000) then
		commision := 8.00;
	elsif (sales > 50000) and (sales < 100000) then
		commision  := 10.00;
	elsif (sales > 100000) then
		commision := 12.00;
end lab6;
