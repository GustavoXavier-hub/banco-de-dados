use master
drop database projeto_compra 

create database projeto_compra
go

use projeto_compra
go

create table cliente
(id_cliente		int		identity(1,1) not null	primary key,
 nm_cliente		varchar(50)	not null,
 end_cliente	varchar(60)	not null);
go

create table compra
(id_compra		int		identity(1,1)	not null	primary key,
 id_cliente		int				not null	constraint	cliente_id_cliente	references	cliente(id_cliente),
 vl_compra		numeric(7,2)	not null,
 dt_compra		date			not null);
go


insert into cliente
	values ('Maria' , 'Rua Floriano, 20'),
		   ('Jose'  , 'Rua Alcantara, 113'),
		   ('Carlos', 'Av. Tiradentes, 10'),
		   ('Josefina', 'Trav Clara Camarao, 25');
go


select * from cliente;
go


insert into compra (vl_compra, dt_compra, id_cliente)
	values	(5020.20, '2017-10-01', 1),
			(3510.55, '2017-10-01', 2),
			(1000.10, '2017-10-30', 1),
			(1200.10, '2017-11-01', 4),
			(8000.00, '2017-11-02', 1);
go


select * from compra;

/*JOIN ou INNER JOIN*/


select * 
	from cliente a inner join compra b on a.id_cliente = b.id_cliente;

select * 
	from compra b join cliente a on b.id_cliente = a.id_cliente;

select *
	from cliente a join compra b on a.id_cliente = b.id_cliente;



/* RIGH JOIN - lista as linhas referentes a tabela a direita da expressâo */

select *
	from cliente a right join compra b on a.id_cliente = b.id_cliente;



/* LEFT JOIN - lista as linhas referentes a tabela à esquerda da expressão*/
select *
	from cliente a left join compra b on a.id_cliente = b.id_cliente;

select *
	from cliente a full join compra b on a.id_cliente = b.id_cliente;

