


--------------------------------------------------------------
-- 6. Get Radiology Result
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyResult_Get]
(
    @RadiologyResultId INT
)
AS
BEGIN


    SELECT

        RR.RadiologyResultId,
        RR.RadiologyOrderId,
        RR.ResultDate,

        RO.PatientId,
        RO.OrderDate

    FROM dbo.RadiologyResult RR

    INNER JOIN dbo.RadiologyOrder RO
        ON RR.RadiologyOrderId=
           RO.RadiologyOrderId

    WHERE RR.RadiologyResultId=
          @RadiologyResultId;


END
