CREATE     PROCEDURE [dbo].[USP_UserSession_GetHistory]
(
    @UserId INT
)
AS
BEGIN

    SELECT
        SessionId,
        LoginTime,
        LogoutTime,
        IPAddress,
        DeviceName,
        BrowserName,
        OperatingSystem,
        IsActive
    FROM UserSession
    WHERE UserId=@UserId
    ORDER BY LoginTime DESC;

END
