USE CarRepair
GO

DROP TRIGGER PashaTriggered
GO

CREATE TRIGGER PashaTriggered
ON [SpareParts] WITH ENCRYPTION
FOR INSERT
AS
BEGIN
	IF  @@ROWCOUNT = 1 AND EXISTS(SELECT * FROM SpareParts WHERE SpareParts.Price < 10000)
	BEGIN
	ROLLBACK
	PRINT('Минимальная стоимость услуги 10000')
	END
END
GO


CREATE TRIGGER Insert_ServiceType_CheckPrice
ON [ServiceType]
FOR INSERT
AS
BEGIN
	IF @@ROWCOUNT = 1 AND EXISTS(SELECT Price FROM ServiceType WHERE Price <= 0)
	BEGIN
		ROLLBACK
		PRINT(N'Цена услуги должна быть больше нуля!')
	END
END
GO
