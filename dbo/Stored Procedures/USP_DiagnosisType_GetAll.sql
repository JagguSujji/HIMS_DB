



/************************************************************
 CLINICAL MASTER
************************************************************/




CREATE     PROCEDURE [dbo].[USP_DiagnosisType_GetAll]
AS
BEGIN

SELECT *

FROM DiagnosisType

WHERE IsActive=1

END
