## This repo does a deployment to all 3 databases in the pipeline.

DEV, TEST, and PROD
It uses Github Actions to deploy utilizing Liquibase Flows

## Environment Variables needed

LIQUIBASE_PRO_LICENSE_KEY:  `ABCDE...`  
LIQUIBASE_COMMAND_URL: `url to snowflake`  
LIQUIBASE_COMMAND_USERNAME:  `username to connect`  
LIQUIBASE_COMMAND_PASSWORD:  `password to connect`  
LIQUIBASE_COMMAND_CHANGELOG_FILE:  `path_to_changelog`  
LB_GH_TOKEN:  `your Github Token to check files back into the repo like reports or snapshots`  

## Addtional Environment Variables for Pre-Validate with Snowflake

export ACCT_NAME   `The Snowflake account name to use`  
export CLONED_URL   `jdbc url to the cloned database/schema`  
export CLONED_UID  `the userid connecting to the cloned database/schema`  
export CLONED_PW  `the password for connecting to the cloned database/schema`  
export SNOWSQL_PWD  `the password for connecting to the original database\schema with clone permissions`  
export CLONED_DB  `the name of the database to be cloned`  
export CLONED_SCHEMA  `the schema name of the cloned schema`  
export LB_ENVIRONMENT  `the name of the database environment deployment, i.e. DEV, TEST, PROD`  
export LIQUIBASE_COMMAND_TAG  `temporary, the tag to use to be able to rollback changes if needed`  
export LIQUIBASE_LOG_FORMAT  `typically JSON or JSON_PRETTY`  
