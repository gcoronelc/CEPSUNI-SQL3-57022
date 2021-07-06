
USE EduTec; 
GO

select * from curso;
go

drop table dbo.Curso2;
go

SELECT * INTO dbo.Curso2 
FROM dbo.Curso WHERE 1=2; 
GO

select * from dbo.Curso2 ;
go

sp_configure 'show advanced options', 1; 
RECONFIGURE; 
go 

sp_configure; 
GO 

sp_configure 'xp_cmdshell', 1; 
RECONFIGURE; 
GO

declare @sql varchar(8000)
select @sql = 'bcp edutec.dbo.Curso out d:\bcp\Curso_B2.dat -c -Usa -Psql'
exec master..xp_cmdshell @sql
GO


drop table dbo.Curso3;
go

SELECT * INTO dbo.Curso3 FROM dbo.Curso WHERE 1=2; 
GO

select * from dbo.Curso3;
go


drop table dbo.Curso4;
go


SELECT * INTO dbo.Curso4 FROM dbo.Curso WHERE 1=2;
go


bulk insert EduTec.dbo.Curso4
from 'D:\bcp\Curso_A.dat' 
with (formatfile='D:\bcp\Curso.xml');
go

select * from dbo.Curso4;
go

drop table dbo.Profesor2 ;
go

select NomProfesor, ApeProfesor 
into dbo.Profesor2 
from dbo.Profesor where 1=2; 


bulk insert dbo.Profesor2
from 'D:\bcp\Profesores.txt' 
with (fieldterminator='\t',rowterminator='\n'); 
go 


drop table dbo.Curso5;
go

SELECT * INTO dbo.Curso5 FROM dbo.Curso WHERE 1=2; 
GO


select * from dbo.Curso5; 
go


BULK INSERT dbo.Curso5 FROM 'D:\bcp\Curso-nat.Dat' WITH (DATAFILETYPE='native'); 
GO


 DROP TABLE dbo.Curso6;
 GO

SELECT * INTO dbo.Curso6 FROM dbo.Curso WHERE 1=2; 
GO


INSERT INTO dbo.Curso6 
SELECT a.* FROM 
	OPENROWSET( BULK 'D:\bcp\Curso_A.dat', FORMATFILE = 'D:\bcp\Curso.fmt') AS a;

SELECT * FROM dbo.Curso6;
GO


sp_configure 'show advanced options', 1; 
RECONFIGURE; 
go 


sp_configure; 
GO 

sp_configure 'Ad Hoc Distributed Queries', 1; 
RECONFIGURE;
GO

SELECT a.* FROM OPENROWSET('SQLNCLI', 'Server=localhost;Trusted_Connection=yes;', 
'SELECT * FROM EDUTEC.dbo.curso') AS a;

SELECT a.* 
FROM OPENROWSET('SQLNCLI', 'Server=localhost;userid=sa;password=sql', 
	'SELECT * FROM EDUTEC.dbo.curso') AS a;


