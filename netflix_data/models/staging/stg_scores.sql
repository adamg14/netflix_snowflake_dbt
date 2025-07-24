WITH raw_scores AS (
    SELECT *
    FROM {{ source('raw_data', 'RAW_SCORES')}}
)

SELECT
    movie_id,
    tag_id,
    relevance
FROM raw_scores