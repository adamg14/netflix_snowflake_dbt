WITH movies AS (
    SELECT *
    FROM {{ ref('stg_movies') }}
)

SELECT
    movie_id,
    INITCAP(TRIM(title)) AS title,
    SPLIT(genre, '|') AS genre
FROM movies