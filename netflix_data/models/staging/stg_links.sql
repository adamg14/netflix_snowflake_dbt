WITH raw_links AS (
    SELECT *
    FROM {{ source('raw_data', 'RAW_LINKS')}}
)

SELECT
    movie_id,
    imdb_id,
    tmdb_id
FROM raw_links