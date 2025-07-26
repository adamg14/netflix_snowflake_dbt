WITH ratings AS (
    SELECT
        *
    FROM {{ ref('stg_ratings')}}
),

user_fact_table AS (
    SELECT
        *
    FROM {{ ref('fct_user') }}
)

SELECT
    ratings.*
FROM ratings
JOIN user_fact_table
ON ratings.user_id = user_fact_table.user_id
AND ratings.movie_id = user_fact_table.movie_id