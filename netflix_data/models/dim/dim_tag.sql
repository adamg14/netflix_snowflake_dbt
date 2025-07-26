-- get the new key from the fact table
WITH dimension_tag AS (
    SELECT
        *
    FROM {{ ref("stg_tags")}}
),

fact_user AS (
    SELECT
        *
    FROM {{ ref("fct_user")}}
)

SELECT
    -- *** select the new key from the fact table
    fact_user.user_id,
    fact_user.movie_id,
    dimension_tag.tag_name,
    dimension_tag.time_stamp
FROM fact_user
JOIN dimension_tag
ON fact_user.user_id = dimension_tag.user_id
AND fact_user.movie_id = dimension_tag.movie_id