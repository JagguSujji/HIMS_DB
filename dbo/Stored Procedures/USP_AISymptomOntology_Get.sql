



/************************************************************
 CLINICAL AI DIAGNOSIS
************************************************************/


CREATE     PROCEDURE [dbo].[USP_AISymptomOntology_Get]
AS
BEGIN

SELECT *
FROM AISymptomOntology
WHERE IsActive=1

END
