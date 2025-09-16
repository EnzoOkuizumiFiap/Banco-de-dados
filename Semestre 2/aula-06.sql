//Função de linha
//NVL é uma função

//Consulta "errada", aparece null no resultado da tabela
select sal, comm, sal+comm from emp;

//Se o valor for Null, o NVL substitui o valor para o valor que definimos
select sal, NVL(comm, 0), sal+NVL(comm, 0) from emp;

//Também podemos colocar números negativos
select sal, NVL(comm, -100), sal+NVL(comm, -100) from emp;

//Também podemos colocar números e somar
select sal, NVL(comm, 100), sal+NVL(comm, 100) from emp;

//Não podemos colocar texto... Pois ele não converte númerico para texto
select sal, NVL(comm, 'SEM COMISSAO'), sal+NVL(comm, 0) from emp;

//Agora do jeito CORRETO, converter númerico para string -> TO_CHAR(comm)
select sal, NVL(TO_CHAR(comm), 'SEM COMISSAO'), sal+NVL(comm, 0) from emp;




//Deixar tudo com letra minúscula -> LOWER()
select ename, LOWER(ename) from emp;

//Converteu tudo para minúsculo
select LOWER('NOME do funcionário') from dual;

//Converteu tudo para maiúsculo -> UPPER
select UPPER('NOME do funcionário') from dual;

//Converteu tudo para a primeira letra para maiúsculo -> initcap
select initcap('NOME do funcionário') from dual;

//Testando no emp
select initcap(ename), nvl(comm, 0) from emp;

select initcap(ename), nvl(comm, 0) from emp where ename = UPPER('jones');

select initcap(ename), nvl(comm, 0) from emp where LOWER(ename) = UPPER('jones'); //Não funciona... OLHA A LÓGICA





//Tamanho da frase, ele considera os espaços, ENTÃO CUIDADO!
select LENGTH('NOME do funcionário') from dual;

select LENGTH('EnzoOkuizumiMirandadeSouza') from dual;

//Procurar a primeira ocorrência de um espaço em branco -> INSTR
select INSTR('NOME do funcionário', ' ') from dual;

//Procurar a primeira ocorrência de uma palavra -> INSTR
select INSTR('NOME do funcionário', 'funcionário') from dual;

//Retorna um caracteres... -> SUBSTR ('algo', 1, 4)
select SUBSTR('NOME do funcionário', 1, 6) from dual;

select SUBSTR('NOME do funcionário', 5, 8) from dual;

//Ele pega invertido
select SUBSTR('NOME do funcionário', -5, 6) from dual;


//Fazendo malabarismo -> Tentando fazer um email... fazer: NOME.funcionario@email.com
select INSTR('NOME do funcionário', ' ') from dual;

//Pegando o 'nome' do funcionário                          //Retirando o espaço que atrapalhava o ponto
select SUBSTR('NOME do funcionário', 1, INSTR('NOME do funcionário', ' ') - 1) || '.' 
    from dual;





//Exibindo o salário como eu quero -> máscara 
//-> 99G999D99 ele não aparece na tabela
// G é separador de grupo, tipo: 1.000.000, os pontos são eles
select sal, TO_CHAR(SAL, '99G999D99') from emp;

//Colocando zero, porque o chefe é maluco
select sal, TO_CHAR(SAL, '00G999D99') from emp;

select sal, TO_CHAR(SAL, 'L99G990D00') from emp;




//Formatando a data - com AM e PM
select SYSDATE, TO_CHAR(SYSDATE, 'DD/MM/YYYY HH:MI:SSAM') from dual;

//Formatando a data - com 24h
select SYSDATE, TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') from dual;

//Formatando a data padrão americano
select SYSDATE, TO_CHAR(SYSDATE, 'DD/MON/YYYY HH24:MI:SS') from dual;

select SYSDATE, TO_CHAR(SYSDATE, 'DD/MONTH/YYYY HH24:MI:SS') from dual;

select SYSDATE, TO_CHAR(SYSDATE, 'DDSP/MONTH/YYYY HH24:MI:SS') from dual;

//D é número da semana do mês
select SYSDATE, TO_CHAR(SYSDATE, 'D DAY, DDSPTH "DE" MONTH "DE" YYYY HH24:MI:SS') from dual;


select SYSDATE, SYSDATE + 60 from dual;

//Somando meses via ADD_MONTHS
select SYSDATE, ADD_MONTHS(SYSDATE, 6) from dual;

//Somando dias qual dia vai ser a próxima SEGUNDA via NEXT_DAY
select SYSDATE, NEXT_DAY(SYSDATE, 'MONDAY') from dual;

select SYSDATE, NEXT_DAY(ADD_MONTHS(SYSDATE, 3), 'MONDAY') from dual;

//Entre meses...
select SYSDATE, MONTHS_BETWEEN('30-OCT-2006', SYSDATE) from dual;


//Uma dízima, posso truncar: Ele corta
select TRUNC(10/3, 2) from dual;


//Trunc e round
select TRUNC(5678.9765, 2), ROUND(5678.9765, 2) from dual;

select TRUNC(5678.9765, -2), ROUND(5678.9765, -2) from dual;

select ROUND(SYSDATE, 'MONTH') from dual;

select TRUNC(SYSDATE, 'MONTH') from dual;



