use [Northwind]
GO

CREATE ROLE [ROL_VENTAS_CORPORATIVAS]

GO
GRANT DELETE ON [dbo].[Order Details] TO [ROL_VENTAS_CORPORATIVAS]

GO
GRANT INSERT ON [dbo].[Order Details] TO [ROL_VENTAS_CORPORATIVAS]

GO
GRANT SELECT ON [dbo].[Order Details] TO [ROL_VENTAS_CORPORATIVAS]

GO
GRANT UPDATE ON [dbo].[Order Details] TO [ROL_VENTAS_CORPORATIVAS]

GO
GRANT DELETE ON [dbo].[Orders] TO [ROL_VENTAS_CORPORATIVAS]

GO
GRANT INSERT ON [dbo].[Orders] TO [ROL_VENTAS_CORPORATIVAS]

GO
GRANT SELECT ON [dbo].[Orders] TO [ROL_VENTAS_CORPORATIVAS]

GO
GRANT UPDATE ON [dbo].[Orders] TO [ROL_VENTAS_CORPORATIVAS]