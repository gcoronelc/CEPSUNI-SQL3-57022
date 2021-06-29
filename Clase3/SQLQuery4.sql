-- Dispositivo: Device57022

-- 1.- Copia de seguridad completa.

BACKUP DATABASE EUREKABANK 
TO Device57022
WITH 
	format, 
	name = 'BAK COMPLETO', 
	description = 'Backup completo de la base de datos.' 
go

restore headeronly from Device57022; 
go

-- 2.- Backup diferencial

select * from EUREKABANK..cliente;
go

insert into EUREKABANK..cliente values('88888', 'aaaa', 'bbbbb', 'ccccc', 
	'21658721', 'LIMA', 'MI CASA', '786543219', 'abc@gmail.com');

BACKUP DATABASE EUREKABANK 
TO Device57022
WITH 
	DIFFERENTIAL, 
	name = 'BAK DIFERENCIAL', 
	description = 'Backup diferencia de la base de datos.' 
go

restore headeronly from Device57022; 
go


-- 3.- Backup log

insert into EUREKABANK..cliente values('88877', 'cccc', 'ddddd', 'eeeee', 
	'43768923', 'LIMA', 'TU CASA', '786543219', 'cde@gmail.com');


BACKUP LOG EUREKABANK 
TO Device57022
WITH 
	name = 'BAK LOG', 
	description = 'Backup log  de la base de datos.' 
go

restore headeronly from Device57022; 
go

