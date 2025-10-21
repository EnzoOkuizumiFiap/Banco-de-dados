//Como juntar duas tabelas

SELECT * from dept;
select * from emp;

select ENAME, DNAME from EMP, DEPT; //Jeito antigo de juntar duas tabelas

select ENAME, DNAME from EMP, DEPT where EMP.DEPTNO = DEPT.DEPTNO; //Sintaxe antiga para juntar duas tabelas


//Sintaxe nova
select ename, dname from emp JOIN DEPT ON (EMP.DEPTNO = DEPT.DEPTNO); //Sintaxe nova para juntar duas tabelas

//só colocar e ou d quando tiver ambiguidade nas tabelas...
select ename, dname, emp.deptno, dept.deptno from emp JOIN DEPT ON (EMP.DEPTNO = DEPT.DEPTNO);//Acrescentando coluna deptno e colocando que é da EMP

select ename, dname, e.deptno, d.deptno from emp E INNER JOIN DEPT D ON (e.DEPTNO = d.DEPTNO); //colocando apelidos nas tabelas... emp vai ser 'E' e dept 'D'. E também alguns banco de dados só permite se você escrever com INNER JOIN


select e.ename, e.sal, d.dname, e.deptno, d.deptno from emp E INNER JOIN DEPT D ON (e.DEPTNO = d.DEPTNO) where sal >= 1300 AND e.deptno in (10, 30) AND dname like '%A%' ORDER BY SAL; //Geralmente o chatgpt coloca e.name, e.sal... Mas não precisa


//outro cara caso não tenha um dado em uma tabela
select e.ename, e.sal, d.dname, e.deptno, d.deptno from emp E RIGHT OUTER JOIN DEPT D ON (e.DEPTNO = d.DEPTNO) ORDER BY SAL; //Usando RIGHT OUTER JOIN

INSERT INTO EMP (EMPNO, ENAME, SAL) values(1000, 'teste', 6000);

//Tentando pegar os dados das pessoas que não tem departamento - jeito burro
select e.ename, e.sal, d.dname, e.deptno, d.deptno from dept D RIGHT OUTER JOIN emp e ON (e.DEPTNO = d.DEPTNO) ORDER BY SAL; //Usando RIGHT OUTER JOIN

//Tentando pegar os dados das pessoas que não tem departamento - jeito inteligente
select e.ename, e.sal, d.dname, e.deptno, d.deptno from emp E LEFT OUTER JOIN DEPT D ON (e.DEPTNO = d.DEPTNO) ORDER BY SAL; //Usando LEFT OUTER JOIN


//Mostra os funcionários que não tem departamento e departamento que não tem funcionários
select e.ename, e.sal, d.dname, e.deptno, d.deptno from emp E FULL OUTER JOIN DEPT D ON (e.DEPTNO = d.DEPTNO) ORDER BY SAL; //Usando FULL OUTER JOIN


//produto cartesiano
select ename, dname from emp, dept; //Antigo

select ename, dname from emp cross join dept; //Novo -> cross join



select * from salgrade;

select grade, ename from emp, salgrade where sal between losal and hisal;

select ename, sal, C.deptno, media from emp, (select deptno, ROUND(AVG(sal), 2) MEDIA from emp GROUP BY deptno) C where emp.deptno = c.deptno;

