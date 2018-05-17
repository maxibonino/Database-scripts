USE [CarRepair]
GO

/****** Object:  View [dbo].[View_1]    Script Date: 5/18/2018 2:08:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_1] WITH ENCRYPTION
AS
SELECT        TOP (100) PERCENT dbo.Contract.IDContract, dbo.Contract.IDClient, dbo.Contract.FinishDateContract, dbo.Clients.Surname, dbo.Clients.Name, dbo.Cars.Model, 
                         dbo.Cars.[Year], dbo.Cars.Color
FROM            dbo.Contract INNER JOIN
                         dbo.Clients ON dbo.Contract.IDClient = dbo.Clients.IDClient INNER JOIN
                         dbo.Cars ON dbo.Clients.IDClient = dbo.Cars.IDClient
WHERE        (LEN(dbo.Cars.Color) > 4)
ORDER BY dbo.Cars.[Year]

GO

EXEC sp_helptext 'View_1'

DROP VIEW View_1