A = LOAD '/user/game.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray)
B = FOREACH A GENERATE $0, $1, $5;
C = GROUP B ALL;
D = FOREACH C GENERATE MAX(B.count) as count;
F = FILTER B BY count == (int)D.count;
STORE F INTO 'File:///home/rafael/Pergunta3';