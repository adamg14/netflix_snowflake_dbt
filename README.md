# Movie Review Data Engineering Pipeline
This project extracts raw data (.csv files) from an Amazon S3, using snowflake stage as the connection to the Snowflake database. A staging table is then created using this raw/stage connection.
Data Build Tool is then used to transform the data into a normalised schema.

## Repository Breakdown
- /netflix_data = Data Build Tool (dbt-core) code.
- data_loading.sql = This worksheet creates, loads and tests the raw database tables build using the raw .csv files.
- external_data_stage_creation.sql = This worksheet creates a connection from the Amazon S3 bucket where the raw data is being stored to the database using IAM credentials.
- role_creation_definition = Creates the role to have full access to the Data Warehouse, where the data is housed. It also creates and defines the: a role, user for the role, the data warehouse, the database, the schema and assigns permissions to the role.
