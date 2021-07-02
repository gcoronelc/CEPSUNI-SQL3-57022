-- Caso 1
-- Restaurar solo base de datos domingo

USE master;
go

drop database perudev;
go


RESTORE DATABASE perudev FROM PERUDEV57022 
WITH FILE=1, RECOVERY;
go


select * from perudev..test;
go

-- Caso 2
-- Restaurar solo base de datos domingo
--y el diferencial del Lunes

USE master;
go

drop database perudev;
go


RESTORE DATABASE perudev FROM PERUDEV57022 
WITH FILE=1, NORECOVERY;
go

RESTORE DATABASE perudev FROM PERUDEV57022 
WITH FILE=2, RECOVERY;
go


select * from perudev..test;
go


-- Caso 3
-- Restaurar solo base de datos domingo
-- y el diferencial del Martes

USE master;
go

drop database perudev;
go


RESTORE DATABASE perudev FROM PERUDEV57022 
WITH FILE=1, NORECOVERY;
go

RESTORE DATABASE perudev FROM PERUDEV57022 
WITH FILE=3, RECOVERY;
go


select * from perudev..test;
go


-- Caso 4
-- Restaurar solo base de datos domingo,
-- la diferencial del Martes,
-- y el log del miercoles.

USE master;
go

drop database perudev;
go


RESTORE DATABASE perudev FROM PERUDEV57022 
WITH FILE=1, NORECOVERY;
go

RESTORE DATABASE perudev FROM PERUDEV57022 
WITH FILE=3, NORECOVERY;
go

RESTORE LOG perudev FROM PERUDEV57022 
WITH FILE=4, RECOVERY;
go

select * from perudev..test;
go