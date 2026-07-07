/*
=========================================================
 Module 5 : Diagnosis / Medical Coding Stored Procedures
 Database : Hospital Management System
=========================================================
*/


/*******************************************************
 1. Get ICD10 Diagnosis Master
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_ICD10Diagnosis_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ICD10DiagnosisId,
        ICDCode,
        DiagnosisName,
        ShortDescription,
        ChapterName,
        IsBillable,
        IsActive,
        CreatedOn
    FROM dbo.ICD10Diagnosis
    WHERE IsActive = 1
    ORDER BY DiagnosisName;
END
