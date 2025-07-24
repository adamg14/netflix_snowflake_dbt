WITH RAW_TAGS AS (
    SELECT *
    FROM {{ source('raw_data', 'RAW_TAGS')}}
)

SELECT
    movie_id,
    user_id,
    tag_name,
    TO_TIMESTAMP_LTZ(CAST(time_stamp AS NUMBER)) AS time_stamp
FROM RAW_TAGS