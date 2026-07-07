


--------------------------------------------------------------
-- 3. Update Worklist Status
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyWorklist_UpdateStatus]
(
    @WorklistId INT,
    @Status VARCHAR(50)
)
AS
BEGIN

    UPDATE dbo.RadiologyWorklist

    SET Status=@Status

    WHERE WorklistId=@WorklistId;


    SELECT @@ROWCOUNT AS UpdatedRows;

END
