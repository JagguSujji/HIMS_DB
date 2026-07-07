/*
=========================================================
 Module 7 : Laboratory Management Stored Procedures
 Database : Hospital Management System
=========================================================
*/


/*******************************************************
 1. Get Lab Test Master
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabTest_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        LT.LabTestId,
        LT.TestCode,
        LT.TestName,
        LT.TestCategoryId,
        TC.TestCategoryName,
        LT.LabSectionId,
        LS.LabSectionName,
        LT.SampleTypeId,
        LT.ResultUnitId,
        LT.IsActive

    FROM dbo.LabTest LT

    LEFT JOIN dbo.TestCategory TC
    ON LT.TestCategoryId = TC.TestCategoryId

    LEFT JOIN dbo.LabSection LS
    ON LT.LabSectionId = LS.LabSectionId

    WHERE LT.IsActive = 1;

END
