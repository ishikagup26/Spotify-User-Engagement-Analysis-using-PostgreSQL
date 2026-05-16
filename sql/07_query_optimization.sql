-- Create indexes

CREATE INDEX idx_track_name
ON spotify(track_name);

CREATE INDEX idx_genre
ON spotify(track_genre);

CREATE INDEX idx_popularity
ON spotify(popularity);

-- Analyze query performance

EXPLAIN ANALYZE
SELECT *
FROM spotify
WHERE popularity > 90;