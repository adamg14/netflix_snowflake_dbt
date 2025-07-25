WITH tag_table AS (
    SELECT 
        user_id,
        movie_id
    FROM {{ ref("stg_tags")}}
)

WITH ratings_table AS (
    SELECT
        user_id,
        movie_id
    FROM {{ ref("staging") }}
)

-- get all the distinct pairs of movies and users, create a key pair 