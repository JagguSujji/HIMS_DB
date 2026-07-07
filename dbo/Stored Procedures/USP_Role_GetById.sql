CREATE     PROCEDURE [dbo].[USP_Role_GetById]
(
    @RoleId BIGINT
)
AS
BEGIN

SELECT *

FROM dbo.Role

WHERE RoleId=@RoleId;

END
