-- Best genre for high popularity

SELECT
    track_genre,
    ROUND(AVG(popularity)::numeric,2) AS avg_popularity
FROM spotify
GROUP BY track_genre
ORDER BY avg_popularity DESC;

-- Explicit vs non explicit songs popularity

SELECT
    explicit,
    ROUND(AVG(popularity)::numeric,2) AS avg_popularity
FROM spotify
GROUP BY explicit;

-- Most energetic genres

SELECT
    track_genre,
    ROUND(AVG(energy)::numeric,2) AS avg_energy
FROM spotify
GROUP BY track_genre
ORDER BY avg_energy DESC
LIMIT 10;