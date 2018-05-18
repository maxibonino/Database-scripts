USE [CarRepair]
GO

/****** Object:  View [dbo].[View_1]    Script Date: 5/18/2018 2:08:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Check_View]
AS
SELECT dbo.[SpareParts].Title,
	dbo.[SpareParts].Articul,
	dbo.[SpareParts].Brand,
	dbo.[SpareParts].Price,
	dbo.[SpareParts].IDProvider
FROM SpareParts
WHERE Price = 1337

WITH CHECK OPTION

GO

EXEC sp_helptext 'Check_View'



INSERT INTO [dbo].[Check_View] (Title, Articul, Brand, Price, IDProvider)
VALUES (N'SparePart', 657932, N'Geely inc.', 1337, 17)

INSERT INTO [dbo].[Check_View] (Title, Articul, Brand, Price, IDProvider)
VALUES (N'SparePart', 657932, N'Geely inc.', 2000, 17)

SELECT Price, IDProvider
FROM SpareParts
WHERE Price = 2000

SELECT Price, IDProvider
FROM [dbo].[Check_View]
WHERE Price = 1337

DROP VIEW [Check_View]