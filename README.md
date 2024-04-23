**This repo does a deployment to all 3 databases in the pipeline.**

DEV, TEST, and PROD
It uses Github Actions to deploy utilizing Liquibase Flows

**Environment Variables needed**

**Addtional Environment Variables for Pre-Validate**

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
