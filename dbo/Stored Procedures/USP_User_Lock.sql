CREATE     PROCEDURE [dbo].[USP_User_Lock]


(
 @UserId INT,

 @Minutes INT=30

)

AS
BEGIN


UPDATE ApplicationUser

SET


IsLocked=1,


LockUntil=DATEADD(MINUTE,@Minutes,GETDATE())


WHERE UserId=@UserId;



END
