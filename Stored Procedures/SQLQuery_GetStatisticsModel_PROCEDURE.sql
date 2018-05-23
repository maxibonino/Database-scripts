USE CarRepair
GO

IF OBJECT_ID ('dbo.GetStatisticsModel') IS NOT NULL
	DROP PROC [dbo].[GetStatisticsModel];
GO

--Посдчёт количества поломок
--конретной модели автомобиля,
--сортируя по году выпуска(для каждой модели)

CREATE PROCEDURE [dbo].[GetStatisticsModel]
	@ModelCarCursor CURSOR VARYING OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SET @ModelCarCursor = CURSOR
	FORWARD_ONLY STATIC FOR
	SELECT COUNT(Model), Model, [Year]
	FROM [CarRepair].[dbo].[Cars]
	GROUP BY Model, [Year]
	ORDER BY [Year]

	OPEN @ModelCarCursor
END
GO


DECLARE @MyCC CURSOR;

EXEC [dbo].[GetStatisticsModel] @ModelCarCursor = @MyCC OUTPUT;

WHILE (@@FETCH_STATUS = 0)
BEGIN
	FETCH NEXT FROM @MyCC;
END
CLOSE @MyCC;
DEALLOCATE @MyCC;
GO