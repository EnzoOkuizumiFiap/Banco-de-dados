CREATE TABLE um 

(col1 VARCHAR2 (10) DEFAULT 'Maria',
 col2 NUMBER(5) DEFAULT 10,
 col3 NUMBER(5, 2) DEFAULT 20,
 col4 DATE DEFAULT SYSDATE
 );
 
 INSERT INTO UM VALUES(DEFAULT, DEFAULT, DEFAULT, DEFAULT);
 
 --Seleciona todos os dados da tabela um
 SELECT * FROM um;
 
 desc um;

DROP TABLE um;

SELECT table_name
   FROM user_tables;
   
SELECT owner, table_name
   FROM all_tables;

SELECT * FROM pf0645.queixas;