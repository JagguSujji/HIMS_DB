CREATE     PROCEDURE [dbo].[USP_User_Unlock]
(
    @UserId INT
)
AS
BEGIN

    UPDATE ApplicationUser
    SET
        IsLocked=0,
        FailedLoginCount=0
    WHERE UserId=@UserId;

END
