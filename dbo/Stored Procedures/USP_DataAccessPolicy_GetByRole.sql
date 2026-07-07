


CREATE     PROCEDURE [dbo].[USP_DataAccessPolicy_GetByRole]
(
 @RoleId INT
)
AS
BEGIN

SELECT *

FROM DataAccessPolicy

WHERE RoleId=@RoleId;

END
