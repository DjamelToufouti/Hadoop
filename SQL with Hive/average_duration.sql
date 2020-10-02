SELECT A.originaltitle, A.genres, B.averagerating FROM imdb_title_basics A
	JOIN imdb_title_ratings B ON A.tconst = B.tconst
WHERE ARRAY_CONTAINS (A.genres, "Comedy")
ORDER BY A.averagerating DESC
LIMIT 100;