CREATE     PROCEDURE [dbo].[USP_Daily_Notification_Process]


AS
BEGIN


EXEC USP_Appointment_Reminder_Generate;


EXEC USP_Billing_Due_Notification;


EXEC USP_Notification_Cleanup 180;



END
