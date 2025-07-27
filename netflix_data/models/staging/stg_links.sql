WITH raw_links AS (
    SELECT *
    FROM {{ source('raw_data', 'RAW_LINKS')}}
),

unique_movies AS (
    SELECT DISTINCT movie_id,
     imdb_id, tmdb_id
     FROM raw_links
)

SELECT
    movie_id,
    imdb_id,
    tmdb_id
FROM unique_movies