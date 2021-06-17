eps = LOAD './got_imdb.csv' using PigStorage(',') 
	AS (season:int,episode:int,airDate:chararray,title:chararray,rating:double,counts:int,desc:chararray);
