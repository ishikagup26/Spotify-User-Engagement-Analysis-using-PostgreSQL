-- Check null values

SELECT * FROM spotify
WHERE track_id IS NULL;

-- Remove duplicates

DELETE FROM spotify
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM spotify
    GROUP BY track_id
);

-- Check invalid popularity

SELECT *
FROM spotify
WHERE popularity < 0 OR popularity > 100;

-- Convert duration to minutes

SELECT
    track_name,
    ROUND(duration_ms / 60000.0, 2) AS duration_min
FROM spotify;