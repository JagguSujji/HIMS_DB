CREATE     PROCEDURE [dbo].[USP_TriageAssessment_Save]


(
 @ERVisitId BIGINT,

 @Severity VARCHAR(50),

 @Notes VARCHAR(MAX)

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



END
