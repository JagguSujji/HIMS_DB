CREATE     PROCEDURE [dbo].[USP_ApplicationUser_Deactivate]
(
    @UserId BIGINT,
    @ModifiedBy BIGINT
)
AS
BEGIN

    UPDATE dbo.ApplicationUser

    SET
        IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()

    WHERE UserId=@UserId;

END
