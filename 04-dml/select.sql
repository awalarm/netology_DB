-- ЗАДАНИЕ 2
-- 1. Название и продолжительность самого длительного трека
SELECT title, duration 
FROM tracks 
ORDER BY duration DESC 
LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM tracks 
WHERE duration >= '00:03:30';

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM compilations 
WHERE release_year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name 
FROM artists 
WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my»
SELECT title 
FROM tracks 
WHERE LOWER(title) in ('мой', 'my');

-- ЗАДАНИЕ 3
-- 1. Количество исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, 
       TO_CHAR(AVG(EXTRACT(EPOCH FROM t.duration)) * INTERVAL '1 second', 'MI:SS') AS avg_duration
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.title
ORDER BY avg_duration DESC;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name
FROM artists ar
WHERE ar.artist_id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM album_artists aa
    JOIN albums al ON aa.album_id = al.album_id
    WHERE al.release_year = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (Taylor Swift)
SELECT DISTINCT c.title
FROM compilations c
JOIN compilation_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'Taylor Swift';

-- ЗАДАНИЕ 4
-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT a.title AS album_title
FROM albums a
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
JOIN artist_genres ag ON ar.artist_id = ag.artist_id
GROUP BY a.album_id, a.title, ar.artist_id, ar.name
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- 2. Наименования треков, которые не входят в сборники
SELECT t.title
FROM tracks t
LEFT JOIN compilation_tracks ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT ar.name AS artist_name, t.title AS track_title, t.duration
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- 4. Названия альбомов, содержащих наименьшее количество треков
SELECT a.title AS album_title, COUNT(t.track_id) AS track_count
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.title
HAVING COUNT(t.track_id) = (
    SELECT COUNT(t2.track_id)
    FROM albums a2
    JOIN tracks t2 ON a2.album_id = t2.album_id
    GROUP BY a2.album_id
    ORDER BY COUNT(t2.track_id)
    LIMIT 1
);
