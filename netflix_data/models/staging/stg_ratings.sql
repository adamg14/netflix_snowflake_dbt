WITH raw_ratings AS (
    SELECT *
    FROM {{ source('raw_data', 'RAW_RATINGS')}}
)

SELECT
    user_id,
    movie_id,
    rating,
    TO_TIMESTAMP_LTZ(CAST(time_stamp AS NUMBER)) AS time_stamp
FROM raw_ratings