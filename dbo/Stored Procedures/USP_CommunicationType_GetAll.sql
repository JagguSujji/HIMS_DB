


---------------------------------------------------------------
-- 16. Communication Type Master
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_CommunicationType_GetAll]
AS
BEGIN

SELECT *
FROM dbo.CommunicationType
WHERE IsActive=1;

END
