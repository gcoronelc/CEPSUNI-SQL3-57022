USE master 
go

-- Caso 1

restore headeronly from Device57022; 
go

DROP DATABASE EUREKABANK;
GO

RESTORE DATABASE EUREKABANK FROM Device57022
WITH FILE = 1;
go

USE EUREKABANK;
GO

SELECT * FROM CUENTA;
GO

-- Caso 2

restore headeronly from Device57022; 
go

DROP DATABASE EUREKABANK;
GO

RESTORE DATABASE EUREKABANK FROM Device57022
WITH FILE = 1, NORECOVERY;
go


SELECT * FROM EUREKABANK.dbo.CUENTA;
GO

RESTORE DATABASE EUREKABANK WITH RECOVERY;
GO

SELECT * FROM EUREKABANK.dbo.CUENTA;
GO


-- Caso 3

restore headeronly from Device57022; 
go

DROP DATABASE EUREKABANK;
GO

RESTORE DATABASE EUREKABANK FROM Device57022
WITH FILE = 1, NORECOVERY;
go

-- No se puede utilizar la BD
SELECT * FROM EUREKABANK.dbo.CUENTA;
GO

RESTORE DATABASE EUREKABANK 
FROM Device57022
WITH FILE=2, NORECOVERY;
GO

-- No se puede utilizar la BD
SELECT * FROM EUREKABANK.dbo.CUENTA;
GO


RESTORE LOG EUREKABANK 
FROM Device57022
WITH FILE=3, RECOVERY;
GO


SELECT * FROM EUREKABANK.dbo.CUENTA;
GO
