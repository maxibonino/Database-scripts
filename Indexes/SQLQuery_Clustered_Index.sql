USE CarRepair
GO

--CLUSTERED
--Unique

CREATE UNIQUE CLUSTERED INDEX ID_Car
ON Cars (IDCar)

SET STATISTICS IO ON;
SET STATISTICS TIME ON;


SELECT *
FROM Cars WHERE IDCar > 100;


SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

DROP INDEX ID_Cars ON Cars



--Composite

CREATE CLUSTERED INDEX IDClient_Year_INDEX
ON [dbo].[Cars] (IDClient, [Year])

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT IDClient, [Year]
FROM [dbo].[Cars]
WHERE IDClient BETWEEN 1000 AND 8000 AND [Year] > 2003;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

DROP INDEX IDClient_Year_INDEX


--Covering
CREATE CLUSTERED INDEX ALL_COLLUMNS_INDEX
ON Cars (IDCar, IDClient, NCar, Model, [Year], Color)

SET STATISTICS IO ON;
SET STATISTICS TIME ON;


SELECT IDCar, IDClient, NCar, Model, [Year], Color
FROM Cars
WHERE [Year] > 2003 AND LEN(Model) > 4


SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

DROP INDEX ALL_COLLUMNS_INDEX ON Cars;


--Composite index again
--having

CREATE CLUSTERED INDEX IDCar_Model_Color_INDEX
ON Cars (IDCar, Model, Color)

SET STATISTICS IO ON;
SET STATISTICS IO ON;


USE CarRepair
GO

SELECT COUNT(Color) AS N'�������� �������', Model
FROM Cars
GROUP BY Model
HAVING COUNT(Color) > 5
ORDER BY COUNT(Color) DESC