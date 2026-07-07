


/*******************************************************
 4. Drug Category Master
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_DrugCategory_GetAll]
AS
BEGIN

    SELECT *
    FROM dbo.DrugCategory
    WHERE IsActive=1;

END
