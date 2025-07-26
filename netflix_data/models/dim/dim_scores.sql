WITH movie_scores AS (
    SELECT
        *
    FROM
        {{ ref("stg_scores")}}
)

SELECT 
    movie_id,
    tag_id,
    ROUND(relevance, 4) AS relevance
FROM movie_scores
WHERE relevance > 0