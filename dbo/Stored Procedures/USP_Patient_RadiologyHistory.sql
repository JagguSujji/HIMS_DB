


--------------------------------------------------------------
-- 12. Patient Radiology History
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Patient_RadiologyHistory]
(
    @PatientId INT
)
AS
BEGIN
    SET NOCOUNT ON;


    SELECT

        RO.RadiologyOrderId,
        RO.OrderDate,

        RR.RadiologyResultId,
        RR.ResultDate,

        RP.ProcedureName,
        IT.ImagingName

    FROM dbo.RadiologyOrder RO

    LEFT JOIN dbo.RadiologyResult RR
        ON RO.RadiologyOrderId =
           RR.RadiologyOrderId

    LEFT JOIN dbo.RadiologyProcedure RP
        ON RP.RadiologyProcedureId =
           RR.RadiologyResultId

    LEFT JOIN dbo.ImagingType IT
        ON RP.ImagingTypeId =
           IT.ImagingTypeId

    WHERE RO.PatientId=@PatientId

    ORDER BY RO.OrderDate DESC;

END
