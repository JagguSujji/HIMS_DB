/* ==========================================================
   MODULE 8 : RADIOLOGY / IMAGING MANAGEMENT
   PART 1 : ORDER + MASTER DATA PROCEDURES
   ========================================================== */


--------------------------------------------------------------
-- 1. Create Radiology Order
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyOrder_Create]
(
    @PatientId INT,
    @OrderDate DATETIME,
    @CreatedBy INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.RadiologyOrder
    (
        PatientId,
        OrderDate
    )
    VALUES
    (
        @PatientId,
        ISNULL(@OrderDate,GETDATE())
    );

    SELECT SCOPE_IDENTITY() AS RadiologyOrderId;
END
