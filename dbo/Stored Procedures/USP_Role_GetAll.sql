CREATE     PROCEDURE [dbo].[USP_Role_GetAll]
AS
BEGIN

SELECT

    RoleId,
    RoleCode,
    RoleName,
    Description,
    IsSystemRole,
    IsActive

FROM dbo.Role

ORDER BY RoleName;

END
