


-------------------------------------------------------------
-- 11. Priority Master
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_PriorityLevel_GetAll]
AS
BEGIN

SELECT *
FROM dbo.PriorityLevel
WHERE IsActive=1
ORDER BY DisplayOrder;

END
