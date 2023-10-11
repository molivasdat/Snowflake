-- liquibase formatted sql changeLogId:38bc0856-6c2c-4bcb-bf71-2b0fe39c6898

-- Changeset MikeO:createTable-MYTABLE5 context:DEV labels:Feature1
CREATE TABLE MYTABLE5 (C1 STRING, C2 STRING);
--rollback DROP TABLE MYTABLE5;

-- Changeset MikeO:createTable-MYTABLE6 context:PROD labels:Feature2
CREATE TABLE MYTABLE6 (C1 STRING, C2 STRING);
--rollback DROP TABLE MYTABLE6;

-- Changeset liquibase-docs:addColumn-example1 context:DEV labels:Feature3
ALTER TABLE MYTABLE5 ADD address VARCHAR(255);
--rollback ALTER TABLE MYTABLE5 DROP COLUMN address;

-- Changeset liquibase-docs:addColumn-example2 context:DEV labels:Feature1
ALTER TABLE MYTABLE5 ADD "name" VARCHAR(50);
--rollback ALTER TABLE MYTABLE5 DROP COLUMN "name";

-- Changeset liquibase-docs:addColumn-example3 context:DEV labels:Feature1
ALTER TABLE MYTABLE5 ADD age STRING;
--rollback ALTER TABLE MYTABLE5 DROP COLUMN age;

-- Changeset liquibase-docs:insert-example1 context:QA labels:Feature1
INSERT INTO MYTABLE5 (address, C1, C2, age, "name") VALUES ('6080 Tower Bridge Cir.', 'A1', 'A2', 'old', 'Bill');
--rollback DELETE FROM "MYTABLE5" WHERE "C1"='6080 Tower Bridge Cir.';

-- Changeset liquibase-docs:createView-example1 context:DEV labels:Feature1
CREATE VIEW MYVIEW_MYTABLE5 AS SELECT * FROM MYTABLE5;
--rollback DROP VIEW MYVIEW_MYTABLE5;

-- Changeset liquibase-docs:Alter_view-example context:DEV,PROD labels:Feature1
DROP VIEW MYVIEW_MYTABLE5;
--rollback CREATE VIEW MYVIEW_MYTABLE5 AS SELECT * FROM MYTABLE5;

-- Changeset liquibase-docs:renameTable-example context:DEV labels:Feature3
ALTER TABLE IF EXISTS MYTABLE5 RENAME TO CUSTOMER;
--rollback ALTER TABLE IF EXISTS CUSTOMER RENAME TO MYTABLE5;

-- Changeset MikeO:4432535-read_result_set context:DEV labels:Feature1 splitstatements:false
create or replace procedure read_result_set()
  returns float not null
  language javascript
  as     
  $$  
    var my_sql_command = "select * from table1";
    var statement1 = snowflake.createStatement( {sqlText: my_sql_command} );
    var result_set1 = statement1.execute();
    // Loop through the results, processing one row at a time... 
    while (result_set1.next())  {
       var column1 = result_set1.getColumnValue(1);
       var column2 = result_set1.getColumnValue(2);
       // Do something with the retrieved values...
       }
  return 0.0; // Replace with something more useful.
  $$
  ;
--rollback drop procedure read_result_set();

-- Changeset liquibase-docs:createView-example2 context:DEV labels:Feature1
CREATE VIEW MYVIEW_CUSTOMER AS SELECT * FROM CUSTOMER;
--rollback DROP VIEW MYVIEW_CUSTOMER;

-- Changeset liquibase-docs:addPrimaryKey-example context:DEV labels:Feature1
ALTER TABLE CUSTOMER ADD CONSTRAINT pk_person PRIMARY KEY (C1, C2);
--rollback ALTER TABLE CUSTOMER DROP PRIMARY KEY;

-- Changeset MikeO:createTable-MYTABLE55 context:DEV labels:Feature1
CREATE TABLE MYTABLE55 (C1 STRING, C2 STRING);
--rollback DROP TABLE MYTABLE55;

--changeset mikeo:create-pi
create or replace function pi_udf()
  RETURNS FLOAT
  AS '3.141592654::FLOAT'
  ;
--rollback drop function pi_udf();

--changeset mikeo:return-greater splitstatements:false
CREATE OR REPLACE PROCEDURE return_greater(number_1 INTEGER, number_2 INTEGER)
RETURNS INTEGER NOT NULL
LANGUAGE SQL
AS
BEGIN
  IF (number_1 < number_2) THEN
    RETURN number_1;
  ELSE
    RETURN number_2;
  END IF;
END;
--rollback DROP PROCEDURE return_greater(INTEGER, INTEGER)

-- changeset molivas:1697025109356-1 splitStatements:false
CREATE OR REPLACE PROCEDURE "RETURN_GREATER"("NUMBER_1" NUMBER(38,0), "NUMBER_2" NUMBER(38,0))
RETURNS NUMBER(38,0)
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
  IF (number_1 > number_2) THEN
    RETURN number_1;
  ELSE
    RETURN number_2;
    END IF;
END';
--rollback DROP PROCEDURE return_greater(INTEGER, INTEGER)
