CREATE     PROCEDURE [dbo].[USP_UserSession_Create]


(
 @UserId INT,

 @IPAddress VARCHAR(100),

 @DeviceName VARCHAR(200),

 @BrowserName VARCHAR(100),

 @OperatingSystem VARCHAR(100),

 @RefreshToken VARCHAR(MAX)

)

AS
BEGIN


INSERT INTO UserSession

(
UserId,
LoginTime,
IPAddress,
DeviceName,
BrowserName,
OperatingSystem,
RefreshToken,
IsActive
)


VALUES

(
@UserId,
GETDATE(),
@IPAddress,
@DeviceName,
@BrowserName,
@OperatingSystem,
@RefreshToken,
1
);


SELECT SCOPE_IDENTITY() SessionId;


END
