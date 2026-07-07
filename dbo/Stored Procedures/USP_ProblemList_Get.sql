


/*******************************************************
 7. Get Patient Problem List
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_ProblemList_Get]
(
    @PatientId INT
)
AS
BEGIN

    SELECT
        PL.ProblemId,
        PL.PatientId,
        PL.ICDCode,
        ICD.DiagnosisName,
        PL.ProblemName,
        PL.Status,
        PL.OnsetDate

    FROM dbo.ProblemList PL

    LEFT JOIN dbo.ICD10Diagnosis ICD
    ON PL.ICDCode=ICD.ICDCode

    WHERE PL.PatientId=@PatientId;

END
