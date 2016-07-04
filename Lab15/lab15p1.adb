----------------------------------------------------
--| NAME: Rogger Matamoros / David Richardson
--| DATE: 04/06/11
--| ASSIGNMENT: Lab 15 p1
----------------------------------------------------
with Ada.integer_Text_IO; use Ada.integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure lab15p1 is
        type foo_matrix is array(1..4, 1..4) of integer;
        foo: foo_matrix;
        bar: foo_matrix;
begin
        for row in 1..4 loop
                for column in 1..4 loop
                        get(foo(row, column));
                end loop;
        end loop;
        new_line;
        for row in 1..4 loop
                for column in 1..4 loop
                        put(foo(row, column));
                end loop;
                new_line;
        end loop;
        for column in 1..4 loop
                for row in 1..4 loop
                        get(bar(Row, Column));
                        end loop;
        end loop;
        new_line;
        for column in 1..4 loop
                for row in 1..4 loop
                        put(bar(Row, column));
                        end loop;
                new_line;
        end loop;
end lab15p1;
