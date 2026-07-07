CREATE     PROCEDURE [dbo].[USP_User_LoginSuccess]


(
 @UserId INT
)

AS
BEGIN


UPDATE ApplicationUser

SET

LastLoginOn=GETDATE(),

FailedLoginCount=0,

IsLocked=0


WHERE UserId=@UserId;



END
