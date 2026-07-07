


--------------------------------------------------------------
-- 2. Today's Radiology Worklist
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyWorklist_Today]
(
    @AssignedTo INT = NULL
)
AS
BEGIN

    SET NOCOUNT ON;


    SELECT

        RW.WorklistId,
        RW.RadiologyOrderId,
        RW.AssignedTo,
        RW.Priority,
        RW.Status,
        RW.CreatedOn,

        RO.PatientId,
        RO.OrderDate

    FROM dbo.RadiologyWorklist RW

    INNER JOIN dbo.RadiologyOrder RO
        ON RW.RadiologyOrderId =
           RO.RadiologyOrderId

    WHERE CAST(RW.CreatedOn AS DATE)
          =
          CAST(GETDATE() AS DATE)

    AND
    (
        @AssignedTo IS NULL
        OR RW.AssignedTo=@AssignedTo
    )

    ORDER BY
        RW.Priority DESC,
        RW.CreatedOn;

END
