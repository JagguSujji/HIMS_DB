/* ==========================================================
   ENTERPRISE HIS SYSTEM
   MISSING IMPORTANT STORED PROCEDURES
   PART 1
   PATIENT + IPD + APPOINTMENT MODULE
   SQL SERVER
========================================================== */


--------------------------------------------------------------
-- PATIENT MODULE
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Patient_GetById]
(
    @PatientId BIGINT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM dbo.Patient
    WHERE PatientId = @PatientId;

END
