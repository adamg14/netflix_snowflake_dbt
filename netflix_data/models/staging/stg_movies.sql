
WITH raw_movies AS (
    SELECT *
    FROM {{ source('raw_data', 'RAW_MOVIES')}}
)

SELECT
    movie_id,
    title
FROM raw_movies