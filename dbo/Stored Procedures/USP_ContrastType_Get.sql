


--------------------------------------------------------------
-- 9. Contrast Type Get
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ContrastType_Get]
AS
BEGIN

    SELECT
        ContrastTypeId,
        ContrastCode,
        ContrastName,
        Description
    FROM dbo.ContrastType
    WHERE IsActive=1
    ORDER BY ContrastName;

END
