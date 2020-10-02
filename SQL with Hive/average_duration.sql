SELECT AVG(runtimeminutes)
FROM imdb_title_basics
WHERE originaltitle LIKE '%world%'
  AND runtimeminutes IS NOT NULL;