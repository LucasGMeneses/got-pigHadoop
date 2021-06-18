eps = LOAD './got_imdb.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
dts = FOREACH eps GENERATE FLATTEN(STRSPLIT($2, ' ', 3)) AS (day:chararray,month:chararray,year:chararray);

months = GROUP dts by month;
result = FOREACH months GENERATE group as month, COUNT(dts) AS count;
D = GROUP result ALL;
E = FOREACH D GENERATE MAX(result.count) as count;
F = FILTER result BY count == E.count;
DUMP F;