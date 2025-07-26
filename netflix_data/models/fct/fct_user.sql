WITH tag_table AS (
    SELECT 
        user_id,
        movie_id
    FROM {{ ref("stg_tags")}}
),

ratings_table AS (
    SELECT
        user_id,
        movie_id
    FROM {{ ref("stg_ratings") }}
),

movie_user_pairs AS (
    SELECT *
    FROM tag_table
    UNION
    SELECT *
    FROM ratings_table
)
-- get all the distinct pairs of movies and users, create a key pair 
SELECT
    user_id,
    movie_id,
     {{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id']) }} AS user_movie_id
FROM movie_user_pairs