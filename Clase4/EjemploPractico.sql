-- Paso 1

use master;
go

drop database perudev; 
go

create database perudev; 
go

-- Modo de recuperación: FULL

alter database perudev 
set recovery FULL;
go 

select databasepropertyex( 'perudev','Recovery' );
go

-- Paso 2
-- Crear el dispositivo

exec sp_addumpdevice 'disk', 'PERUDEV57022', 'E:\BACKUP\PDDevice57022.bak';
go

-- Verificar el dispositivo
select * from master.dbo.sysdevices;
go


-- Paso 3
-- CREAR LA TABLA DE PRUEBA

create table perudev..test( 
	id Int Identity Primary Key, 
	dato varchar(30) 
);
go

-- Datos iniciales - Domingo

declare @k int
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Backup de Base de Datos') 
	commit tran 
	set @k = @k + 1 
end
go

-- Paso 4
-- REALIZAR EL BACKUP DE LA BASE DE BATOS


ALTER DATABASE perudev
SET RECOVERY SIMPLE;
GO

-- Reducimos el log de transacciones a  1 MB.

use perudev;
go

DBCC SHRINKFILE(perudev_log, 1);
GO

-- Cambiamos nuevamente el modelo de recuperación a Completo.

ALTER DATABASE perudev
SET RECOVERY FULL;
GO

-- Realizar el backup
use master;
go

backup database perudev to PERUDEV57022 
with 
	format, 
	name = 'Backup BD', 
	description = 'Backup de la base de datos completa';
go

restore headeronly from PERUDEV57022;
go

-- Paso 5
-- REALIZAR UN PRIMER BACKUP DIFERENCIAL - Lunes


-- Datos
declare @k int
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Datos del Lunes') 
	commit tran 
	set @k = @k + 1 
end
go


backup database perudev to PERUDEV57022 
with differential, 
	 name = 'BackupLunes', description = 'LUNES, Primer backup diferencial de la base de datos.';
go

restore headeronly from PERUDEV57022;
go

-- Paso 6
-- REALIZAR UN SEGUNDO BACKUP DIFERENCIAL - Martes

-- Datos

declare @k int
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Datos del Martes') 
	commit tran 
	set @k = @k + 1 
end
go

select * from perudev..test;
go

backup database perudev to PERUDEV57022 
with differential, 
	 name = 'BackupMArtes', description = 'MARTES, Segundo backup diferencial de la base de datos.';
go

restore headeronly from PERUDEV57022;
go


-- Paso 7
-- ERROR EN LA BASE DE DATOS - Miercoles
-- El miercoles a las 11 am se produce un error en el servidor de BD.


declare @k int
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Datos del Miercoles') 
	commit tran 
	set @k = @k + 1 
end
go

select * from perudev..test;
go

-- A las 11 am se ha producido el error.
-- Se realiza un backup del log

backup log perudev to PERUDEV57022 
with 
	no_truncate, 
	name = 'BackupMiercoles', 
	description = 'Backup del log del dia miercoles.';
go


restore headeronly from PERUDEV57022;
go
