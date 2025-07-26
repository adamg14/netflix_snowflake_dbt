{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

WITH movie_links AS (
    SELECT
        *
    FROM
        {{ ref('stg_links')}}
)

SELECT *
FROM movie_links

-- update all the ratings that were done after the last update