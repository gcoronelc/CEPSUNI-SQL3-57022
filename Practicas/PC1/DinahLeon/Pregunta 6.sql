--CREACION DE ROL DE ADMINISTRADOR INTERNA
USE [Northwind]
GO
CREATE ROLE [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
--CREACION DE PERMISOS QUE VA TENER LA ADMINISTRADORA INTERNA
GRANT DELETE ON [dbo].[Shippers] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Shippers] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Shippers] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Shippers] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Products] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Products] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Products] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Products] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Categories] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Categories] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Categories] TO [ROL_ADMINISTRADOR_INTERNA]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Categories] TO [ROL_ADMINISTRADOR_INTERNA]
GO


--Creaci�n del login de Laura Callahan
USE [master]
GO
CREATE LOGIN [lcallahan] 
WITH PASSWORD=N'lcallahan',
DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
--Creaci�n del usuario de Laura Callahan 
USE [Northwind]
GO
CREATE USER [lcallahan] FOR LOGIN [lcallahan]
GO
USE [Northwind]
GO
ALTER USER [lcallahan] WITH DEFAULT_SCHEMA=[dbo]
GO
--Agregando el rol de administrador a Laura Callahan
USE [Northwind]
GO
ALTER ROLE [ROL_ADMINISTRADOR_INTERNA] ADD MEMBER [lcallahan]
GO