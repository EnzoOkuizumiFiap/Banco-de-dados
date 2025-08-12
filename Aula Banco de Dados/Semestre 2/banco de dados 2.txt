CREATE TABLE MRENZO (
CODIGO NUMBER(6) PRIMARY KEY,
NOME VARCHAR2(30) NOT NULL,
DTCONT DATE DEFAULT SYSDATE,
SALARIO NUMBER(9, 2)
);

drop table MRENZO purge;

INSERT INTO MRENZO(CODIGO, NOME, DTCONT, SALARIO)
VALUES (2, 'pao', default, 1200);

INSERT INTO MRENZO VALUES (14, 'Maria', default, 9095);

/*INSERT INTO MRENZO VALUES (14, 'João', default);*/ /*Na sintaxe mais simples precisa inserir todos os dados*/

SELECT * FROM MRENZO;


create table seunome1 as select * from MRENZO;

select * from seunome1;

select codigo, nome, salario from seunome1;

select salario as sal from seunome1;

select salario as antigo, salario as novo from seunome1;


create table seunome2 as
select codigo, salario antigo, salario * 1.10 novo from seunome1;

select * from seunome2;

//Se você precisa usar o ALTER TABLE, é porque você provavelmente errou alguma coisa, causando muito trabalho.
alter table seunome2 add (diferenca number(9, 2));

select * from seunome2;

alter table seunome2 modify (diferenca date);

select * from seunome2;

alter table seunome2 add (vaisumir number(9,2));

alter table seunome2 drop column vaisumir;



// O Drop table faz com que a tabela não seja apaga completamente, ela vai pra lixeira
drop table seunome2;



show RECYCLEBIN;


//Para voltar para do momento em que apaguei a tabela
flashback table seunome2 to before drop;


//Para apagar sem ir pra lixeira
drop table seunome2 purge;

//ele limpa a tabela inteira e não preserva os dados
truncate table seunome1;
