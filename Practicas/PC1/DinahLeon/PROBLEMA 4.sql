-- PROBLEMA 4 
-- Creando el Rol de Gerente de Ventas

USE [Northwind]
GO
CREATE ROLE [Gerente_Ventas]
GO
--Concediendo permisos 
use [Northwind]
GO
GRANT DELETE ON [dbo].[Categories] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Categories] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Categories] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Products] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Products] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Products] TO [Gerente_Ventas]
GO
use [Northwind]
GO
DENY SELECT ON [dbo].[Customers] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Suppliers] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Suppliers] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Suppliers] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Order Details] TO [Gerente_Ventas]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [Gerente_Ventas]
GO
use [Northwind]
GO
DENY SELECT ON [dbo].[Shippers] TO [Gerente_Ventas]
GO
use [Northwind]
GO
DENY SELECT ON [dbo].[Employees] TO [Gerente_Ventas]
GO

-- CREANDO EL LOGIN

USE [master]
GO
CREATE LOGIN [sbuchanan] WITH PASSWORD=N'sbuchanan' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE [Northwind]
GO
CREATE USER [sbuchanan] FOR LOGIN [sbuchanan]
GO
USE [Northwind]
GO
ALTER USER [sbuchanan] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [Northwind]
GO
ALTER ROLE [Gerente_Ventas] ADD MEMBER [sbuchanan]
GO
