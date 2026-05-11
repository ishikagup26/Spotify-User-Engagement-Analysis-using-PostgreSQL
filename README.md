Spotify Advanced SQL Project
Project Category: Advanced Click Here to get Dataset

Spotify Logo

Overview
This project involves analyzing a Spotify dataset with various attributes about tracks, albums, and artists using SQL. It covers an end-to-end process of normalizing a denormalized dataset, performing SQL queries of varying complexity (easy, medium, and advanced), and optimizing query performance. The primary goals of the project are to practice advanced SQL skills and generate valuable insights from the dataset.

-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
Project Steps
1. Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:

Artist: The performer of the track.
Track: The name of the song.
Album: The album to which the track belongs.
Album_type: The type of album (e.g., single or album).
Various metrics such as danceability, energy, loudness, tempo, and more.
2. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into easy, medium, and advanced levels to help progressively develop SQL proficiency.

Easy Queries
Simple data retrieval, filtering, and basic aggregations.
Medium Queries
More complex queries involving grouping, aggregation functions, and joins.
Advanced Queries
Nested subqueries, window functions, CTEs, and performance optimization.
14 Practice Questions
Easy Level
Retrieve the names of all tracks that have more than 1 billion streams.
SELECT * FROM spotify
WHERE stream>1000000000;
List all albums along with their respective artists.
SELECT DISTINCT album,artist FROM spotify
ORDER BY 1;
Get the total number of comments for tracks where licensed = TRUE.
SELECT SUM(comments) AS total_comments  FROM spotify
WHERE licensed ='true';
Find all tracks that belong to the album type single.
SELECT track FROM spotify 
WHERE album_type LIKE 'single';
Count the total number of tracks by each artist.
SELECT artist,COUNT(*) AS total_no_songs FROM  spotify
GROUP BY artist
ORDER BY total_no_songs DESC;
Medium Level
Calculate the average danceability of tracks in each album.
SELECT album,AVG(danceability) as Average_Danceability FROM spotify
GROUP BY album
ORDER BY Average_Danceability DESC;
Find the top 5 tracks with the highest energy values.
SELECT track,MAX(energy) as maximum_energy FROM spotify
GROUP BY track
ORDER BY maximum_energy DESC
LIMIT 5;
List all tracks along with their views and likes where official_video = TRUE
SELECT track,SUM(views) AS total_views ,SUM(likes) AS total_likes  FROM spotify
WHERE official_video = 'true'
GROUP BY track
ORDER BY total_views DESC , total_likes DESC;
For each album, calculate the total views of all associated tracks.
SELECT album,track,SUM(views) as total_views FROM spotify
GROUP BY album,track
ORDER BY total_views DESC;
Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT * FROM 
(SELECT track,
COALESCE(SUM(CASE WHEN most_played_on ='Youtube' THEN stream END),0) as streamed_on_Youtube,
COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END),0) as streamed_on_spotify
FROM spotify
GROUP BY track
) temp
WHERE streamed_on_spotify>streamed_on_youtube
AND streamed_on_youtube <>0 ;
Advanced Level
Find the top 3 most-viewed tracks for each artist using window functions.
WITH ranking_artist
AS
( SELECT artist,track,SUM(views) AS total_views,
DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM(views) DESC ) AS rank
FROM spotify
GROUP BY artist,track
ORDER BY artist,total_views DESC
)
SELECT * FROM ranking_artist
WHERE rank<=3;
Write a query to find tracks where the liveness score is above the average.
SELECT track,artist,liveness  FROM spotify
WHERE liveness > (
SELECT AVG(liveness) FROM spotify
)
ORDER BY liveness DESC;
Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
WITH cte
AS
(SELECT 
	album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energery
FROM spotify
GROUP BY 1
)
SELECT 
	album,
	highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY 2 DESC
Find tracks where the energy-to-liveness ratio is greater than 1.2.
SELECT track,energy/liveness AS ratio FROM spotify
WHERE energy/liveness >1.2
ORDER BY ratio ASC;
Technology Stack
Database: PostgreSQL
SQL Queries: DDL, DML, Aggregations, Joins, Subqueries, Window Functions
Tools: pgAdmin 4 (or any SQL editor), PostgreSQL (via Homebrew, Docker, or direct installation)
How to Run the Project
Install PostgreSQL and pgAdmin (if not already installed).
Set up the database schema and tables using the provided normalization structure.
Insert the sample data into the respective tables.
Execute SQL queries to solve the listed problems.
Explore query optimization techniques for large datasets.
Next Steps
Visualize the Data: Use a data visualization tool like Tableau or Power BI to create dashboards based on the query results.
Expand Dataset: Add more rows to the dataset for broader analysis and scalability testing.
Advanced Querying: Dive deeper into query optimization and explore the performance of SQL queries on larger datasets.
