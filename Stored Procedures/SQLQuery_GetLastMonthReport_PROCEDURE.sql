USE CarRepair
GO

IF OBJECT_ID ('dbo.GetLastMonthReport') IS NOT NULL
	DROP PROC [dbo].[GetLastMonthReport];
GO

CREATE PROCEDURE [dbo].[GetLastMonthReport]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @MonthProfit int

	SELECT @MonthProfit = SUM(TotalSum)
	FROM [CarRepair].[dbo].[Contract]
	WHERE FinishDateContract BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()

	RETURN @MonthProfit
END
GO


EXEC [dbo].[GetLastMonthReport];
GO