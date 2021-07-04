-- PREGUNTA 1

USE [Northwind]
GO
CREATE ROLE [ROL_ADMINISTRADOR]
GO

--CREANDO LOGIN
USE [master]
GO
CREATE LOGIN [MI]
	WITH PASSWORD=N'admin', DEFAULT_DATABASE=[NORTHWIND]
	GO
--CREACI�N DE USUARIO
USE [Northwind]
GO
CREATE USER [MI] FOR LOGIN [MI]
GO

use [Northwind]
GO
ALTER ROLE [ROL_ADMINISTRADOR] ADD MEMBER [MI]
GO

-- PREGUNTA 2
USE [Northwind]
GO
CREATE ROLE [ROL_VICEPRESIDENTE]
GO
use [Northwind]
GO
GRANT SELECT, UPDATE, INSERT, DELETE ON EMPLOYEES TO [ROL_VICEPRESIDENTE]
GO
-- CREACION afuller
USE [MASTER]
GO
CREATE LOGIN [afuller]
WITH PASSWORD = 'afuller', DEFAULT_DATABASE=[NORTHWIND]
GO
USE [NORTHWIND]
GO
CREATE USER [afuller] FOR LOGIN [afuller]
GO
--Asignaci�n del rol al miembro
USE [Northwind]
GO
ALTER ROLE [ROL_VICEPPRESIDENTE] ADD MEMBER [afuller]
GO

-- PREGUNTA 3
--Creaci�n del rol
USE [Northwind]
GO
CREATE ROLE [ROL_VENDEDORES_CORPORATIVOS]
GO
use [Northwind]
GO
GRANT SELECT, UPDATE, INSERT, DELETE ON ORDERS TO [ROL_VENDEDORES_CORPORATIVOS]
GO
--Creaci�n de login jleverling y mpeacock
USE [MASTER]
GO
CREATE LOGIN [jleverling]
WITH PASSWORD=N'jleverling', DEFAULT_DATABASE=[NORTHWIND]
GO
USE [MASTER]
GO
CREATE LOGIN [mpeacock]
WITH PASSWORD=N'mpeacock', DEFAULT_DATABASE=[NORTHWIND]
GO
USE [NORTHWIND]
GO
--Creacion de usuario 
CREATE USER [jleverling] FOR LOGIN [jleverling]
GO
USE [Northwind]
GO
ALTER ROLE [ROL_VENDEDORES_CORPORATIVOS] ADD MEMBER [jleverling]
GO
USE [NORTHWIND]
GO
CREATE USER [mpeacock] FOR LOGIN [mpeacock]
GO
--Asignaci�n del rol al miembro
USE [Northwind]
GO
ALTER ROLE [ROL_VENDEDORES_CORPORATIVOS] ADD MEMBER [mpeacock]
GO