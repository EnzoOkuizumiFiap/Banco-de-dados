select comm, nvl(comm, 0), sal + comm, sal + nvl(comm, 0) from emp;

select comm, nvl(comm, 'Sem Comissão'), sal + comm, sal + nvl(comm, 0) from emp; //Não funciona 'Sem comissão'

select comm, nvl(to_char(comm)), sal + comm, sal + nvl(comm, 0) from emp; //Funciona COMM



select sysdate, to_char(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') from dual; //Convertendo com máscara

select sysdate - '22/09/2025' from dual; //Não funciona... 

select sysdate - to_date('22/09/2025', 'DD/MM/YYYY') from dual; //Funciona...


select round(sysdate - to_date('22/09/2025', 'DD/MM/YYYY'), 4) from dual; //Funciona... Arredondando

select trunc(sysdate - to_date('22/09/2025', 'DD/MM/YYYY'), 4) from dual; //Funciona... Truncamento





//Convertendo um texto para formato númerico
select 1000 - to_number('1,100.00', '9G999D99') from dual;



//Operador MOD, resto da divisão

select mod(10, 2), mod(9, 2) from dual;

//2024 é um ano bissexto
select mod(2024, 4) from dual;

select mod(1900, 600) from dual;




//Usando DECODE
select ename, sal, job, decode(job, 'CLERK', sal+1.10, 'SALESMAN', (sal+comm)*1.12, sal) from emp;



select ename, sal, 
    decode(trunc(sal/1000),
            0, sal * 0.07,
            1, sal * 0.08,
            2, sal * 0.09,
            3, sal * 0.10,
            4, sal * 0.11,
            5, sal * 0.12,
            sal* 20) IMPOSTO
from emp;

