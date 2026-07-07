


---------------------------------------------------------------
-- 11. Care Plan Update
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_CarePlan_Update]
(
 @CarePlanId INT,
 @PlanText NVARCHAR(MAX),
 @EndDate DATE
)
AS
BEGIN

UPDATE dbo.CarePlan
SET
PlanText=@PlanText,
EndDate=@EndDate

WHERE CarePlanId=@CarePlanId;

END
