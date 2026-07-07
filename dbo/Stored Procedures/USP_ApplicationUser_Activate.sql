CREATE     PROCEDURE [dbo].[USP_ApplicationUser_Activate]
(
    @UserId BIGINT,
    @ModifiedBy BIGINT
)
AS
BEGIN

    UPDATE dbo.ApplicationUser

    SET
        IsActive=1,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()

    WHERE UserId=@UserId;

END
