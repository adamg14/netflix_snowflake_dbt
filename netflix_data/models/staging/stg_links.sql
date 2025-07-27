WITH raw_links AS (
    SELECT *
    FROM {{ source('raw_data', 'RAW_LINKS')}}
),

unique_movies AS (
    SELECT
        DISTINCT movie_id, imdb_id, tmdb_id
     FROM raw_links
),

ranked_rows AS (
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY tmdb_id ORDER BY movie_id) AS ranking_movies
    FROM unique_movies
)

SELECT
    movie_id,
    imdb_id,
    tmdb_id
FROM ranked_rows
WHERE ranking_movies = 1
AND tmdb_id IS NOT NULL