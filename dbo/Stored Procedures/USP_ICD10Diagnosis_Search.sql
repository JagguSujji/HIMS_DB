


/*******************************************************
 2. Search ICD10 Diagnosis
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_ICD10Diagnosis_Search]
(
    @SearchText VARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ICD10DiagnosisId,
        ICDCode,
        DiagnosisName,
        ShortDescription,
        ChapterName
    FROM dbo.ICD10Diagnosis
    WHERE 
        IsActive = 1
        AND
        (
            ICDCode LIKE '%' + @SearchText + '%'
            OR DiagnosisName LIKE '%' + @SearchText + '%'
        );
END
