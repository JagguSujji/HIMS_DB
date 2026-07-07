CREATE     PROCEDURE [dbo].[USP_ApplicationUser_Lock]
(
    @UserId BIGINT,
    @Minutes INT
)
AS
BEGIN

    UPDATE dbo.ApplicationUser

    SET
        IsLocked=1,
        LockUntil=DATEADD(MINUTE,@Minutes,GETDATE())

    WHERE UserId=@UserId;

END
