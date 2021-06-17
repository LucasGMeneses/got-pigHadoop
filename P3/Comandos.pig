  
A = LOAD '/user/game.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray)
B = FOREACH A GENERATE $0, $1, $5;
C = GROUP B ALL;
D = FOREACH C GENERATE COUNT(B.episode);
STORE D INTO 'File:///home/rafael/Pergunta7'; --MUDAR PARA O SEU SISTEMA
