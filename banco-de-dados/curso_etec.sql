/* Script de CREATE do DB curso_etec e suas tabelas */

create database curso_etec;
go

use curso_etec;
go

drop database curso_etec

drop table area 

drop table curso

drop table turma

drop table aluno

drop table proffessor

drop table materia




create table area
        (id_are       int           not null  primary key,
         nm_are       varchar (30)  not null);
go

create table curso
        (id_cur       int           not null  primary key,
         id_are       int           not null,
         nm_cur       varchar (50)  not null,
	 Constraint cur_are_fk foreign key (id_are) references area);
go

create table turma
	(id_tur       int           not null  primary key,
	 id_cur       int           not null,       
	 nm_tur       varchar (5)   not null,
	 Constraint tur_cur_fk foreign key (id_cur) references curso);
go

create table aluno
	(id_alu       int           not null  primary key,
	 id_tur       int           not null,
	 pn_alu       varchar (30)  not null,
	 un_alu       varchar (20)  not null,
	 dt_nas_alu   date          not null,
	 Constraint alu_tur_fk foreign key (id_tur) references turma);
go

create table professor
	(id_prof      int           not null  primary key,
	 id_cur       int           not null,       
	 nm_prof      varchar (50)  not null,
	 tt_hs_prof   int           not null,
	 vl_hora_prof numeric (7,2) not null,
	 Constraint prof_cur_fk foreign key (id_cur) references curso);
go

create table materia
	(id_mat       int           not null  primary key,
	 id_prof      int           not null,
	 id_tur       int           not null,
	 nm_mat       varchar (40)  not null,
	 sg_mat       varchar (10)  not null,
	 Constraint mat_prof_fk foreign key (id_prof) references professor,
	 Constraint mat_tur_fk  foreign key (id_tur)  references turma);
go

/* Script de INSERT no DB curso_etec */
	 
insert into area (id_are, nm_are)
       values (1,'Informacao e Comunicacao'),
	          (2,'Gestao'),
              (3,'Eletronica'),
	          (4,'Mecanica');
			  go
insert into curso (id_cur, id_are, nm_cur)
       values (1,1,'Informatica'),
	          (2,1,'Redes de Computadores'),
	          (3,2,'Administracao'),
              (4,2,'Contabilidade'),
	          (5,2,'Logistica'),
	          (6,3,'Eletronica');
		  go

insert into turma (id_tur, id_cur, nm_tur)
       values (1,1,'1Q'),
	      (2,1,'2Q'),
	      (3,1,'3Q'),
	      (4,2,'1QR'),
              (5,2,'2QR'),
              (6,2,'3QR'),
	      (7,3,'1M'),
	      (8,3,'2M'),
	      (9,3,'2M');
		  go
insert into aluno (id_alu,id_tur,pn_alu,un_alu,dt_nas_alu)
       values (1,1,'Maria','Silva','2001-05-01'),
	      (2,1,'Jose','Matos','2001-05-02'),
	      (3,2,'Marcos','Sousa','2000-03-05'),
	      (4,2,'luiza','Souza','2003-04-03'),
              (5,3,'Lucia','Madeira','2003-04-03'),
	      (6,3,'Carlos','Silva','1999-06-30'),
	      (7,4,'Antonio','Souza','1999-06-30'),
              (8,4,'Silvio','Silveira','2001-04-30'),
	      (9,6,'Silvia','Moura','2001-04-30'),
	      (10,6,'Carlos','Paoli','1999-08-30'),
	      (11,7,'Antonio','Silveira','2001-04-30');

insert into professor (id_prof,	id_cur,	nm_prof,tt_hs_prof,vl_hora_prof)
       values (1,1,'Jose Silva',100,'10.50'),
	      (2,1,'Maria Santos',50,'15.80'),
	      (3,1,'Silvana Silva',60,'14.20'),
              (4,3,'Sueli Navarro',20,'17.45'),
              (5,3,'Marco Antonio',10,'10.50'),
              (6,6,'Silvio Sebastiao',10,'15.80'),
              (7,6,'Celia Gaviao',120,'21.30');
			  go
insert into  materia (id_mat, id_prof, id_tur, nm_mat, sg_mat) 
       values (1,1,1,'Logica Programacao','LP'),	
              (2,2,2,'Tecnicas de Linguagem Banco de Dados II','BD II'),	
              (3,2,3,'Tecnicas de Linguagem Banco de Dados III','BD III'),	
	      (4,5,2,'Empreendedorismo e Inovação','EI'),	
              (5,4,2,'Ingles Instrumental','II'),	
              (6,3,4,'Aplicativos Informatizados','AI'),	
              (7,1,4,'Logica Programação','LP');
			  go

select * from area
go
select * from curso
go
select * from turma
go
select * from materia
go
select * from professor
go
select * from aluno

/* funçao join */
			 
/* exercicio 08 A*/
select  a.id_are 'Codigo da Area', a.nm_are  'Nome da area', c.id_cur 'Codigo do Curso' , c.nm_cur 'Nome do curso' 
from area a 
     join curso c on  a.id_are = c.id_are;
			  
/* exercicio 08 B */ 
select  a.id_are 'Codigo da area', a.nm_are as 'Nome da Area',cu.nm_cur  as 'Nome do Curso' , p.nm_prof as 'Nome do Professor'
from area  ar , curso cu , professor p
 join area a on a.id_are = a.id_are;	
			 
			  
/* exercicio 08 c */ 
select  a.id_are 'Codigo da area', a.nm_are as 'Nome da Area',cu.nm_cur  as 'Nome do Curso' , p.nm_prof as 'Nome do Professor'
from area  ar , curso cu , professor p
 join area a on a.id_are = a.id_are
 ORDER BY (a.id_are);	
			 
/*exercicio 08 D*/
select a.id_are as 'codigo da area', a.nm_are  'nome da area', c.nm_cur  'nome do curso',  p.nm_prof 'nome do professor', m.nm_mat  'nome da materia', m.sg_mat 'significado da materia'
from area a , curso c , professor p ,materia m
 join area ar on   ar.id_are = ar.id_are;  

 			 
/*exercicio 08 e*/
select a.id_are as 'codigo da area', a.nm_are  'nome da area', c.nm_cur  'nome do curso',  p.nm_prof 'nome do professor', m.nm_mat  'nome da materia', m.sg_mat 'significado da materia'
from area a , curso c , professor p ,materia m
 join area ar on   ar.id_are = ar.id_are
 WHERE   a.id_are = '1'; 

--ex9 view a			
create view  prof_vlhora 
as select   id_cur 'identificador do curso',  nm_prof 'nome do proffessor' , vl_hora_prof 'valor total da hora do proffesor' 
from professor
where id_cur=1

--ex9 view c	
select * from prof_vlhora
--ex9 view d/
drop view prof_vlhora

/*ex 9 a*/
select  tt_hs_prof,vl_hora_prof
from professor
where vl_hora_prof > (select AVG (vl_hora_prof) from professor)
ORDER BY vl_hora_prof desc

/*ex 9 b*/
select  id_prof , nm_prof,tt_hs_prof,vl_hora_prof
from professor
where vl_hora_prof >(select AVG (vl_hora_prof) from professor)
ORDER BY vl_hora_prof asc 
/*ex 9 c*/
select dt_nas_alu  
from aluno
 where dt_nas_alu >'2001-04-30' (select (dt_nas_alu) from aluno) 

/*ex9 d*/
select  tt_hs_prof,vl_hora_prof
from professor
where vl_hora_prof > (select AVG (vl_hora_prof) from professor)
ORDER BY vl_hora_prof desc

create view aluno_datnas
as select dt_nas_alu 'data de nascimento do aluno'
from aluno
where  dt_nas_alu > '2001-04-30'

drop view aluno_datnas

select  tt_hs_prof,vl_hora_prof
from professor
where vl_hora_prof <= (select   AVG (vl_hora_prof) from professor)
ORDER BY vl_hora_prof desc
update professor
set vl_hora_prof = vl_hora_prof * 0.5

create view prof_vlhora_aumento
as select nm_prof,vl_hora_prof,tt_hs_prof
from professor
where vl_hora_prof <= vl_hora_prof 
update professor 
set vl_hora_prof = vl_hora_prof *0.5
  


/* criaçao da tabela proffessor_bk_insert*/ 

create table professor_bk_insert
	(id_prof      int           not null  primary key,
	 id_cur       int           not null,       
	 nm_prof      varchar (50)  not null,
	 tt_hs_prof   int           not null,
	 vl_hora_prof numeric (7,2) not null);
	
go

/* criaçao da tabela proffessor_bk_delete*/ 

create table professor_bk_delete
	(id_prof      int           not null  primary key,
	 id_cur       int           not null,       
	 nm_prof      varchar (50)  not null,
	 tt_hs_prof   int           not null,
	 vl_hora_prof numeric (7,2) not null);
	 
go

/*select da tabela proffessor_bk_insert*/
select * from professor_bk_insert
go
/*select da tabela proffesor_bk_delete*/
select * from professor_bk_delete
go

/* fazendo a trigger para o insert*/
create trigger trg_insertproffessor on proffessor
after insert
as begin
insert into professor_bk_insert
select * from inserted
end
go


/* fazendo a trigger para o delete*/

create trigger trg_deleteproffessor on proffessor
after insert
as begin
insert into professor_bk_delete
select *from deleted
end 
go



/* fazendo delete de dados na tabela proffessor*/
delete from professor
where id_prof=1;
go


/* trigger de */
select * from sysobjects where type = 'TR';

/* drop das triggers */
drop trigger trg_insertproffessor 
go

drop trigger trg_deleteproffessor 


/*select da tabela proffessor_bk_insert*/
select * from professor_bk_insert