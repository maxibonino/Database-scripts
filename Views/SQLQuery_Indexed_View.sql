USE [CarRepair]
GO

/****** Object:  View [dbo].[View_1]    Script Date: 5/18/2018 2:08:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------------------------------------------------------------------------
SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL,
ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON;
-------------------------------------------------------------------------------------------------------------------------------
GO

--View
CREATE VIEW [dbo].[Indexed_View]
WITH SCHEMABINDING
AS
SELECT [dbo].Cars.IDCar, [dbo].Cars.IDClient, [dbo].Clients.Surname
FROM [dbo].Cars INNER JOIN [dbo].Clients ON [dbo].Cars.IDClient = [dbo].Clients.IDClient
WHERE [dbo].Cars.IDCar > 100


GO


--Creating clustered index for view
CREATE UNIQUE CLUSTERED INDEX IDClient_INDEX
ON [Indexed_View] (IDCar, IDClient)



EXEC sp_helptext 'Indexed_View'

SET STATISTICS TIME ON;
SELECT *
FROM [Indexed_View]
SET STATISTICS TIME OFF;

SET STATISTICS TIME ON;
SELECT Cars.IDClient, Clients.Surname
FROM Cars INNER JOIN Clients ON Cars.IDClient = Clients.IDClient
WHERE IDCar > 100
SET STATISTICS TIME OFF;

DROP VIEW [Indexed_View]