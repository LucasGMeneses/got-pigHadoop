A = LOAD '/user/game.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
B = FOREACH A GENERATE $0, $1, $4;
C = FILTER B BY Rating == 9.9;
STORE C INTO 'File:///home/rafael/Pergunta2.txt';
