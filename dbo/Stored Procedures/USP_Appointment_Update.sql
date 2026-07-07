


-------------------------------------------------------------
-- 3. Appointment Update
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Appointment_Update]
(
 @AppointmentId INT,
 @AppointmentDate DATETIME,
 @DoctorId INT,
 @SlotId INT,
 @Remarks VARCHAR(500)
)
AS
BEGIN

SET NOCOUNT ON;


UPDATE dbo.Appointment
SET
 AppointmentDate=@AppointmentDate,
 DoctorId=@DoctorId,
 SlotId=@SlotId,
 Remarks=@Remarks

WHERE AppointmentId=@AppointmentId;


SELECT @AppointmentId AppointmentId;

END
