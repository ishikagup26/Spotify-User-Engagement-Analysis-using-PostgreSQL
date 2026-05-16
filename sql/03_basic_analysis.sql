-- Total tracks

SELECT COUNT(*) AS total_tracks
FROM spotify;

-- Top 10 popular songs

SELECT track_name, popularity
FROM spotify
ORDER BY popularity DESC
LIMIT 10;

-- Unique genres

SELECT DISTINCT track_genre
FROM spotify;

-- Tracks per genre

SELECT track_genre, COUNT(*) AS total_tracks
FROM spotify
GROUP BY track_genre
ORDER BY total_tracks DESC;