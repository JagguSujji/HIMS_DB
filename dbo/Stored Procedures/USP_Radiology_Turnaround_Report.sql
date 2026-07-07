


--------------------------------------------------------------
-- 4. Radiology Turnaround Time Report
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_Turnaround_Report]
(
    @FromDate DATE,
    @ToDate DATE
)
AS
BEGIN


    SELECT

        RO.RadiologyOrderId,

        RO.PatientId,

        RO.OrderDate,

        RR.ResultDate,


        DATEDIFF
        (
            MINUTE,
            RO.OrderDate,
            RR.ResultDate
        )
        AS TurnaroundMinutes


    FROM dbo.RadiologyOrder RO


    INNER JOIN dbo.RadiologyResult RR

        ON RO.RadiologyOrderId =
           RR.RadiologyOrderId


    WHERE CAST(RO.OrderDate AS DATE)
    BETWEEN @FromDate AND @ToDate


    ORDER BY RO.OrderDate;


END
