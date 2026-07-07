


--------------------------------------------------------------
-- 8. Body Part Get
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_BodyPart_Get]
AS
BEGIN

    SELECT
        BodyPartId,
        BodyPartCode,
        BodyPartName,
        ParentBodyPartId
    FROM dbo.BodyPart
    WHERE IsActive=1
    ORDER BY BodyPartName;

END
