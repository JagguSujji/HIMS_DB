CREATE     PROCEDURE [dbo].[USP_ApplicationUser_LoginSuccess]
(
    @UserId BIGINT
)
AS
BEGIN


    UPDATE dbo.ApplicationUser

    SET
        FailedLoginCount=0,
        IsLocked=0,
        LockUntil=NULL,
        LastLoginOn=GETDATE()

    WHERE UserId=@UserId;


END
