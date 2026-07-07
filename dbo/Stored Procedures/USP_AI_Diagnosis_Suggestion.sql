


/*******************************************************
 10. AI Diagnosis Suggestion
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_AI_Diagnosis_Suggestion]
(
    @SymptomOntologyId INT
)
AS
BEGIN

    SELECT

        ADM.DiagnosisMappingId,
        ADM.ICD10Code,
        ICD.DiagnosisName,
        ADM.ConfidenceScore,
        ADM.ClinicalPriority

    FROM dbo.AIDiagnosisMapping ADM

    INNER JOIN dbo.ICD10Diagnosis ICD
    ON ADM.ICD10Code=ICD.ICDCode

    WHERE ADM.SymptomOntologyId=@SymptomOntologyId

    ORDER BY ADM.ConfidenceScore DESC;

END
