CREATE     PROCEDURE [dbo].[USP_Role_Update]
(
    @RoleId BIGINT,
    @RoleName VARCHAR(100),
    @Description VARCHAR(500),
    @ModifiedBy BIGINT
)
AS
BEGIN


UPDATE dbo.Role

SET

RoleName=@RoleName,
Description=@Description,
ModifiedBy=@ModifiedBy,
ModifiedOn=GETDATE()

WHERE RoleId=@RoleId;


END
