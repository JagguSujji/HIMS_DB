



CREATE     PROCEDURE [dbo].[USP_Symptom_GetAll]
AS
BEGIN

SELECT *

FROM Symptom

WHERE IsActive=1

END
