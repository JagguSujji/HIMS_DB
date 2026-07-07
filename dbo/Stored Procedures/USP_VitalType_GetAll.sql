


---------------------------------------------------------------
-- 25. Vital Type Master
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_VitalType_GetAll]
AS
BEGIN

SELECT *
FROM dbo.VitalType
WHERE IsActive=1
ORDER BY DisplayOrder;

END
