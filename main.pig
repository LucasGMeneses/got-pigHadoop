eps = LOAD './got_imdb.csv' using PigStorage(',') AS (Season:int,Episode:int,AirDate:chararray,Title:chararray,Rating:double,Counts:int);

DUMP eps;