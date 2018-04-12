USE CarRepair
GO

--INSERT table_name
--	(,,)
--VALUES
--	(,,,)


--Clients
INSERT Clients (Surname, Name, Patronymic, Discount)
VALUES (N'Турченко', N'Павло', N'Павлович', 0)

INSERT Clients (Surname, Name, Patronymic, Discount)
VALUES (N'Кондратов', N'Андрей', N'Петрович', 0)

INSERT Clients (Surname, Name, Patronymic, Discount)
VALUES (N'Пушкин', N'Александр', N'Сергеевич', 15)

INSERT Clients (Surname, Name, Patronymic, Discount)
VALUES (N'Калинина', N'Виктория', N'Валерьевна', 7)


--Cars
INSERT Cars(IDClient, NCar, Model, [Year], Color)
VALUES (1, N'с375сс', N'Volvo', 1998, N'White')

INSERT Cars(IDClient, NCar, Model, [Year], Color)
VALUES (1, N'а627аа', N'Audi', 2001, N'Geen')

INSERT Cars(IDClient, NCar, Model, [Year], Color)
VALUES (2, N'т337нн', N'Lada', 2018, N'Grey')

INSERT Cars(IDClient, NCar, Model, [Year], Color)
VALUES (3, N'х333хх' , N'Lada', 1998, N'Black')

INSERT Cars(IDClient, NCar, Model, [Year], Color)
VALUES (4, N'н627кк', N'Man', 2003, N'Blue')


--ServiceType
INSERT ServiceType(Title, Price)
VALUES (N'Замена передних суппортов', 3500)

INSERT ServiceType(Title, Price)
VALUES (N'Замена топливного фильтра', 800)

INSERT ServiceType(Title, Price)
VALUES (N'Замена воздушного фильтра', 300)

INSERT ServiceType(Title, Price)
VALUES (N'Правка бампера', 2000)

INSERT ServiceType(Title, Price)
VALUES (N'Заправка кондиционера', 900)

INSERT ServiceType(Title, Price)
VALUES (N'Замена ремня ГРМ', 1900)


--Providers
INSERT Provider(Name, Tel)
VALUES (N'BMW parts', 79626195740)

INSERT Provider(Name, Tel)
VALUES (N'Lada parts', 79626195740)

INSERT Provider(Name, Tel)
VALUES (N'Chinese CHERRY', 219626195740)


--Spare Parts
INSERT SpareParts(Title, Articul, Brand, Price, IDProvider)
VALUES (N'Oil pump', 16321, 'DIY inc', 8000, 1)

INSERT SpareParts(Title, Articul, Brand, Price, IDProvider)
VALUES (N'Oil tank', 16324, 'Kakayatokompaniya', 2500, 2)

INSERT SpareParts(Title, Articul, Brand, Price, IDProvider)
VALUES (N'Тормозные колодки', 176321, 'Lada', 1400, 1)

INSERT SpareParts(Title, Articul, Brand, Price, IDProvider)
VALUES (N'Трос сцепления', 97721, 'Kakayatokompaniya', 658, 3)

INSERT SpareParts(Title, Articul, Brand, Price, IDProvider)
VALUES (N'Дверные болты', 16322, 'Kakayatokompaniya', 130, 3)


--Employee
INSERT Employee(Surname, Name, Patronymic, BirthDate, PassportNumber, INN, SNILS, Telephone)
VALUES (N'Антонов', N'Виктор', 'Петрович', '16.10.1999', 134597641, 123456, 1349893345, 79626195741)

INSERT Employee(Surname, Name, Patronymic, BirthDate, PassportNumber, INN, SNILS, Telephone)
VALUES (N'Патронов', N'Антон', 'Хоббитович', '20.12.1989', 134597642, 123456, 1349893345, 79626195744)

INSERT Employee(Surname, Name, Patronymic, BirthDate, PassportNumber, INN, SNILS, Telephone)
VALUES (N'Натужный', N'Ростислав', 'Владимирович', '29.01.1963', 1345976412, 12345633, 134989334556, 79626195743)

INSERT Employee(Surname, Name, Patronymic, BirthDate, PassportNumber, INN, SNILS, Telephone)
VALUES (N'Миронский', N'Сергей', 'Дмитриевич', '13.10.1985', 1345976411, 1234561, 13498933451, 79626195746)

INSERT Employee(Surname, Name, Patronymic, BirthDate, PassportNumber, INN, SNILS, Telephone)
VALUES (N'Иванов', N'Иван', 'Павлович', '16.08.1987', 1345976413, 1234563, 13498933453, 79626195747)


--Job
INSERT Job(IDEmployee, IDPart, IDService)
VALUES (1, 3, 1)

INSERT Job(IDEmployee, IDPart, IDService)
VALUES (2, 3, 1)

INSERT Job(IDEmployee, IDPart, IDService)
VALUES (1, 3, 1)

INSERT Job(IDEmployee, IDPart, IDService)
VALUES (3, 3, 3)


--Schedule
INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (1, '8:30', '14:45')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (1, '14:45', '19:00')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (2, '8:30', '14:45')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (2, '14:45', '19:00')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (3, '8:30', '14:45')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (3, '14:45', '19:00')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (4, '8:30', '14:45')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (4, '14:45', '19:00')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (5, '8:30', '14:45')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (5, '14:45', '19:00')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (6, '8:30', '14:45')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (6, '14:45', '19:00')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (7, '8:30', '14:45')

INSERT Schedule([DayOfWeek], StartTime, FinishTime)
VALUES (7, '14:45', '19:00')


--Schedule of employee
--Каждый работает 5 смен в неделю
--Worker №1
INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (1, '13.11.2022', 1)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (3, '13.11.2022', 1)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (5, '13.11.2022', 1)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (7, '13.11.2022', 1)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (9, '13.11.2022', 1)

--Worker №2
INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (1, '13.11.2022', 2)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (3, '13.11.2022', 2)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (5, '13.11.2022', 2)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (7, '13.11.2022', 2)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (9, '13.11.2022', 2)

--Worker №3
INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (1, '13.11.2022', 3)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (2, '13.11.2022', 3)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (3, '13.11.2022', 3)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (4, '13.11.2022', 3)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (5, '13.11.2022', 3)

--Worker №4
INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (2, '13.11.2022', 4)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (4, '13.11.2022', 4)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (6, '13.11.2022', 4)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (8, '13.11.2022', 4)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (9, '13.11.2022', 4)

--Worker №5
INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (1, '13.11.2022', 5)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (3, '13.11.2022', 5)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (5, '13.11.2022', 5)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (7, '13.11.2022', 5)

INSERT ScheduleOfEmployee(IDNote, IDShedEmpExpiration, IDEmployee)
VALUES (9, '13.11.2022', 5)

--Provided Services
INSERT ProvidedServices(IDJob)
VALUES (1)

INSERT ProvidedServices(IDJob)
VALUES (2)

INSERT ProvidedServices(IDJob)
VALUES (3)

INSERT ProvidedServices(IDJob)
VALUES (4)

--Contract
--Data - это дата обращения, startdate - дата начала работ
INSERT [Contract](IDClient, Data, TechnicalPassport, StartDateContract, FinishDateContract, TotalSum, IDProvidedService)
VALUES (1, '17.08.2013', '1566469879331', '20.08.2013', '20.09.2013', 10000, 1)

INSERT [Contract](IDClient, Data, TechnicalPassport, StartDateContract, FinishDateContract, TotalSum, IDProvidedService)
VALUES (2, '12.05.2016', '1566469879331', '13.05.2016', '20.05.2016', 18320, 2)

INSERT [Contract](IDClient, Data, TechnicalPassport, StartDateContract, FinishDateContract, TotalSum, IDProvidedService)
VALUES (3, '17.08.2017', '9452170101587', '20.08.2017', '20.09.2017', 1500, 3)

INSERT [Contract](IDClient, Data, TechnicalPassport, StartDateContract, FinishDateContract, TotalSum, IDProvidedService)
VALUES (4, '17.08.2017', '84531092131', '20.08.2017', '20.09.2017', 9600, 4)