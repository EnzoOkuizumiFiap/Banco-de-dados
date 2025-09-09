SELECT ENAME, JOB, SAL FROM EMP WHERE JOB = 'CLERK'; //Listando quem tem cargo de CLERK

SELECT ENAME, JOB, SAL FROM EMP WHERE sal = 3000; //Listando quem tem SALARIO de 3000

SELECT ENAME, JOB, SAL, SAL+100 FROM EMP WHERE sal+100 = 3100; //Listando quem tem SALARIO de 3100

SELECT ENAME, JOB, SAL FROM EMP WHERE sal >= 3000; //Listando quem tem SALARIO maior ou igual a 3000

SELECT ENAME, JOB, SAL FROM EMP WHERE sal <> 3000; //Listando quem tem SALARIO diferente de 3000

SELECT ENAME, JOB, SAL, COMM FROM EMP WHERE sal < COMM; //Listando quem tem SALARIO < COMISSAO

SELECT ENAME, JOB, SAL, COMM FROM EMP WHERE sal < &SALARIO; //Usando VARIÁVEL DE SUBSTITUIÇÃO: SALARIO < &SALARIO

SELECT ENAME, JOB, SAL, COMM FROM EMP WHERE sal &SALARIO; //Usando VARIÁVEL DE SUBSTITUIÇÃO &SALARIO //use assim: >=3000

SELECT ENAME, JOB, SAL, COMM FROM EMP WHERE &COMPARA; //Usando VARIÁVEL DE SUBSTITUIÇÃO &COMPARA //use assim: JOB = 'CLERK'



SELECT &CAMPOS FROM EMP WHERE &COMPARA; //Usando VARIÁVEL DE SUBSTITUIÇÃO &COMPARA //use assim: No &campos: ENAME, JOB / No &compara: ENAME='SMITH'



SELECT ENAME, JOB, SAL FROM EMP WHERE SAL IN (3000, 800, 5000, 1234); //Usando o IN para pesquisar dentro da tabela

SELECT ENAME, JOB, SAL FROM EMP WHERE SAL NOT IN (1234, 5000, 800, 3000); //Usando o NOT IN para pesquisar os que não estão nessa faixa



SELECT ENAME, JOB, SAL FROM EMP WHERE SAL BETWEEN 2500 AND 6000; //Usando o BETWEEN para pesquisar ENTRE intervalos

SELECT ENAME, JOB, SAL FROM EMP WHERE SAL NOT BETWEEN 2500 AND 6000; //Usando o NOT BETWEEN para pesquisar ENTRE intervalos que não estão nessa faixa



SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE 'A%'; //Operador LIKE para trabalhar com textos... A% o % para completar o resto do texto... Faz o mesmo com IN

SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE 'a%'; //O LIKE é case sensitive

SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE '%LL%'; //Trazer todos os LLs de ENAME que tem na tabela 

SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE '%A%'; //Trazer todos os As de ENAME que tem na tabela 

SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE '%A%A%'; //Trazer todos os A e outro A de ENAME que tem na tabela 

SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE '%L%L%' or JOB = 'ANALYST' or SAL IN (5000, 800); //Trazer todos os L e outro L de ENAME que tem na tabela OU JOB de ANALYST OU SALARIO de 5000 ou 800

SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE '%L%L%' and JOB = 'ANALYST' or SAL IN (5000, 800);

SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE '%L%L%' or JOB = 'ANALYST' and SAL IN (5000, 800);



SELECT ENAME, JOB, SAL, COMM FROM EMP WHERE COMM = 300;

SELECT ENAME, JOB, SAL, COMM FROM EMP WHERE COMM IS NULL; //Comparar é IS, precisa ver se o valor é NULL

SELECT ENAME, JOB, SAL, COMM FROM EMP WHERE COMM IS NOT NULL; //Usando IS NOT



SELECT ENAME, JOB, SAL, COMM FROM EMP ORDER BY JOB, ENAME; // ORDER BY - ORDENAR POR 

SELECT ENAME, JOB, SAL, COMM FROM EMP ORDER BY JOB DESC, ENAME DESC; // ORDER BY - ORDENAR POR e DESC - descrescente

SELECT ENAME, JOB, SAL, COMM FROM EMP ORDER BY JOB DESC, ENAME ASC; //asc é o padrão... do menor para o maior



// ====================================================================================
//Exercícios

SELECT * FROM EMP;

SELECT ENAME, SAL FROM EMP where sal > 2850;

SELECT ENAME, SAL FROM EMP where sal > 2850;

SELECT ENAME, DEPTNO FROM EMP where empno = 7566;

SELECT ENAME, JOB, SAL FROM EMP WHERE SAL NOT BETWEEN 1500 AND 2850;

SELECT ENAME, JOB, HIREDATE FROM EMP WHERE hiredate BETWEEN '20-FEB-81' and '01-MAY-81' ORDER BY hiredate;

SELECT ENAME, DEPTNO FROM EMP where DEPTNO BETWEEN 10 and 30 order by ename;

SELECT ENAME "employee", sal "monthly salary" FROM EMP where sal > 1500 and  deptno in (10, 30);

SELECT ENAME, HIREDATE FROM EMP WHERE hiredate LIKE '%82';

SELECT ENAME, JOB FROM EMP WHERE MGR IS NULL;

//Falta alguns exercícios