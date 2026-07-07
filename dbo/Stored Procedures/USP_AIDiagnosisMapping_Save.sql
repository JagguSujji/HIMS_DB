


/*******************************************************
 9. Save AI Diagnosis Mapping
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_AIDiagnosisMapping_Save]
(
    @SymptomOntologyId INT,
    @ICD10Code VARCHAR(50),
    @ConfidenceScore DECIMAL(5,2),
    @ClinicalPriority VARCHAR(50)
)
AS
BEGIN


    INSERT INTO dbo.AIDiagnosisMapping
    (
        SymptomOntologyId,
        ICD10Code,
        ConfidenceScore,
        ClinicalPriority
    )
    VALUES
    (
        @SymptomOntologyId,
        @ICD10Code,
        @ConfidenceScore,
        @ClinicalPriority
    );

END
