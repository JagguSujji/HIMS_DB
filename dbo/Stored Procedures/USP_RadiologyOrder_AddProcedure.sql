


--------------------------------------------------------------
-- 3. Add Procedure To Radiology Order
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyOrder_AddProcedure]
(
    @RadiologyOrderId INT,
    @ProcedureCode VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS
    (
        SELECT 1 
        FROM dbo.RadiologyProcedure
        WHERE ProcedureCode=@ProcedureCode
    )
    BEGIN
        RAISERROR('Invalid Radiology Procedure',16,1);
        RETURN;
    END


    SELECT
        @RadiologyOrderId AS RadiologyOrderId,
        ProcedureCode,
        ProcedureName
    FROM dbo.RadiologyProcedure
    WHERE ProcedureCode=@ProcedureCode;

END
