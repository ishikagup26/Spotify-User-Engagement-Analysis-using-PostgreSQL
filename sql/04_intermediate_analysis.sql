-- Average energy by genre

SELECT
    track_genre,
    ROUND(AVG(energy)::numeric, 2) AS avg_energy
FROM spotify
GROUP BY track_genre
ORDER BY avg_energy DESC;

-- Average danceability by genre

SELECT
    track_genre,
    ROUND(AVG(danceability)::numeric, 2) AS avg_danceability
FROM spotify
GROUP BY track_genre
ORDER BY avg_danceability DESC;

-- Longest songs

SELECT
    track_name,
    artists,
    ROUND(duration_ms / 60000.0, 2) AS duration_min
FROM spotify
ORDER BY duration_ms DESC
LIMIT 10;