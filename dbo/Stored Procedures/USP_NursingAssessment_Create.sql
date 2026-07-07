CREATE     PROCEDURE [dbo].[USP_NursingAssessment_Create]


(
 @PatientId BIGINT,

 @EncounterId BIGINT,

 @AssessmentText VARCHAR(MAX)

)

AS
BEGIN


INSERT INTO dbo.NursingAssessment

(
PatientId,
EncounterId,
AssessmentText,
CreatedOn
)


VALUES

(
@PatientId,
@EncounterId,
@AssessmentText,
GETDATE()
);



END
