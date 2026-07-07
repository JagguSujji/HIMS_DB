


--------------------------------------------------------------
-- 4. Get Radiology Procedures
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyProcedure_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        RP.RadiologyProcedureId,
        RP.ProcedureCode,
        RP.ProcedureName,
        RP.ImagingTypeId,
        IT.ImagingName,
        RP.BodyPartId,
        BP.BodyPartName,
        RP.ContrastTypeId,
        RP.EstimatedDuration,
        RP.IsActive
    FROM dbo.RadiologyProcedure RP
    LEFT JOIN dbo.ImagingType IT
        ON RP.ImagingTypeId=IT.ImagingTypeId
    LEFT JOIN dbo.BodyPart BP
        ON RP.BodyPartId=BP.BodyPartId
    WHERE RP.IsActive=1
    ORDER BY RP.ProcedureName;

END
