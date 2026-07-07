/*
=========================================================
 Module 6 : Pharmacy / Medication Management Stored Procedures
 Database : Hospital Management System
=========================================================
*/


/*******************************************************
 1. Drug Master - Get All
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Drug_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        D.DrugId,
        D.DrugName,
        D.DrugCategoryId,
        DC.DrugCategoryName

    FROM dbo.Drug D

    LEFT JOIN dbo.DrugCategory DC
    ON D.DrugCategoryId = DC.DrugCategoryId;
END
