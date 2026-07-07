


--------------------------------------------------------------
-- 2. Get Radiology Orders By Patient
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyOrder_GetByPatient]
(
    @PatientId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        RO.RadiologyOrderId,
        RO.PatientId,
        RO.OrderDate,
        RR.RadiologyResultId,
        RR.ResultDate
    FROM dbo.RadiologyOrder RO
    LEFT JOIN dbo.RadiologyResult RR
        ON RO.RadiologyOrderId = RR.RadiologyOrderId
    WHERE RO.PatientId=@PatientId
    ORDER BY RO.OrderDate DESC;

END
