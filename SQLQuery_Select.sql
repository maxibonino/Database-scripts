USE CarRepair
GO

--INNER JOIN
/*SELECT *
FROM [Contract] INNER JOIN Clients
ON [Contract].[IDClient] = [Clients].[IDClient]*/

--INNER JOIN
--Какие клиентские машины ремонтировались в нашем СТО
/*SELECT *
FROM Clients INNER JOIN Cars
ON [Clients].[IDClient] = [Cars].[IDClient]*/


--FULL OUTER JOIN
/*SELECT *
FROM [Contract] FULL OUTER JOIN Clients
ON [Contract].[IDClient] = [Clients].[IDClient]*/

--LEFT OUTER JOIN
--Если есть слово full, right, left, то outer можно опустить
/*SELECT *
FROM [Contract] LEFT OUTER JOIN Clients
ON [Contract].[IDClient] = [Clients].[IDClient]*/

--RIGHT OUTER JOIN
/*SELECT *
FROM [Contract] RIGHT OUTER JOIN Clients
ON [Contract].[IDClient] = [Clients].[IDClient]*/

--CROSS JOIN
/*SELECT *
FROM [Clients] CROSS JOIN [Cars]*/

--Просто join
/*SELECT [Contract].[IDContract], [Clients].[Name]
FROM [Contract] JOIN Clients
ON [Contract].[IDClient]=[Clients].[IDClient]*/

--CROSS APPLY
/*SELECT *
FROM [Cars] CROSS APPLY [dbo].[Clients]*/

--SELF-JOIN
--Бессмысленный и беспощадный
/*SELECT *
FROM Clients Client1, Clients Client2
WHERE Client1.IDClient <> Client2.IDClient
ORDER BY Client1.Discount*/

--ПРИМЕР JOIN
/*SELECT Client.IDClient, Car.*
FROM 
Clients Client JOIN Cars Car ON Client.IDClient = Car.IDClient;*/
--равносильный ему запрос
/*SELECT Client.IDClient, Car.*
FROM Clients Client
CROSS APPLY
(SELECT * FROM Cars Car WHERE Client.IDClient = Car.IDClient) Car;*/

--EXISTS
--Выбираем только тех пользователей, у которых машина Audi
/*SELECT Name, Surname
FROM [Clients] AS CL
WHERE EXISTS(SELECT Model FROM Cars WHERE Model = N'Audi' AND CL.IDClient = Cars.IDClient)*/

--IN
/*SELECT *
FROM [dbo].[Employee]
WHERE [dbo].[Employee].IDEmployee IN (SELECT IDEmployee FROM [dbo].[ScheduleOfEmployee])*/

--BETWEEN
/*SELECT Name, Surname
FROM Employee
WHERE Employee.BirthDate BETWEEN '1.01.1987' AND GETDATE()*/

--ANY/SOME
--Выводит только владельцев машины Audi(У кого есть хотя бы одна машина этой марки)
/*SELECT *
FROM Clients
WHERE Clients.IDClient = ANY(SELECT IDClient FROM Cars WHERE Model = N'Audi')*/

--ALL
--Если у человека все машины определённой марки
/*SELECT *
FROM Clients
WHERE N'Lada' = ALL(SELECT Model FROM Cars WHERE Clients.IDClient = Cars.IDClient)*/


--LIKE
--Выводим фамилию и имя тех клиентов, у которых отчество заканчивается на -вна
/*SELECT Surname, Name, Patronymic
FROM Clients
WHERE Patronymic LIKE '%вна'*/

/*
SELECT IDClient, Data, TotalSum,
CASE
	WHEN TotalSum >= 10000 THEN 'Дорогостоящий ремонт'
	WHEN TotalSum > 5000 THEN 'Средняя'
	WHEN TotalSum > 3000 THEN 'Незначительная поломка'
	ELSE 'Вообще копейки'
END
FROM [Contract]*/


/*SELECT CAST(TotalSum AS int)
FROM [Contract]*/


--Меняется стиль вывода даты
/*
SELECT CONVERT(varchar(11), Data, 111)
FROM [Contract]

SELECT CONVERT(varchar(11), Data, 100)
FROM [Contract]*/

--IS NOT NULL
/*SELECT *
FROM [Contract]
WHERE IDContract IS NOT NULL*/


--NULLIF
--Если модель - Man, то NULL
/*SELECT NULLIF(Cars.Model, N'Man') AS Car
FROM Clients, Cars
WHERE Clients.IDClient = Cars.IDClient*/

--ISNULL
--Проверка, если скидка у клиента NULL, то будет 'No discount'
/*SELECT ISNULL(Clients.Discount, N'No discount')
FROM Clients*/


--IIF
--Функция iif
/*SELECT Clients.Name, IIF(Cars.Model = N'Lada', N'4etkiy pacan', N'Ne lada') AS [4etkiy_pacan]
FROM Clients, Cars
WHERE Clients.IDClient = Cars.IDClient*/

--STUFF
--STUFF(string1, start position, len of string2, string2)
/*SELECT STUFF(Client.Name, 1, 1, N'П') AS N'Новое имя'
FROM Clients Client*/

--REPLACE
--Утраивание буквы
/*SELECT REPLACE(C.Name, N'р', N'ррр') AS 'New name'
FROM Clients C*/

--UPPER
/*SELECT C.IDClient, UPPER(C.Name) AS N'Всё капсом'
FROM Clients C*/

/*SELECT DATEDIFF(YEAR, CONVERT(date,'1960', 104), GETDATE())
FROM [Contract] CT*/

--DATEDIFF
/*SELECT DATEDIFF(YEAR, CT.StartDateContract, GETDATE()) AS N'Сколько лет прошло с начала технических работ'
FROM [Contract] CT*/


/*SELECT TotalSum
FROM [Contract] CT
GROUP BY TotalSum*/

--GROUP BY
--Группируем по количеству моделей, сортируем по убыванию
/*SELECT COUNT(Client.IDClient) AS N'Количество моделей', Model
FROM Clients Client, Cars Car
WHERE Client.IDClient = Car.IDCar
GROUP BY Model
ORDER BY COUNT(Client.IDClient) DESC*/

--HAVING
--У каких клиентов больше одной машины
SELECT COUNT(Client.Name) AS N'Кол-во машин у клиента', Client.Name, Client.Surname
FROM Clients Client, Cars Car
WHERE Client.IDClient = Car.IDClient
GROUP BY Client.Name, Client.Surname
HAVING COUNT(Client.Name) > 1
ORDER BY COUNT(N'Кол-во машин у клиента') DESC