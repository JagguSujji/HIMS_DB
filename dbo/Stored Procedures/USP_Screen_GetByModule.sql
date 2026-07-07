


CREATE     PROCEDURE [dbo].[USP_Screen_GetByModule]
(
 @ModuleName VARCHAR(100)
)
AS
BEGIN

SELECT *

FROM Screen

WHERE ModuleName=@ModuleName
AND IsActive=1;

END
