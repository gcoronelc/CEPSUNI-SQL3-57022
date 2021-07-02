use edutec;
go


select * from tarifa;
go


begin tran;
go

update Tarifa set PrecioVenta = 0.0;
go


select * from tarifa;
go


select @@TRANCOUNT;
go


-- Simulación de una desgracia.
-- Se procede a reiniciar el servidor.
-- Se verifica que todo regreso a un estado anterior a la desgracia.




