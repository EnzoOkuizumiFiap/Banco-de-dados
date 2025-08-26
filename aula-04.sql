Rem  Copyright (c) 2016 by Oracle Corporation
Rem
Rem  You may not use the identified files except in compliance with The MIT
Rem  License (the "License.")
Rem
Rem  You may obtain a copy of the License at
Rem  https://github.com/oracle/Oracle.NET/blob/master/LICENSE
Rem
Rem  Unless required by applicable law or agreed to in writing, software
Rem  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
Rem  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
Rem
Rem  See the License for the specific language governing permissions and
Rem  limitations under the License.
Rem
Rem  NAME
REM    scott.sql
Rem  
Rem  DESCRIPTION
Rem    SCOTT is a database user whose schema is used for Oracle code demonstrations


SET TERMOUT OFF
SET ECHO OFF

rem CONGDON    Invoked in RDBMS at build time.	 29-DEC-1988
rem OATES:     Created: 16-Feb-83

DROP TABLE DEPT;
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
DROP TABLE EMP;
CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
DROP TABLE BONUS;
CREATE TABLE BONUS
	(
	ENAME VARCHAR2(10)	,
	JOB VARCHAR2(9)  ,
	SAL NUMBER,
	COMM NUMBER
	) ;
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
      ( GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER );
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

SET TERMOUT ON
SET ECHO ON




SELECT deptno, loc FROM dept; /*Selecionando 2 colunas especificas da tabela dept*/
SELECT ename, sal, sal+300 FROM emp; /*Selecionando 3 colunas da tabela emp e também somei o sal + 300. <- Isso não muda os valores REAIS da tabela*/
SELECT ename, sal, 12*(sal+100) FROM emp; 

SELECT ename, job, sal, comm FROM emp; /*Valores null - ausência de informação*/

SELECT ename, 12*sal+comm FROM emp WHERE ename='KING';

SELECT ename AS name, sal salary FROM emp;

SELECT ename "Name", sal*12 "Annual Salary" FROM emp; /*Usando apelidos de coluna / Muda de ename para Name e sal*12 para Annual Salary*/



SELECT ename||' '||job AS "Employees" FROM emp; /*Usando operador de concatenação*/

SELECT ename ||' is a '||job AS "Employee Details" FROM emp; /*Concatenando*/



SELECT deptno FROM emp; /*Se observar, tem vários valores duplicados na tabela*/

SELECT DISTINCT deptno FROM emp; /*Para eliminar as palavras duplicadas, use DISTINCT*/

 /*Ele manda a descrição da tabela*/
DESCRIBE dept;


/* Exercícios Banco de dados */
SELECT empno, ename, job, hiredate FROM emp;

SELECT DISTINCT job FROM emp;

SELECT empno "Emp #", ename "Employee", job, hiredate "Hire Date" FROM emp;

SELECT ename ||' '|| job AS "Employee and title" FROM emp;

SELECT empno ||', '|| ename ||', '|| job||', '|| MGR ||', '|| hiredate ||', '|| sal ||', '|| comm ||', '|| deptno  AS "THE_OUTPUT" FROM emp;

