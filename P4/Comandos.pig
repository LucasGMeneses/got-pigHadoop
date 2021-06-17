A = LOAD '/user/game.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
B = FOREACH A GENERATE $0, $1;
C = GROUP B BY season;
D = FOREACH C GENERATE group as season, COUNT(B.episode) as episode;
F = ORDER D BY episode ASC;
STORE F INTO 'file:///home/rafael/P4'; --EDITAR ESSE CAMPO PARA O SEU SISTEMA
