/*USE CarRepair
GO

IF OBJECT_ID ('dbo.[##Logging]') IS NOT NULL
	DROP PROC [dbo].[##Logging];
GO

--Логируется каждое соединение
--пользователя с базой данных

CREATE PROCEDURE [dbo].[##Logging]
	@Username varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	IF OBJECT_ID ('[CarRepair].[dbo].[Logging]') IS NOT NULL
	BEGIN

		CREATE TABLE [Loggin] (
			IDAuth int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Loggin PRIMARY KEY,
			Username nvarchar(50) NOT NULL,
			[Date] date NOT NULL,
		)
	END

	INSERT INTO [dbo].[Logging] (Username, [Date])
	VALUES (@Username, GETDATE())
END
GO



--Проверка работы процедуры
EXEC [dbo].[##Logging]
	@Username = N'Neo';
GO
*/

USE CarRepair
GO

IF OBJECT_ID ('dbo.[Logging]') IS NOT NULL
	DROP PROC [dbo].[Logging];
GO

--Логируется каждое соединение
--пользователя с базой данных

CREATE PROCEDURE [dbo].[Logging]
	@Username varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	/*
	IF OBJECT_ID ('[dbo].[Logging_table]') IS NOT NULL
	BEGIN
		CREATE TABLE [Logging_table] (
			IDAuth int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Loggin PRIMARY KEY,
			Username nvarchar(50) NOT NULL,
			[Date] date NOT NULL,
		)
	END
	*/

	INSERT INTO [dbo].[Logging_table] (Username, [Date])
	VALUES (@Username, GETDATE())
END
GO



--Проверка работы процедуры
EXEC [dbo].[Logging]
	@Username = N'jkashlfhsalfkj';
GO
