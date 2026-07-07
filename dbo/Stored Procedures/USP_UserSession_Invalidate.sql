CREATE     PROCEDURE [dbo].[USP_UserSession_Invalidate]
(
    @SessionId UNIQUEIDENTIFIER
)
AS
BEGIN

    UPDATE UserSession
    SET
        LogoutTime=GETDATE(),
        IsActive=0
    WHERE SessionId=@SessionId;

END
