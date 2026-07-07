CREATE     PROCEDURE [dbo].[USP_DrugCategory_Get]

AS
BEGIN


SELECT

DrugCategoryId,
DrugCategoryCode,
DrugCategoryName


FROM dbo.DrugCategory


WHERE IsActive=1;


END
