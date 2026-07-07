


/*--------------------------------------------------------
 Nursing Assessment Save
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_NursingAssessment_Save]
(
 @PatientId INT,
 @EncounterId INT,
 @AssessmentText NVARCHAR(MAX),
 @CreatedBy INT
)
AS
BEGIN

INSERT INTO NursingAssessment
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

SELECT SCOPE_IDENTITY() NursingAssessmentId;

END
