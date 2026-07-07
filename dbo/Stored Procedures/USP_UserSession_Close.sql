CREATE     PROCEDURE [dbo].[USP_UserSession_Close]


(
 @SessionId uniqueidentifier
)

AS
BEGIN


UPDATE UserSession

SET


LogoutTime=GETDATE(),

IsActive=0


WHERE SessionId=@SessionId;



END
