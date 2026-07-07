


--------------------------------------------------------------
-- 7. Imaging Type Get
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ImagingType_Get]
AS
BEGIN

    SELECT
        ImagingTypeId,
        ImagingCode,
        ImagingName,
        Description,
        IsRadiation
    FROM dbo.ImagingType
    WHERE IsActive=1
    ORDER BY ImagingName;

END
