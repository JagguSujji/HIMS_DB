


/*******************************************************
 4. Save Encounter Diagnosis
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_EncounterDiagnosis_Save]
(
    @EncounterDiagnosisId INT = NULL,
    @EncounterId INT,
    @ICD10Code VARCHAR(50),
    @DiagnosisType VARCHAR(50),
    @IsConfirmed BIT,
    @CreatedOn DATETIME = NULL
)
AS
BEGIN
    SET NOCOUNT ON;


    IF EXISTS
    (
        SELECT 1 
        FROM dbo.EncounterDiagnosis
        WHERE EncounterDiagnosisId = @EncounterDiagnosisId
    )
    BEGIN

        UPDATE dbo.EncounterDiagnosis
        SET
            ICD10Code = @ICD10Code,
            DiagnosisType = @DiagnosisType,
            IsConfirmed = @IsConfirmed
        WHERE EncounterDiagnosisId = @EncounterDiagnosisId;

    END
    ELSE
    BEGIN

        INSERT INTO dbo.EncounterDiagnosis
        (
            EncounterId,
            ICD10Code,
            DiagnosisType,
            IsConfirmed,
            CreatedOn
        )
        VALUES
        (
            @EncounterId,
            @ICD10Code,
            @DiagnosisType,
            @IsConfirmed,
            ISNULL(@CreatedOn,GETDATE())
        );

    END
END
