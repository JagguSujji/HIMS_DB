


/*******************************************************
 5. Drug Form Master
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_DrugForm_GetAll]
AS
BEGIN

    SELECT *
    FROM dbo.DrugForm
    WHERE IsActive=1;

END
