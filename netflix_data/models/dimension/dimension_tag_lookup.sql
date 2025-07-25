WITH tag_lookup AS (
    SELECT *
    FROM {{ ref('stg_tag_lookup')}}
)

SELECT *
FROM tag_lookup