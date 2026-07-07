


--------------------------------------------------------------
-- 4. Assign Radiologist
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyWorklist_Assign]
(
    @WorklistId INT,
    @RadiologistId INT
)
AS
BEGIN


    UPDATE dbo.RadiologyWorklist

    SET

        AssignedTo=@RadiologistId,
        Status='Assigned'

    WHERE WorklistId=@WorklistId;


    SELECT 1 AS Success;

END
