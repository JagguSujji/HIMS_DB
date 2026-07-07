


--------------------------------------------------------------
-- 11. Radiation Level Get
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiationLevel_Get]
AS
BEGIN

    SELECT
        RadiationLevelId,
        RadiationCode,
        RadiationName,
        DoseRange
    FROM dbo.RadiationLevel
    WHERE IsActive=1
    ORDER BY RadiationName;

END
