USE CarRepair
GO

--NONCLUSTERED

--Unique

CREATE NONCLUSTERED INDEX IDClient_INDEX
ON Cars (IDCar, IDClient)

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT Cars.IDClient, Clients.Surname
FROM Cars INNER JOIN Clients ON Cars.IDClient = Clients.IDClient
WHERE IDCar > 100

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;



--Composite

CREATE NONCLUSTERED INDEX IDContract_IDClient_INDEX 
ON [Contract] (IDContract, IDClient)

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT IDContract, IDClient
FROM [Contract]
WHERE IDContract IN(1, 101) AND IDClient > 1

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

DROP INDEX IDContract_IDClient_INDEX  ON [Contract]


--Covering

CREATE NONCLUSTERED INDEX IDContract_IDClient_Data_TotalSum_INDEX
ON [Contract] (IDContract, IDClient, Data, TotalSum)

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT IDContract, IDClient, Data, TotalSum
FROM [Contract]
WHERE TotalSum > 2500 AND Data BETWEEN CONVERT(datetime, '26.05.1998', 104) AND CONVERT(datetime, '28.09.2003', 104)

DROP INDEX IDContract_IDClient_Data_TotalSum_INDEX ON [Contract]


--Index with Included Columns

CREATE NONCLUSTERED INDEX DeadLine_Index
ON [Contract] (IDClient, TechnicalPassport)
INCLUDE(FinishDateContract)

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT [Contract].IDClient, Surname, Name, TechnicalPassport, FinishDateContract AS N'Срок окончания работ'
FROM [Contract] INNER JOIN Clients ON [Contract].IDClient = Clients.IDClient
WHERE FinishDateContract BETWEEN CONVERT(datetime, '26.05.1998', 104) AND CONVERT(datetime, '28.09.2016', 104)

DROP INDEX DeadLine_Index ON [Contract]