USE CarRepair
GO

--DROP TRIGGER PashaTriggered
--GO

--CREATE TRIGGER PashaTriggered
--ON [SpareParts] WITH ENCRYPTION
--FOR INSERT
--AS
--BEGIN
--	IF  @@ROWCOUNT = 1 AND EXISTS(SELECT * FROM SpareParts WHERE SpareParts.Price < 10000)
--	BEGIN
--	ROLLBACK
--	PRINT('Минимальная стоимость услуги 10000')
--	END
--END
--GO


--CREATE TRIGGER Insert_ServiceType_CheckPrice
--ON [ServiceType]
--FOR INSERT
--AS
--BEGIN
--	IF @@ROWCOUNT = 1 AND EXISTS(SELECT Price FROM ServiceType WHERE Price <= 0)
--	BEGIN
--		ROLLBACK
--		PRINT(N'Цена услуги должна быть больше нуля!')
--	END
--END
--GO

DROP TRIGGER Provider_SpareParts_DELETE
GO

CREATE TRIGGER Provider_SpareParts_DELETE
ON Provider
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM SpareParts
	WHERE NOT EXISTS(SELECT * FROM Provider WHERE SpareParts.IDProvider = Provider.IDProvider)
END
GO

--INSERT  Provider (Name, Tel)
--VALUES (N'adsadzxca', 7989841560)

DELETE FROM Provider

DELETE FROM Provider WHERE Provider.IDProvider = 1

DROP TRIGGER Provider_SpareParts_DELETE2
GO

CREATE TRIGGER Provider_SpareParts_DELETE2
ON Provider
FOR DELETE
AS
--DECLARE @IDProvider int
BEGIN
print N'Done!'
--print @IDProvider
	--SELECT @IDProvider = IDProvider FROM deleted
	--DELETE FROM Provider
	--WHERE IDProvider = @IDProvider AND NOT EXISTS(SELECT IDProvider FROM SpareParts WHERE IDProvider = @IDProvider)

	IF EXISTS(SELECT SP.IDProvider, D.IDProvider FROM SpareParts SP, deleted D WHERE SP.IDProvider = D.IDProvider)
	BEGIN
		ROLLBACK
		PRINT('?!')
	END
	--print N'Done!'
END
GO



/*
--Удаление триггера
DROP TRIGGER ServiceType_INSERT

--Создание триггера
CREATE TRIGGER ServiceType_INSERT
ON [dbo].[ServiceType]
FOR INSERT
AS
BEGIN
	IF @@ROWCOUNT = 1 AND
		EXISTS(SELECT Price FROM inserted WHERE Price <= 0)
	BEGIN
	ROLLBACK TRANSACTION
	PRINT N'Стоимость услуги должна быть ненулевой величиной!'
	END
END

--Изменение уже существующего триггера
ALTER TRIGGER ServiceType_INSERT
ON [dbo].[ServiceType]
FOR INSERT
AS
BEGIN
	IF EXISTS(SELECT Price FROM inserted WHERE Price <= 0)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT N'Стоимость услуги должна быть ненулевой величиной!'
	END
END

--Проверка работы триггера
USE CarRepair
INSERT INTO ServiceType (Title, Price)
VALUES (N'Замена тормозных колодок', -18000)

INSERT INTO ServiceType (Title, Price)
VALUES (N'Замена тормозных колодок', -18000)

INSERT INTO ServiceType (Title, Price)
VALUES (N'Замена тормозных колодок', -18000)

INSERT INTO ServiceType (Title, Price)
VALUES (N'Замена тормозных колодок', -18000)
*/

/*
DROP TRIGGER Contract_INSERT

CREATE TRIGGER Contract_INSERT
ON [dbo].[Contract]
AFTER INSERT
AS
BEGIN
	print @@rowcount
	UPDATE [Contract]
	SET TotalSum = [Contract].TotalSum * (100 - Clients.Discount) / 100
	FROM inserted, Clients, [Contract]
	WHERE [Contract].IDContract = inserted.IDContract AND inserted.IDClient = Clients.IDClient

	print 'Recalc total sum!'
END



INSERT [Contract](IDClient, Data, TechnicalPassport, StartDateContract, FinishDateContract, TotalSum)
VALUES (3, CONVERT(datetime, '17.08.2018', 104), '1566469879331', CONVERT(datetime, '20.08.2018', 104), CONVERT(datetime, '20.09.2018', 104), 100)
*/

--DETELE TRIGGER
DROP TRIGGER ProvidedServices_DELETE

CREATE TRIGGER ProvidedServices_DELETE
ON [dbo].[ProvidedServices]
FOR DELETE
AS
BEGIN
	DELETE FROM Job
	WHERE Job.IDJob IN (SELECT deleted.IDJob FROM deleted)
END

DROP TRIGGER Job_DELETE

CREATE TRIGGER Job_DELETE
ON [dbo].[Job]
AFTER DELETE
AS
BEGIN
	DELETE FROM SpareParts
	WHERE SpareParts.IDPart IN (SELECT IDPart FROM deleted)
END


DELETE FROM [dbo].[ProvidedServices]
WHERE [dbo].[ProvidedServices].IDProvidedService = 5--7

INSERT ProvidedServices(IDJob, IDContract)
VALUES (3, 3)