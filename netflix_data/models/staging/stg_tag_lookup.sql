WITH raw_tag_lookup AS (
    SELECT *
    FROM {{
        source('raw_data', 'RAW_TAG_LOOKUP')
    }}
)

SELECT
    tag_id,
    tag_name
FROM raw_tag_lookup