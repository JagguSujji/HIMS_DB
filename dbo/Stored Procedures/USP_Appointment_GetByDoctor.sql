


CREATE     PROCEDURE [dbo].[USP_Appointment_GetByDoctor]
(
 @DoctorId BIGINT,
 @Date DATE
)
AS
BEGIN

SELECT *
FROM dbo.Appointment
WHERE DoctorId=@DoctorId
AND CAST(AppointmentDate AS DATE)=@Date;

END
