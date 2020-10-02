SELECT imdb_title_basics.originaltitle, imdb_title_basics.genres, imdb_title_ratings.averagerating
FROM imdb_title_basics
JOIN imdb_title_ratings
ON imdb_title_basics.tconst = imdb_title_ratings.tconst
WHERE ARRAY_CONTAINS (imdb_title_basics.genres, "Comedy")
ORDER BY imdb_title_ratings.averagerating DESC
LIMIT 100;