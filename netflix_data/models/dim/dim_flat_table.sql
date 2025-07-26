{{ 
    config(
        materialized='ephemeral'
    )
}}

WITH movies AS (
    SELECT *
    FROM {{ ref("fct_movie") }}
),

tags AS (
    SELECT *
    FROM {{ ref("dim_tag")}}
),

scores AS (
    SELECT *
    FROM {{ ref("dim_scores")}}
)

SELECT
    movies.*,
    tags.tag_name,
    scores.relevance
FROM movies
LEFT JOIN tags
ON movies.movie_id = tags.movie_id
LEFT JOIN scores
ON movies.movie_id = scores.movie_id