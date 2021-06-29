
USE master;
go

EXEC sp_addumpdevice 'disk', 'Device57022', 'E:\BACKUP\Device57022.bak'
go

-- El archivo se crea cuando se ejecuta el primer backup.


select * from sysdevices;
go

-- BACKUP COMPLETO DE LA BASE DE DATOS

BACKUP DATABASE EduTec 
TO DISK = 'E:\BACKUP\EDUTEC.bak';
go

BACKUP DATABASE Northwind 
TO DISK = 'E:\BACKUP\EDUTEC.bak';
go

BACKUP DATABASE EDUCA 
TO DISK = 'E:\BACKUP\EDUTEC.bak'
WITH INIT;
go

restore headeronly from DISK = 'E:\BACKUP\EDUTEC.bak'; 
go


BACKUP DATABASE EduTec TO Device57022;
go

BACKUP DATABASE Northwind TO Device57022;
go

BACKUP DATABASE EDUCA TO Device57022 WITH INIT;
go

restore headeronly from Device57022; 
go


