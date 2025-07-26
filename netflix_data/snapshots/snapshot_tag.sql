{% snapshot snapshot_tag %}

{{
    config(
        target_schema='snapshots',
        unique_key=['user_id', 'movie_id', 'tag'],
        strategy='timestamp',
        updated_at='tag_timestamp',
        invalidate_hard_deletes=True
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id', 'tag'])}} AS unqiue_surrogate_key,
    user_id,
    movie_id,
    tag_name,
    CAST(time_stamp AS TIMESTAMP_NTZ) AS tag_timestamp
FROM {{ ref("stg_tags")}}

{% endsnapshot %}