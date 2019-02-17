SELECT 'ФИО: Гурин Александр';
-- Первый запрос (1.1)
postgres=# SELECT* FROM ratings
postgres-# LIMIT 10;
-- Второй запрос (1.2)
postgres=# SELECT * FROM links
WHERE imdbid LIKE '%42' AND (movieid>100 AND movieid<1000)
postgres-# LIMIT 10;
-- Трети запрос (2.1)
postgres=# SELECT imdbid,rating FROM links
INNER JOIN ratings ON links.movieid=ratings.movieid
WHERE rating=5 LIMIT 10;
-- Четверты запрос (3.1)
postgres=# SELECT COUNT(links.movieid) FROM links
LEFT JOIN ratings
ON links.movieid=ratings.movieid
WHERE ratings.movieid IS NULL;
-- Пятый запрос (3.2)
postgres=# SELECT userid,AVG(rating) as avg_rate FROM ratings
GROUP BY userid
HAVING AVG(rating)>3.5 ORDER BY avg_rate DESC
LIMIT 10;
-- Шесто запрос (4.1)
postgres=# SELECT imdbid FROM links
WHERE (SELECT AVG(rating) FROM ratings)>3.5
LIMIT 10;
-- Седьмой запрос (4.2)
WITH ten_table
AS(
SELECT userid,COUNT (rating) as rate FROM ratings
GROUP BY userid
HAVING COUNT(rating)>10)
SELECT AVG(rate) as ratt FROM ten_table;

---------����������� �������----------------------
postgres=# SELECT  imdbid,rat FROM links 

INNER JOIN(SELECT movieid,AVG(rating) AS rat FROM ratings  

GROUP BY movieid 

HAVING AVG(rating)>3.5 

LIMIT 10) AS tabe ON links.movieid=tabe.movieid 

LIMIT 10; 
----------------------------------------------------
 

postgres=# WITH ten_table AS( 

SELECT userid,AVG(rating) as rate_avg,COUNT(rating) as rate_count FROM ratings 

GROUP BY userid 

LIMIT 10) 

postgres-# SELECT userid,rate_avg,rate_count FROM ten_table 

postgres-# WHERE rate_count>10 

postgres-# LIMIT 10; 
