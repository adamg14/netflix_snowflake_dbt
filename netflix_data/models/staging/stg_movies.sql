WITH raw_movies AS (
    SELECT
        *
    FROM {{ source('raw_data', 'RAW_MOVIES') }}
),

split_genres AS (
    SELECT
        movie_id,
        title,
        TRIM(genres) AS genre
    FROM raw_movies,
    LATERAL FLATTEN(INPUT => SPLIT(genres, '|')) AS genre
)

SELECT * FROM split_genres
