USE CarRepair
GO

IF OBJECT_ID ('dbo.GetAllClientContracts') IS NOT NULL
	DROP PROC [dbo].[GetAllClientContracts];
GO

--Все контракты клиента

CREATE PROCEDURE [dbo].[GetAllClientContracts]
	@ContractCursor CURSOR VARYING OUTPUT,
	@Surname varchar(50),
	@Name varchar(50),
	@Patronymic varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @IDClient int;

	SELECT @IDClient = IDClient
	FROM [CarRepair].[dbo].Clients AS C
	WHERE C.Surname = @Surname AND
		C.Name = @Name AND
		C.Patronymic = @Patronymic

	SET @ContractCursor = CURSOR
	FORWARD_ONLY STATIC FOR
	SELECT *
	FROM [CarRepair].[dbo].[Contract] AS Con
	WHERE Con.IDClient = @IDClient

	OPEN @ContractCursor
END
GO

--My Contract Cursor
DECLARE @MyCC CURSOR;

--Проверка работы процедуры
EXEC [dbo].[GetAllClientContracts]
	@ContractCursor = @MyCC OUTPUT,
	@Surname = 'Mcbee',
	@Name = 'Alphonse2018',
	@Patronymic = '805UH3A';
FETCH NEXT FROM @MyCC; --?
WHILE (@@FETCH_STATUS = 0)
BEGIN
	FETCH NEXT FROM @MyCC;
END

CLOSE @MyCC;
DEALLOCATE @MyCC;

GO