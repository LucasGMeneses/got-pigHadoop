A = LOAD '/user/game.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
B = FOREACH A GENERATE $0, $1, $4;
D = GROUP B ALL;
E = FOREACH D GENERATE MAX(B.Rating) as rating;
F = FILTER B BY Rating == (float)E.rating;
STORE F INTO 'file:///home/rafael/Download/P2'; --EDITAR ESSE CAMPO PARA O SEU SISTEMA
