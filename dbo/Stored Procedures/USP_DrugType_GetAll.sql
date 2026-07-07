







/************************************************************
 PHARMACY MASTER
************************************************************/


CREATE     PROCEDURE [dbo].[USP_DrugType_GetAll]
AS
BEGIN

SELECT *

FROM DrugType

WHERE IsActive=1

END
