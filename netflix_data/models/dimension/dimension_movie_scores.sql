WITH movie_scores AS (
    SELECT
        *
    FROM
        {{ ref("stg_scores")}}
)

SELECT *
FROM movie_scores