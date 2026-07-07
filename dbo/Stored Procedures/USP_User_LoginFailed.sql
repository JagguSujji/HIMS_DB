CREATE     PROCEDURE [dbo].[USP_User_LoginFailed]


(
 @UserId INT
)

AS
BEGIN


UPDATE ApplicationUser

SET

FailedLoginCount =
ISNULL(FailedLoginCount,0)+1



WHERE UserId=@UserId;



END
