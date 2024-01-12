select title,rating from Genre g join IMDB i on g.movie_id = i.movie_id where g.genre like 'C%'and i.title like '%2014%' and budget > 40000000 limit 10;
