//Análise exploratória


select COUNT(*), COUNT(COMM), COUNT(MGR) from emp; //Retorna: 14 linhas dentro do meu conjunto de dados

select COUNT(SAL), MAX(SAL), MIN(SAL) from emp; //Retorna o valor de quantas linhas tem salário e retorna também o salário com valor máximo e mínimo

select COUNT(SAL), MAX(SAL), MIN(SAL), SUM(SAL), ROUND(AVG(SAL), 2) from emp; // Aqui estamos somando os salários e também vendo a média (Com AVG) dos salários



//Calculando desvio padrão

select COUNT(SAL), ROUND(AVG(SAL), 2), ROUND(STDDEV(SAL), 2) from emp; //STDDEV calcula o desvio padrão



//SAL por departamento

select deptno, SUM(sal) from emp GROUP BY deptno ORDER BY deptno; // agrupando e somando sal e depois organizando em deptno


// E adicionando JOB
select deptno, job, COUNT(JOB), SUM(sal) 
    from emp 
    GROUP BY deptno, job 
    ORDER BY deptno;
    
    
    
select deptno, job, SUM(sal) 
    from emp 
    GROUP BY deptno, job 
    ORDER BY deptno;





select deptno, job, JOB, sal,
    round(sal / (select sum(sal) from emp), 2) * 100 || '%' SOMA
    from emp; 



select deptno, job, sum(sal) from emp where deptno <> 10 group by deptno, job order by deptno; //<> é diferente

select deptno, job, sum(sal) from emp where job not in ('PRESIDENT', 'ANALYST') group by deptno, job order by deptno; //Usando not in

//having sum

//Se não tem função de grupo: WHERE (para filtragem de dados) e se tem função de grupo com WHERE: having sum...

select deptno, job, sum(sal) 
    from emp 
    where job not in ('PRESIDENT', 'ANALYST') 
    group by deptno, job
    having sum(sal) < 5000
    order by deptno; //Usando not in e having sum
    
    
//having sum

select deptno, job, sum(sal) 
    from emp
    GROUP BY DEPTNO, job 
    having sum(sal) < (select AVG(sal) from emp)
    order by deptno;
    

//rollup

//Podemos fazer um rollup dos valores (Agrupamentos hierárquicos)
// faz a soma de todos que estão em um gupo DEPTNO 10, 20 e afins, e no final ele exibe null e a soma de todos os sal...
select deptno, job, sum(sal) from emp
    group by rollup(deptno, job) 
    order by deptno;
    


//grouping

//Por exemplo, quando você recebe um 1 em grouping job, é um total de job, já se receber grouping deptno e job (1, 1) significa que recebeu um total geral
select deptno, job,
        grouping(deptno), grouping(job), sum(sal) from emp
    group by rollup(deptno, job) 
    order by deptno;
    
    
    
//Cube
//Depois de exibir / fazer a soma de cada departamento, ele faz a soma de todos os cargos

select deptno, job,
        grouping(deptno), grouping(job), sum(sal) from emp
    group by cube(deptno, job) 
    order by deptno;







//Departament e nome dos funcionarios
//Unindo os dois
//Departamento e nome dos departamentos

//Union ALL junta todos os dados da tabela
select deptno, ENAME from emp
UNION ALL
select deptno, DNAME from DEPT;

//Junta e categoriza os dados e eliminia duplicidade
select deptno, ENAME from emp
UNION
select deptno, DNAME from DEPT;





//UNION ALL
select deptno, ENAME from emp where deptno = 10
UNION ALL
select deptno, ENAME from emp where deptno in(10, 20);

//UNION 
select deptno, ENAME from emp where deptno = 10
UNION 
select deptno, ENAME from emp where deptno in(10, 20);



//INTERSECT -> combina os resultados de duas ou mais consultas SELECT, retornando apenas as linhas que são comuns a todas elas
select deptno, ENAME from emp where deptno = 10
INTERSECT
select deptno, ENAME from emp where deptno in(10, 20);


//MINUS -> Tudo que tem de diferente
select deptno, ENAME from emp where deptno in(10, 20)
MINUS
select deptno, ENAME from emp where deptno = 10;

