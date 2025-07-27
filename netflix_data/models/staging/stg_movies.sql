WITH raw_movies AS (
    SELECT
        *
    FROM {{ source('raw_data', 'RAW_MOVIES') }}
),

unique_movie_titles AS (
    SELECT DISTINCT movie_id, title
    FROM raw_movies
)

-- removing duplicate movie titles
SELECT
    unique_movie_titles.movie_id AS movie_id,
    unique_movie_titles.title AS title,
    raw_movies.genres AS genres
FROM unique_movie_titles
JOIN NETFLIX_DATA.RAW_MOVIE_DATA.raw_movies raw_movies
ON unique_movie_titles.movie_id = raw_movies.movie_id
