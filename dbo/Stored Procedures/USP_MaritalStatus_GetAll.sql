


CREATE     PROCEDURE [dbo].[USP_MaritalStatus_GetAll]
AS
BEGIN

SELECT *
FROM MaritalStatus
WHERE IsActive=1

END
