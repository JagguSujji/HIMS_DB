CREATE     PROCEDURE [dbo].[USP_Master_Search]


(
 @TableName VARCHAR(100),

 @SearchText VARCHAR(100)

)

AS
BEGIN


DECLARE @SQL NVARCHAR(MAX)



SET @SQL =

'SELECT TOP 50 * FROM '

+QUOTENAME(@TableName)

+' WHERE 1=1';



EXEC sp_executesql @SQL;



END
