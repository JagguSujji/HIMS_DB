


/*--------------------------------------------------------
 Treatment Plan Detail Save
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_TreatmentPlanDetail_Save]
(
 @CarePlanId INT,
 @Activity NVARCHAR(MAX),
 @StartDate DATE,
 @EndDate DATE,
 @Status VARCHAR(50),
 @Notes NVARCHAR(MAX)
)
AS
BEGIN

INSERT INTO TreatmentPlanDetail
(
 CarePlanId,
 Activity,
 StartDate,
 EndDate,
 Status,
 Notes
)
VALUES
(
 @CarePlanId,
 @Activity,
 @StartDate,
 @EndDate,
 @Status,
 @Notes
);

SELECT SCOPE_IDENTITY() TreatmentPlanDetailId;

END
