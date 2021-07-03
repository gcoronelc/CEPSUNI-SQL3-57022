

-- 01 Enviando un mensaje sencillo. 

EXEC msdb.dbo.sp_send_dbmail 
	@profile_name = 'PERFIL57022', 
	@recipients = 'hcadillo7@gmail.com;sharon.calvo.p@uni.pe;ec.v1352@gmail.com;mariamipanaquesalinas@gmail.com;dleonoshiro@gmail.com', 
	@body = 'Enviando de correo desde SQL Server con sp_send_dbmail', 
	@subject = 'Prueba 01'; 
GO




-- 02 Se envía el resultado de una consulta 
EXEC msdb.dbo.sp_send_dbmail 
	@profile_name = 'PERFIL57022', 
	@recipients = 'pedro.pineda433@gmail.com;manuelfsalazar@gmail.com;sayajo.ochante.gonzalo@gmail.com;jaavri1996@gmail.com;wilsonvidal19@gmail.com', 
	@query = 'SELECT * FROM Northwind.dbo.Customers', 
	@subject = 'Listado Clientes', 
	@attach_query_result_as_file = 1; 
GO


-- Limpiar los mensajes del log 

DELETE FROM msdb.dbo.sysmail_event_log; 
GO

