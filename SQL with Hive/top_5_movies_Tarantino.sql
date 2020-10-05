SELECT
        t.tconst,
        t.originaltitle,
        n.primaryname,
        r.averagerating
FROM imdb_title_crew c
JOIN imdb_name_basics n
    ON array_contains(c.director, n.nconst)
JOIN imdb_title_ratings r
    ON c.tconst = r.tconst
JOIN imdb_title_basics t
    ON c.tconst = t.tconst
WHERE n.primaryname LIKE "%uentin%arantino%"
ORDER BY r.averagerating DESC
LIMIT 10;