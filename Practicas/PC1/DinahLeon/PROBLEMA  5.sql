-- PROBLEMA 5

-- creando el login msuyama
USE [master]
GO
CREATE LOGIN [msuyama] WITH PASSWORD=N'msuyama' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [Northwind]
GO
CREATE USER [msuyama] FOR LOGIN [msuyama]
GO

USE [Northwind]
GO
ALTER USER [msuyama] WITH DEFAULT_SCHEMA=[dbo]
GO

-- creando el login  rking

USE [master]
GO
CREATE LOGIN [rking] WITH PASSWORD=N'rking', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [Northwind]
GO
CREATE USER [rking] FOR LOGIN [rking]
GO

USE [Northwind]
GO
ALTER USER [rking] WITH DEFAULT_SCHEMA=[dbo]
GO

--creando el login adodsworth

USE [master]
GO
CREATE LOGIN [adodsworth] WITH PASSWORD=N'adodsworth', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [Northwind]
GO
CREATE USER [adodsworth] FOR LOGIN [adodsworth]
GO

USE [Northwind]
GO
ALTER USER [adodsworth] WITH DEFAULT_SCHEMA=[dbo]
GO

--CREANDO LOS ROLES 
USE [Northwind]
GO
CREATE ROLE [Vendedores_Locales] AUTHORIZATION [dbo]
GO

USE [Northwind]
GO
ALTER ROLE [Vendedores_Locales] ADD MEMBER [adodsworth]
GO

USE [Northwind]
GO
ALTER ROLE [Vendedores_Locales] ADD MEMBER [msuyama]
GO

USE [Northwind]
GO
ALTER ROLE [Vendedores_Locales] ADD MEMBER [rking]
GO

use [Northwind]
GO
GRANT DELETE ON [dbo].[Customers] TO [Vendedores_Locales] WITH GRANT OPTION 
GO

use [Northwind]
GO
GRANT INSERT ON [dbo].[Customers] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT SELECT ON [dbo].[Customers] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT UPDATE ON [dbo].[Customers] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [Vendedores_Locales] WITH GRANT OPTION 
GO

use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT DELETE ON [dbo].[Order Details] TO [Vendedores_Locales] WITH GRANT OPTION 
GO

use [Northwind]
GO
GRANT INSERT ON [dbo].[Order Details] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT SELECT ON [dbo].[Order Details] TO [Vendedores_Locales]
GO

use [Northwind]
GO
GRANT UPDATE ON [dbo].[Order Details] TO [Vendedores_Locales]
GO









