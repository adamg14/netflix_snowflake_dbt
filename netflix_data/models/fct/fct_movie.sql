WITH movies AS (
    SELECT *
    FROM {{ ref('stg_movies') }}
)

SELECT
    movie_id,
    INITCAP(TRIM(title)) AS title,
    SPLIT(genres, '|') AS genres
FROM movies