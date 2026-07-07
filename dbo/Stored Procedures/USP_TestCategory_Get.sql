CREATE     PROCEDURE [dbo].[USP_TestCategory_Get]

AS
BEGIN

SELECT

TestCategoryId,
TestCategoryCode,
TestCategoryName

FROM dbo.TestCategory

WHERE IsActive=1;

END
