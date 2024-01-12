select i.title,rating from earning e join IMDB i on e.movie_id = i.movie_id where metacritic > 60 and domestic > 100000000 and title like '%(2012)%' 
