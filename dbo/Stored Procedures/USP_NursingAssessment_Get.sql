


/*--------------------------------------------------------
 Nursing Assessment Get
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_NursingAssessment_Get]
(
 @PatientId INT
)
AS
BEGIN

SELECT *
FROM NursingAssessment
WHERE PatientId=@PatientId
ORDER BY CreatedOn DESC;

END
