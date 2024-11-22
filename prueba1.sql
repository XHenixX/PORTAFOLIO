create database prueba
use prueba
create table todo(
id int identity (1,1) primary key not null,
usuario varchar (25),
contraseña varchar (25),
tipo varchar (20),
nombre varchar (40),
apellido varchar (40),
correo varchar (50),
aula varchar (10),
edificio varchar (20),
fecha varchar (50),
motivo varchar (50),
destino varchar (50),
)

insert into todo values ('admin', 'admin','administrador','Maria', 'Perez', 'mariap@gmail.com', '2-3C', 'Edificio 2', '14/1/2024', 'visita a la biblioteca', 'Biblioteca')
select * from todo 
go
create proc sp_buscaradmin
@buscar varchar(100) as select * from todo where nombre like @buscar +'%'
go
create proc sp_buscargeneral
@buscar varchar(100) as select * from todo where nombre like @buscar +'%'
go
create proc sp_buscaredificio
@buscar varchar(100) as select * from todo where edificio like @buscar +'%'
go
create proc sp_insertarusuario
@usuario varchar (25),
@contraseña varchar (25),
@nombre varchar (40),
@apellido varchar (40),
@correo varchar (50),
@tipo varchar (20),
@aula varchar (10),
@edificio varchar (20),
@fecha varchar (50),
@motivo varchar (50),
@destino varchar (50)
as insert into todo (usuario, contraseña, nombre, apellido, correo, tipo ) values (@usuario, @contraseña, @nombre, @apellido, @correo, @tipo)
go
create proc sp_insertaredificio
@usuario varchar (25),
@contraseña varchar (25),
@nombre varchar (40),
@apellido varchar (40),
@correo varchar (50),
@tipo varchar (20),
@aula varchar (10),
@edificio varchar (20),
@fecha varchar (50),
@motivo varchar (50),
@destino varchar (50)
as insert into todo (aula, edificio) values (@aula, @edificio)
go
create proc sp_insertarvisita
@usuario varchar (25),
@contraseña varchar (25),
@nombre varchar (40),
@apellido varchar (40),
@correo varchar (50),
@tipo varchar (20),
@aula varchar (10),
@edificio varchar (20),
@fecha varchar (50),
@motivo varchar (50),
@destino varchar (50)
as insert into todo (aula, edificio, fecha) values (@aula, @edificio, @fecha)
go
create proc sp_editarusuario
@id int,
@usuario varchar (25),
@contraseña varchar (25),
@nombre varchar (40),
@apellido varchar (40),
@correo varchar (50),
@tipo varchar (20)
as update todo set usuario = @usuario, contraseña = @contraseña, nombre = @nombre, apellido = @apellido, correo = @correo, tipo = @tipo
where id = @id
go 
create proc sp_editaredificio
@id int,
@aula varchar (10),
@edificio varchar (20)
as update todo set aula = @aula, edificio = @edificio
where id = @id
go
create proc sp_editarvisita
@id int,
@aula varchar (10),
@edificio varchar (20),
@fecha varchar (50)
as update todo set aula = @aula, edificio = @edificio, fecha = @fecha
where id = @id
go
create proc sp_eliminarusuario
@id int
as delete todo where id = @id
go
create proc sp_eliminaredificio
@id int,
@aula varchar (10),
@edificio varchar (20)
as update todo set aula = ' ', edificio = ' '
where id = @id
go
create proc sp_eliminarvisita
@id int,
@aula varchar (10),
@edificio varchar (20),
@fecha varchar (50)
as update todo set aula = ' ', edificio = ' ', fecha = ' '
where id = @id
go