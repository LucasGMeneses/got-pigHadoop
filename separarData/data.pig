eps = LOAD './got_imdb.csv' using PigStorage(',') 
	AS (season:int,episode:int,airDate:chararray,title:chararray,rating:double,counts:int,desc:chararray);
ep = FOREACH eps GENERATE $0, $1,STRSPLIT($2, ' ', 3),$3, $4, $5;
DUMP ep;
--STORE ep INTO 'out';