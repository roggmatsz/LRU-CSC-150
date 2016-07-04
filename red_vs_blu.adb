WITH Spider;
Procedure Red_Vs_Blu IS
-------------------------------------------------
--|Authors: Brandon Lucaciu, Rogger Matamoros
--|Date: 01/20/11
--|Assignment: Lab 2a
--|Color top two rows red and bottom two rows blue
-------------------------------------------------
	
BEGIN -- Red_Vs_Blue
	
	--Move Spider to top left corner
	Spider.Start;
	Spider.Face(WhichWay => Spider.North);
	LOOP
		If Spider.AtWall Then
			Exit;
		End if;
		Spider.Step;
	END loop;

	Spider.Face(WhichWay => Spider.West);
	loop
		if Spider.AtWall then
			exit;
		end if;
		Spider.Step;
	end loop;

	--Change Spider's color to red and color in top two rows
	Spider.Face(WhichWay => Spider.East);
	Spider.ChangeColor(NewColor => Spider.Red);
	loop
		if Spider.AtWall then
			exit;
		end if;
		Spider.Step;
	end loop;
	Spider.Face(WhichWay => Spider.South);
	Spider.Step;
	Spider.Face(WhichWay => Spider.West);
	loop
		if Spider.AtWall then
			exit;
		end if;
		Spider.Step;
	end loop;

	--Move Spider to Bottom left corner
	Spider.ChangeColor(NewColor => Spider.None);
	Spider.Face(WhichWay => Spider.South);
	loop
		if Spider.AtWall then
			exit;
		end if;
		Spider.Step;
	end loop;
	spider.Face(WhichWay => Spider.East);

	--Change Spider's Color to Blue and paint bottom two rows
	Spider.ChangeColor(NewColor => Spider.Blue);
	loop
		if Spider.AtWall then
			exit;
		end if;
		Spider.Step;
	end loop;
	Spider.Face(WhichWay => Spider.North);
	Spider.Step;
	Spider.Face(WhichWay => Spider.West);
	loop
		if Spider.AtWall then
			exit;
		end if;
		Spider.Step;
	end loop;

	Spider.Quit;

END Red_Vs_Blu;
