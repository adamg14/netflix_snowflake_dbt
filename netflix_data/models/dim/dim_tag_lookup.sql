WITH tag_lookup AS (
    SELECT *
    FROM {{ ref('stg_tag_lookup')}}
)

SELECT 
    tag_id,
    TRIM(INITCAP(tag_name)) AS tag_name
FROM tag_lookup