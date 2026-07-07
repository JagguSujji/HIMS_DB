


/*******************************************************
 5. Get Encounter Diagnosis
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_EncounterDiagnosis_Get]
(
    @EncounterId INT
)
AS
BEGIN
    SET NOCOUNT ON;


    SELECT
        ED.EncounterDiagnosisId,
        ED.EncounterId,
        ED.ICD10Code,
        ICD.DiagnosisName,
        ED.DiagnosisType,
        ED.IsConfirmed,
        ED.CreatedOn
    FROM dbo.EncounterDiagnosis ED

    LEFT JOIN dbo.ICD10Diagnosis ICD
    ON ED.ICD10Code = ICD.ICDCode

    WHERE ED.EncounterId=@EncounterId;

END
