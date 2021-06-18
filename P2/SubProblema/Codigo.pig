A = LOAD '/user/game.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
B = FOREACH A GENERATE $0, $4;
C = GROUP B BY season;
D = FOREACH C GENERATE group as season, SUM(B.Rating)/COUNT(B.Rating) as media;
F = ORDER D BY media DESC;
STORE F INTO 'file:///home/rafael/SubProblema' -- MUDAR PARA O SEU SISTEMA