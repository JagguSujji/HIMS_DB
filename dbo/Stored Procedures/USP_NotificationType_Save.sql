



CREATE     PROCEDURE [dbo].[USP_NotificationType_Save]
(
 @NotificationTypeCode VARCHAR(50),
 @NotificationTypeName VARCHAR(100)
)
AS
BEGIN


INSERT INTO NotificationType
(
 NotificationTypeCode,
 NotificationTypeName,
 IsActive
)
VALUES
(
 @NotificationTypeCode,
 @NotificationTypeName,
 1
)

END
