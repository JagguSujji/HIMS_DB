


---------------------------------------------------------------
-- 12. Care Plan Get
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_CarePlan_Get]
(
 @PatientId INT
)
AS
BEGIN

SELECT *
FROM dbo.CarePlan
WHERE PatientId=@PatientId;

END
