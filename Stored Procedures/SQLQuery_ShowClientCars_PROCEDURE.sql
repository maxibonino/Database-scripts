USE CarRepair
GO

IF OBJECT_ID ('dbo.ShowClientCars') IS NOT NULL
	DROP PROC [dbo].[ShowClientCars];
GO

CREATE PROCEDURE [dbo].[ShowClientCars]
	@CarsCursor CURSOR VARYING OUTPUT,
	@IDClient int
AS
BEGIN
	SET NOCOUNT ON;
	SET @CarsCursor = CURSOR
	FORWARD_ONLY STATIC FOR
		SELECT Model, NCar, Color
		FROM Cars
		WHERE Cars.IDClient = @IDClient
	OPEN @CarsCursor
END
GO

DECLARE @MyCarsCursor CURSOR;

EXEC [dbo].[ShowClientCars] @IDClient = 337, @CarsCursor = @MyCarsCursor OUTPUT;
FETCH NEXT FROM @MyCarsCursor;
WHILE (@@FETCH_STATUS = 0)
BEGIN
	FETCH NEXT FROM @MyCarsCursor;
END

CLOSE @MyCarsCursor;
DEALLOCATE @MyCarsCursor;
GO
