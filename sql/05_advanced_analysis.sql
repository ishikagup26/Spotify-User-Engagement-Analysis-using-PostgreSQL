-- Top 3 songs per genre using window function

WITH ranked_songs AS (
    SELECT
        track_genre,
        track_name,
        popularity,
        DENSE_RANK() OVER(
            PARTITION BY track_genre
            ORDER BY popularity DESC
        ) AS rank
    FROM spotify
)

SELECT *
FROM ranked_songs
WHERE rank <= 3;

-- Energy vs danceability correlation insight

SELECT
    track_name,
    energy,
    danceability
FROM spotify
WHERE energy > 0.8
AND danceability > 0.8;

-- Above average popularity songs

SELECT
    track_name,
    popularity
FROM spotify
WHERE popularity >
(
    SELECT AVG(popularity)
    FROM spotify
)
ORDER BY popularity DESC;