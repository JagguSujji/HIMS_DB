CREATE     PROCEDURE [dbo].[USP_TreatmentPlan_Add]


(
 @CarePlanId BIGINT,
 @Activity VARCHAR(500),
 @StartDate DATE,
 @EndDate DATE
)

AS
BEGIN


INSERT INTO dbo.TreatmentPlanDetail

(
CarePlanId,
Activity,
StartDate,
EndDate,
Status
)

VALUES

(
@CarePlanId,
@Activity,
@StartDate,
@EndDate,
'ACTIVE'
);



END
