SELECT A.originaltitle, A.genres, B.averagerating FROM imdb_title_basics A
JOIN imdb_title_ratings B ON A.tconst = B.tconst
WHERE NOT ARRAY_CONTAINS (A.genres, "Comedy")
ORDER BY B.averagerating DESC
LIMIT 100;