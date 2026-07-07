CREATE     PROCEDURE [dbo].[USP_TriageAssessment_Create]

(
 @ERVisitId BIGINT,
 @Severity VARCHAR(50),
 @Notes VARCHAR(MAX),

 @TriageId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.TriageAssessment

(
ERVisitId,
Severity,
Notes,
AssessedOn
)

VALUES

(
@ERVisitId,
@Severity,
@Notes,
GETDATE()
);



SET @TriageId=SCOPE_IDENTITY();


END
