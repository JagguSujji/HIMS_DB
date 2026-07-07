CREATE     PROCEDURE [dbo].[USP_ApplicationUser_ChangePassword]
(
    @UserId BIGINT,
    @PasswordHash NVARCHAR(MAX),
    @PasswordSalt NVARCHAR(MAX)
)
AS
BEGIN

    UPDATE dbo.ApplicationUser

    SET
        PasswordHash=@PasswordHash,
        PasswordSalt=@PasswordSalt,
        PasswordChangedOn=GETDATE(),
        MustChangePassword=0

    WHERE UserId=@UserId;


END
