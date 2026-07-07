CREATE     PROCEDURE [dbo].[USP_ApplicationUser_Login]
(
    @Username NVARCHAR(100)
)
AS
BEGIN

    SELECT

        UserId,
        Username,
        PasswordHash,
        PasswordSalt,
        IsActive,
        IsLocked,
        LockUntil,
        FailedLoginCount,
        MustChangePassword

    FROM dbo.ApplicationUser

    WHERE Username=@Username;

END
