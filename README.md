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

## Addtional Environment Variables for Pre-Validate

export ACCT_NAME
export CLONED_URL
export CLONED_UID
export CLONED_PW
export SNOWSQL_PWD
export CLONED_DB
export CLONED_SCHEMA
export LB_ENVIRONMENT
export LIQUIBASE_COMMAND_TAG
export LIQUIBASE_LOG_FORMAT
