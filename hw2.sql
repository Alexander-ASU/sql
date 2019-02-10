postgres@alex-VirtualBox:~$ psql -c'CREATE TABLE IF NOT EXISTS keywords3(
movieid int,tags text);'

CREATE TABLE
postgres@alex-VirtualBox:~$ psql -U postgres -c "\\copy keywords3 FROM '/usr/local/share/netology/raw_data/keywords.csv' DELIMITER ',' CSV HEADER"


postgres=# WITH top_rated as (SELECT movieid,AVG(rating) AS avg_rating FROM ratings
GROUP BY movieid HAVING COUNT(userid)>50 ORDER BY movieid ASC, avg_rating DESC
LIMIT 150)
SELECT top_rated.movieid, top_rated.avg_rating,tags INTO top_rated_tags FROM top_rated
JOIN keywords3
ON top_rated.movieid=keywords3.movieid
ORDER BY top_rated.avg_rating DESC
LIMIT 150;

psql -U postgres -c "\copy (SELECT * FROM top_rated_tags LIMIT 150) TO '/usr/local/share/netology/top_rated_tags.csv' WITH CSV HEADER DELIMITER as E'\t';"
