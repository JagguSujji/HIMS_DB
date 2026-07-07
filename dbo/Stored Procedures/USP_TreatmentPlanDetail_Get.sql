


---------------------------------------------------------------
-- 22. Treatment Plan Get
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_TreatmentPlanDetail_Get]
(
 @CarePlanId INT
)
AS
BEGIN

SELECT *
FROM dbo.TreatmentPlanDetail
WHERE CarePlanId=@CarePlanId;

END
