WITH movie_links AS (
    SELECT
        *
    FROM
        {{ ref('stg_links')}}
)

SELECT *
FROM movie_links