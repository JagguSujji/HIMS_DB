


--------------------------------------------------------------
-- 10. Imaging Position Get
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ImagingPosition_Get]
AS
BEGIN

    SELECT
        ImagingPositionId,
        PositionCode,
        PositionName
    FROM dbo.ImagingPosition
    WHERE IsActive=1
    ORDER BY PositionName;

END
