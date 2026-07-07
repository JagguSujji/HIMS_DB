


--------------------------------------------------------------
-- 6. Pending Radiology Worklist
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_Pending_Worklist]
AS
BEGIN


    SELECT


        RW.WorklistId,

        RW.RadiologyOrderId,

        RW.AssignedTo,

        RW.Priority,

        RW.Status,

        RO.PatientId,

        RO.OrderDate


    FROM dbo.RadiologyWorklist RW


    INNER JOIN dbo.RadiologyOrder RO

    ON RW.RadiologyOrderId =
       RO.RadiologyOrderId


    WHERE RW.Status <> 'Completed'


    ORDER BY

        RW.Priority DESC,

        RO.OrderDate;


END
