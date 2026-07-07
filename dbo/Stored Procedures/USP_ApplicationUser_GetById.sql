CREATE     PROCEDURE [dbo].[USP_ApplicationUser_GetById]
(
    @UserId BIGINT
)
AS
BEGIN

    SELECT
        UserId,
        UserTypeId,
        EmployeeId,
        Username,
        EmailAddress,
        MobileNumber,
        IsEmailVerified,
        IsMobileVerified,
        FailedLoginCount,
        IsLocked,
        LockUntil,
        LastLoginOn,
        PasswordChangedOn,
        MustChangePassword,
        IsActive,
        CreatedOn
    FROM dbo.ApplicationUser
    WHERE UserId=@UserId;

END
