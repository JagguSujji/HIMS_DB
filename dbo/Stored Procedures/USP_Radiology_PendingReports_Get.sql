


--------------------------------------------------------------
-- 11. Pending Radiology Reports
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_PendingReports_Get]
AS
BEGIN


    SELECT

        RW.WorklistId,
        RW.RadiologyOrderId,
        RW.AssignedTo,
        RW.Status,
        RW.CreatedOn,

        RO.PatientId,
        RO.OrderDate

    FROM dbo.RadiologyWorklist RW

    INNER JOIN dbo.RadiologyOrder RO

    ON RW.RadiologyOrderId=
       RO.RadiologyOrderId


    WHERE RW.Status
    IN
    (
        'Pending',
        'Assigned',
        'InProgress'
    )

    ORDER BY RW.CreatedOn;


END
