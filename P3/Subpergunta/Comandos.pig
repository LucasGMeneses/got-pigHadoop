A = LOAD '/user/game.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray)

B = FOREACH A GENERATE $0, $1, $5;
C = GROUB B BY season;
D = FOREACH C GENERATE group as season, COUNT(B.episode) as episode, SUM(B.count) as count;
F = ORDER D BY count ASC;
STORE F INTO 'file:///home/rafael/P4' --EDITAR ESSE CAMPO PARA O SEU SISTEMA