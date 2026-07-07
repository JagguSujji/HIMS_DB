


--------------------------------------------------------------
-- 7. Detailed Patient Radiology History
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_Patient_History_Detailed]
(
    @PatientId INT
)
AS
BEGIN


    SELECT


        RO.RadiologyOrderId,

        RO.OrderDate,


        RP.ProcedureName,


        IT.ImagingName,


        RR.RadiologyResultId,

        RR.ResultDate,


        COUNT(RI.ImageId)
        AS ImageCount


    FROM dbo.RadiologyOrder RO


    LEFT JOIN dbo.RadiologyResult RR

    ON RO.RadiologyOrderId =
       RR.RadiologyOrderId


    LEFT JOIN dbo.RadiologyImageStorage RI

    ON RR.RadiologyResultId =
       RI.RadiologyResultId


    LEFT JOIN dbo.RadiologyProcedure RP

    ON RP.RadiologyProcedureId =
       RR.RadiologyResultId


    LEFT JOIN dbo.ImagingType IT

    ON RP.ImagingTypeId =
       IT.ImagingTypeId


    WHERE RO.PatientId=@PatientId


    GROUP BY

        RO.RadiologyOrderId,
        RO.OrderDate,
        RP.ProcedureName,
        IT.ImagingName,
        RR.RadiologyResultId,
        RR.ResultDate;


END
