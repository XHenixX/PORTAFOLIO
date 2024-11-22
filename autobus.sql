create database autobus
use autobus
create table chofer(
id int identity (1,1) primary key not null,
codigo as ('CHFR'+ right ('0000' + convert (varchar,id), (4))),
nombre varchar(30) not null,
apellido varchar(40) not null,
fecha varchar(10) not null,
cedula varchar (11) not null,
)

create table autobuses(
id int identity (1,1) primary key not null,
codigo as ('AUT'+ right ('000' + convert (varchar,id), (3))),
marca varchar (25) not null,
modelo varchar (25) not null,
placa varchar (10) not null,
color varchar (15) not null,
ano int not null,
ruta varchar (40) not null,
)

create table ruta(
id int identity (1,1) primary key not null,
codigo as ('RT'+ right ('00' + convert (varchar,id), (2))),
ruta varchar (40) not null,
)


insert into chofer values ('ramon','gomez','14/01/03','40212007898')
insert into autobuses values ('hyundai', 'sonata','A558856','naranja','2015','Villa Mella')
insert into ruta values ('Villa Mella')
select * from ruta 
select * from chofer
select * from autobuses
go
create proc sp_buscarchofer
@buscar varchar(100) as select * from chofer where codigo like @buscar +'%'
go
create proc sp_buscarautobus
@buscar varchar(100) as select * from autobuses where codigo like @buscar +'%'
go
create proc sp_buscarruta
@buscar varchar(100) as select * from ruta where codigo like @buscar +'%'
go
create proc sp_insertchofer
@nombre varchar (30),
@apellido varchar (40),
@fecha varchar (10),
@cedula varchar (11) 
as insert into chofer values (@nombre, @apellido, @fecha, @cedula)
go 
create proc sp_insertruta
@ruta varchar (40)
as insert into ruta values (@ruta)
go 
create proc sp_insertautobus
@marca varchar (25),
@modelo varchar (25),
@placa varchar (10),
@color varchar (15), 
@ano int,
@ruta varchar (40)
as insert into autobuses values (@marca, @modelo, @placa, @color, @ano, @ruta)
go
create proc sp_editarchofer
@id int,
@nombre varchar (30),
@apellido varchar (40),
@fecha varchar (10),
@cedula varchar (11) 
as update chofer set nombre = @nombre, apellido = @apellido, fecha = @fecha, cedula = @cedula
where id = @id
go 
create proc sp_editarruta
@id int,
@ruta varchar (40) 
as update ruta set ruta = @ruta 
where id = @id
go 
create proc sp_editarautobus
@id int,
@marca varchar (25),
@modelo varchar (25),
@placa varchar (10),
@color varchar (15), 
@ano int,
@ruta varchar (40)
as update autobuses set @marca= marca, @modelo=modelo, @placa=placa, @color=color, @ano=ano, @ruta=ruta
where id = @id
go
create proc sp_eliminarchofer
@id int as delete chofer where id=@id 
go
create proc sp_eliminarautobus
@id int as delete autobuses where id=@id 
go
create proc sp_eliminarruta
@id int as delete ruta where id=@id 