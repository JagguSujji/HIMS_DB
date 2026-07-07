


/************************************************************
 Login Audit
************************************************************/

CREATE     PROCEDURE [dbo].[USP_LoginAudit_Insert]
(
 @UserId INT,
 @Username VARCHAR(100),
 @IsSuccessful BIT,
 @IPAddress VARCHAR(50),
 @BrowserName VARCHAR(100),
 @DeviceName VARCHAR(100)
)
AS
BEGIN

INSERT INTO LoginAudit
(
 UserId,
 Username,
 LoginDateTime,
 IsSuccessful,
 IPAddress,
 BrowserName,
 DeviceName,
 CreatedOn
)

VALUES
(
 @UserId,
 @Username,
 GETDATE(),
 @IsSuccessful,
 @IPAddress,
 @BrowserName,
 @DeviceName,
 GETDATE()
)

END
