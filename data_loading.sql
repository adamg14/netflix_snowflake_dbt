-- creating the tables within the database
CREATE OR REPLACE TABLE raw_movies (
    movie_id INTEGER,
    title STRING,
    genres STRING
);

CREATE OR REPLACE TABLE raw_tags (
    user_id INTEGER,
    movie_id INTEGER,
    "tag" STRING,
    "timestamp" INTEGER
);

CREATE OR REPLACE TABLE raw_ratings (
    user_id INTEGER,
    movie_id INTEGER,
    rating NUMBER,
    "timestamp" INTEGER
);

CREATE OR REPLACE TABLE raw_links (
    movie_id INTEGER,
    imdb_id INTEGER,
    tmdb_id INTEGER
);

CREATE OR REPLACE TABLE raw_scores (
    movie_id INTEGER,
    tag_id INTEGER,
    relevance NUMBER(38, 20)
);

CREATE OR REPLACE TABLE raw_tag_lookup (
    tag_id INTEGER,
    "tag" STRING
);

-- load data into the tables from the amazon s3 bucket
COPY INTO raw_movies
FROM '@NETFLIX_DATA_STAGE/movies.csv'
FILE_FORMAT = (
    TYPE='CSV'
    SKIP_HEADER=1
    FIELD_OPTIONALLY_ENCLOSED_BY='"');

SELECT *
FROM raw_movies
LIMIT 10;

COPY INTO raw_tags
FROM '@NETFLIX_DATA_STAGE/tags.csv'
FILE_FORMAT = (
    TYPE='CSV'
    SKIP_HEADER=1
    FIELD_OPTIONALLY_ENCLOSED_BY='"')
-- this line is handling the errornous rows in the files that occur
ON_ERROR = 'CONTINUE';

-- select statement to check that the data has been correctly loaded
SELECT *
FROM raw_tags
LIMIT 10;

COPY INTO raw_ratings
FROM '@NETFLIX_DATA_STAGE/ratings.csv'
FILE_FORMAT = (
    TYPE='CSV'
    SKIP_HEADER=1
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
)

SELECT *
FROM raw_ratings
LIMIT 10;

COPY INTO raw_links
FROM '@NETFLIX_DATA_STAGE/links.csv'
FILE_FORMAT = (
    TYPE='CSV'
    SKIP_HEADER=1
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
);

SELECT *
FROM raw_links
LIMIT 10;

COPY INTO raw_scores
FROM '@NETFLIX_DATA_STAGE/genome-scores.csv'
FILE_FORMAT = (
    TYPE='CSV'
    SKIP_HEADER=1
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
);

SELECT *
FROM raw_scores
LIMIT 10;

COPY INTO raw_tag_lookup
FROM '@NETFLIX_DATA_STAGE/genome-tags.csv'
FILE_FORMAT = (
    TYPE='CSV'
    SKIP_HEADER=1
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
);

SELECT *
FROM RAW_TAG_LOOKUP
LIMIT 10;