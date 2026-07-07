/* ==========================================================
   MODULE 8 : RADIOLOGY / IMAGING MANAGEMENT
   PART 2 : WORKLIST + RESULT + REPORT MANAGEMENT
   ========================================================== */


--------------------------------------------------------------
-- 1. Create Radiology Worklist
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyWorklist_Create]
(
    @RadiologyOrderId INT,
    @AssignedTo INT = NULL,
    @Priority VARCHAR(20) = 'Normal'
)
AS
BEGIN
    SET NOCOUNT ON;


    INSERT INTO dbo.RadiologyWorklist
    (
        RadiologyOrderId,
        AssignedTo,
        Priority,
        Status,
        CreatedOn
    )
    VALUES
    (
        @RadiologyOrderId,
        @AssignedTo,
        @Priority,
        'Pending',
        GETDATE()
    );


    SELECT SCOPE_IDENTITY() AS WorklistId;

END
