USE master 
GO 

IF EXISTS(SELECT * FROM sys.databases WHERE name='CarRepair') 
BEGIN 
DROP DATABASE CarRepair 
END 
GO 

CREATE DATABASE CarRepair 
GO 

USE CarRepair 
GO

CREATE TABLE [Clients] (
	IDClient int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Clients PRIMARY KEY,
	Surname nvarchar(50) NOT NULL,
	Name nvarchar(50) NOT NULL,
	Patronymic nvarchar(50) NOT NULL,
	Discount bigint NOT NULL,
)

GO
CREATE TABLE [Provider] (
	IDProvider int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Provider PRIMARY KEY,
	Name nvarchar(15) NOT NULL,
	Tel bigint NOT NULL,
)

GO
CREATE TABLE [SpareParts] (
	IDPart bigint NOT NULL IDENTITY(1,1) CONSTRAINT PK_SpareParts PRIMARY KEY,
	Title nvarchar(20) NOT NULL,
	Articul bigint NOT NULL,
	Brand nvarchar(20) NOT NULL,
	Price money NOT NULL,
	IDProvider int NOT NULL CONSTRAINT FK_SpareParts_Provider FOREIGN KEY REFERENCES Provider (IDProvider)
)

GO
CREATE TABLE [ServiceType] (
	IDServiceType int NOT NULL IDENTITY(1,1) CONSTRAINT PK_ServiceType PRIMARY KEY,
	Title nvarchar(50) NOT NULL,
	Price money NOT NULL,
	--Brake Services money NOT NULL UNIQUE,
	--Oil Filter Change money NOT NULL UNIQUE,
	--Steering & Suspension money NOT NULL UNIQUE,
	--Electrical Systems Testing money NOT NULL UNIQUE,
)
GO

CREATE TABLE [Cars] (
	IDCar int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Cars PRIMARY KEY,
	IDClient int NOT NULL CONSTRAINT FK_Cars_Clients FOREIGN KEY REFERENCES Clients (IDClient) ON DELETE CASCADE,
	NCar nvarchar(6) NOT NULL,
	Model nvarchar(20) NOT NULL,
	[Year] int NOT NULL,
	Color nvarchar(15) NOT NULL,
	--либо такое создание внешнего ключа
	--CONSTRAINT FK_TempSales_SalesReason FOREIGN KEY (TempID)   
    --REFERENCES Sales.SalesReason (SalesReasonID),
	--**
	--REFERENCES CarRepair.Clients (IDClient),
)

GO
CREATE TABLE [Employee] (
	IDEmployee int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Employee PRIMARY KEY,
	Surname nvarchar(50) NOT NULL,
	Name nvarchar(50) NOT NULL,
	Patronymic nvarchar(50) NOT NULL,
	BirthDate date NOT NULL,
	PassportNumber bigint NOT NULL UNIQUE,
	INN bigint NOT NULL,
	SNILS bigint NOT NULL,
	Telephone bigint NOT NULL
)

/*GO
CREATE TABLE [Services] (
	IDService int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Services PRIMARY KEY,
	IDServiceType int NOT NULL CONSTRAINT FK_Services_ServiceType FOREIGN KEY REFERENCES ServiceType (IDServiceType),
)*/

GO
CREATE TABLE [Job] (
	IDJob int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Job PRIMARY KEY,
	IDEmployee int NOT NULL CONSTRAINT FK_Job_Employee FOREIGN KEY REFERENCES Employee (IDEmployee),
	IDPart bigint NOT NULL CONSTRAINT FK_Job_SpareParts FOREIGN KEY REFERENCES SpareParts (IDPart),
	IDService int NOT NULL CONSTRAINT FK_Job_ServiceType FOREIGN KEY REFERENCES [ServiceType] (IDServiceType)
)

GO
CREATE TABLE [ProvidedServices] (
	IDProvidedService int NOT NULL IDENTITY(1,1) CONSTRAINT PK_ProvidedServices PRIMARY KEY,
	IDJob int NOT NULL CONSTRAINT FK_ProvidedServices_Job FOREIGN KEY REFERENCES Job (IDJob)
)

GO
CREATE TABLE [Contract] (
	IDContract bigint NOT NULL IDENTITY(1,1) CONSTRAINT PK_Contract PRIMARY KEY,
	IDClient int NOT NULL CONSTRAINT FK_Contract_Clients FOREIGN KEY REFERENCES Clients (IDClient),
	Data date NOT NULL,
	TechnicalPassport nvarchar(15) NOT NULL,
	TotalSum money NOT NULL,
	StartDateContract date NOT NULL,
	FinishDateContract date NOT NULL,
	IDProvidedService int NOT NULL CONSTRAINT FK_Contract_ProvidedServices FOREIGN KEY REFERENCES ProvidedServices (IDProvidedService)
)

GO
CREATE TABLE [Schedule] (
	IDNote int NOT NULL IDENTITY(1,1) CONSTRAINT PK_Schedule PRIMARY KEY,
	[DayOfWeek] int NOT NULL,
	StartTime time NOT NULL,
	FinishTime time NOT NULL,
)

GO
CREATE TABLE [ScheduleOfEmployee] (
	IDShedEmp bigint NOT NULL IDENTITY(1,1) CONSTRAINT PK_ScheduleOfEmployee PRIMARY KEY,
	IDNote int NOT NULL CONSTRAINT FK_ScheduleOfEmployee_Schedule FOREIGN KEY REFERENCES Schedule (IDNote),
	IDShedEmpExpiration date NOT NULL,
	IDEmployee int NOT NULL CONSTRAINT FK_ScheduleOfEmployee_Employee FOREIGN KEY REFERENCES Employee (IDEmployee)
)