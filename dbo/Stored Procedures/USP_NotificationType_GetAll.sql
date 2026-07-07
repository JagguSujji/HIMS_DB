


CREATE     PROCEDURE [dbo].[USP_NotificationType_GetAll]
AS
BEGIN

SELECT *

FROM NotificationType

WHERE IsActive=1

END
