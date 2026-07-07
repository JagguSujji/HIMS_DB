


CREATE     PROCEDURE [dbo].[USP_Appointment_Status_History]
(
 @AppointmentId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.AuditLog
WHERE TableName='Appointment'
AND RecordId=@AppointmentId
ORDER BY ChangedOn DESC;

END
