CREATE TABLE AULA3 
(CODIGO NUMBER(6) primary key,
 NOME VARCHAR2(30) NOT NULL,
 HOJE DATE DEFAULT SYSDATE,
 VALOR NUMBER(9, 2));
 
INSERT INTO aula3 (CODIGO, NOME, HOJE, VALOR) VALUES(1, 'Ana', DEFAULT, 8000.80); //Inserindo dados na tabela
INSERT INTO aula3 (CODIGO, NOME, HOJE, VALOR) VALUES(6, 'Ana', DEFAULT, 8000.80); //Inserindo dados na tabela Ana 6
INSERT INTO aula3 (CODIGO, NOME, HOJE, VALOR) VALUES(7, 'Ana', DEFAULT, 8000.80); //Inserindo dados na tabela Ana 7


INSERT INTO aula3 (CODIGO, NOME, HOJE, VALOR) VALUES(2, 'Bia', DEFAULT, 7000.70); //Inserindo dados na tabela

INSERT INTO aula3 (CODIGO, NOME, HOJE, VALOR) VALUES(3, 'Cida', DEFAULT, 6000.60); //Inserindo dados na tabela

INSERT INTO aula3 (CODIGO, NOME, HOJE, VALOR) VALUES(4, 'João', DEFAULT, 1000.10); //Inserindo dados na tabela

INSERT INTO aula3 (CODIGO, NOME, HOJE, VALOR) VALUES(5, 'Pafúncia', DEFAULT, 2000.20); //Inserindo dados na tabela

DELETE AULA3;
 
SELECT * FROM AULA3; //Rodando a tabela

//Fazendo um checkpoint no sql
savepoint A;

savepoint B;

//Me arrependi do insert... Para desfazer (rollback): ele desfaz até o último commit
rollback; //Também podemos desfazer o delete, fazendo o rollback

//Ao invés de rollback, vamos fazer ele voltar para um savepoint
rollback to savepoint A; //Perdemos o savepoint A, ele também apaga o savepoint

//sela o acordo dos nossos insert... E depois não conseguimos desfazer as operações. Salva tudo
commit;

//fazendo update da tabela.. Alterando todos os nomes da tabela para Hemengarda
update AULA3 set nome = 'Hemengarda';

//fazendo update do nome da Ana para Hemengarda
update AULA3 set nome = 'Hemengarda' where CODIGO = 1;

//Truncate - ele limpa os dados da tabela e não é possível recuperar via rollback
truncate table aula3;


 // Eliminar valores duplicados na exibição
 select distinct nome from aula3;
 
 select distinct nome, valor from aula3;
 
 select nome, valor, (valor + 100) * 12 from aula3;

 select * from aula3 where nome = 'Ana';

//double pipe concatenação ||
 select 'Funcionario ' || nome || ' tem o salário de ' || valor || ' com novo salário anual de ' || (valor + 100) from aula3;
 
  select nome || '@gmail.com' as emails from aula3; //esse AS adiciona um título na tabela exibida
 
  select nome || '@gmail.com' as "E-mails" from aula3; //Colocar com aspas duplas para funcionar o hífen

 
 