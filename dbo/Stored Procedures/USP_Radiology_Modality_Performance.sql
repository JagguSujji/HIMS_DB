


--------------------------------------------------------------
-- 5. Modality Performance Report
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_Modality_Performance]
(
    @FromDate DATE,
    @ToDate DATE
)
AS
BEGIN


    SELECT


        IT.ImagingName,


        COUNT(RO.RadiologyOrderId)
        AS TotalCases,


        SUM
        (
            CASE
            WHEN RW.Status='Completed'
            THEN 1
            ELSE 0
            END
        )
        AS CompletedCases,


        AVG
        (
            DATEDIFF
            (
                MINUTE,
                RO.OrderDate,
                RR.ResultDate
            )
        )
        AS AvgTATMinutes


    FROM dbo.RadiologyOrder RO


    INNER JOIN dbo.RadiologyWorklist RW

        ON RO.RadiologyOrderId =
           RW.RadiologyOrderId


    LEFT JOIN dbo.RadiologyResult RR

        ON RO.RadiologyOrderId =
           RR.RadiologyOrderId


    INNER JOIN dbo.RadiologyProcedure RP

        ON RP.RadiologyProcedureId =
           RR.RadiologyResultId


    INNER JOIN dbo.ImagingType IT

        ON IT.ImagingTypeId =
           RP.ImagingTypeId


    WHERE CAST(RO.OrderDate AS DATE)
    BETWEEN @FromDate AND @ToDate


    GROUP BY IT.ImagingName;


END
