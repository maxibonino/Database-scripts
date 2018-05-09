USE CarRepair
GO

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
GO

CREATE TRIGGER ProvidedServices_DELETE
ON [dbo].[ProvidedServices]
FOR DELETE
AS
BEGIN
	DELETE FROM Job
	WHERE Job.IDJob IN (SELECT deleted.IDJob FROM deleted)
END
GO


DELETE FROM [dbo].[ProvidedServices]
WHERE [dbo].[ProvidedServices].IDProvidedService = 25--7

DELETE FROM SpareParts WHERE IDPart = 3

INSERT ProvidedServices(IDJob, IDContract)
VALUES (6, 3)

DELETE FROM SpareParts
WHERE IDPart = 3

--DELETE TRIGGER ServiceType_INSTEAD_OF
/*
CREATE TRIGGER ServiceType_INSTEAD_OF
ON ServiceType
INSTEAD OF INSERT
AS
BEGIN
	IF @@ROWCOUNT = 1
	BEGIN
		DECLARE @Price money
		DECLARE @Title varchar(50)
		SET @Price = (SELECT Price FROM inserted)
		SET @Title = (SELECT Title FROM inserted)

		IF EXISTS(SELECT Title FROM ServiceType WHERE Title = @Title)
		BEGIN
			PRINT N'Уже существует данная услуга'
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			INSERT INTO ServiceType (Title, Price)
			VALUES (@Title, @Price)
		END
	END
END

INSERT ServiceType (Title, Price)
VALUES (N'Замена ремня ГРМ2', 2000)

INSERT ServiceType (Title, Price)
VALUES (N'Замена ремня ГРМ2', 2000)*/



USE CarRepair
GO

--UPDATE TRIGGER
--Если обновляем номер пасспорта, то изменение заносим в новую таблицу,
--т.е. журналируем
/*
CREATE TRIGGER Employee_UPDATE
ON Employee
FOR UPDATE
AS
BEGIN
	IF UPDATE(PassportNumber)
	BEGIN
		IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME='Employee_History' AND xtype='U')
		BEGIN
			CREATE TABLE [dbo].Employee_History (
				IDChange int NOT NULL IDENTITY(1, 1) CONSTRAINT PK_Employee_History PRIMARY KEY,
				IDEmployee int NOT NULL,
				PassportNumber bigint,
			);
		END

		INSERT INTO Employee_History (IDEmployee, PassportNumber)
		VALUES ((SELECT IDEmployee FROM deleted), (SELECT PassportNumber FROM deleted))
	END
END


UPDATE Employee
	SET PassportNumber = 7536153
	FROM Employee
	WHERE IDEmployee = 3

UPDATE Employee
	SET PassportNumber = 7536163
	FROM Employee
	WHERE IDEmployee = 3*/


--DROP TRIGGER ServiceType_INSTEAD_OF_UPDATE
--GO

--INSTEAD OF UPDATE
--Для старых заказов цена старая, для новых - новая
/*CREATE TRIGGER ServiceType_INSTEAD_OF_UPDATE
ON ServiceType
INSTEAD OF UPDATE
AS
BEGIN
	IF UPDATE(Price)
	BEGIN
		INSERT INTO ServiceType (Title, Price)
		VALUES ((SELECT Title FROM inserted), (SELECT Price FROM inserted))
	END
END

UPDATE ServiceType
SET Price = 2500
WHERE IDServiceType = 1*/