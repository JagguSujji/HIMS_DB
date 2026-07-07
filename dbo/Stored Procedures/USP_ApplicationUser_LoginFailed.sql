CREATE     PROCEDURE [dbo].[USP_ApplicationUser_LoginFailed]
(
    @UserId BIGINT
)
AS
BEGIN

    UPDATE dbo.ApplicationUser

    SET
        FailedLoginCount =
        FailedLoginCount + 1

    WHERE UserId=@UserId;


END
