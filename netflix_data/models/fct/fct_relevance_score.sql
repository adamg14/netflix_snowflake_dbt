WITH stg_scores AS (
    SELECT
        *
    FROM {{ ref("stg_scores")}}
)

SELECT *
FROM stg_scores