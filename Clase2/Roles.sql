USE [EUREKABANK]
GO
CREATE ROLE [OPERADOR]
GO
use [EUREKABANK]
GO
GRANT SELECT ON [dbo].[Movimiento] TO [OPERADOR]
GO
use [EUREKABANK]
GO
GRANT SELECT ON [dbo].[Cuenta] TO [OPERADOR]
GO
use [EUREKABANK]
GO
GRANT SELECT ON [dbo].[Sucursal] TO [OPERADOR]
GO

USE [EUREKABANK]
GO
ALTER ROLE [OPERADOR] ADD MEMBER [panchito]
GO
