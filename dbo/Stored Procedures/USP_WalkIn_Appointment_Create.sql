CREATE     PROCEDURE [dbo].[USP_WalkIn_Appointment_Create]

(
 @PatientId BIGINT,
 @DoctorId BIGINT,
 @DepartmentId BIGINT,
 @AppointmentDate DATETIME,
 @AppointmentId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Appointment

(
PatientId,
DoctorId,
AppointmentDate,
AppointmentStatusId
)

VALUES

(
@PatientId,
@DoctorId,
@AppointmentDate,
1
);


SET @AppointmentId=SCOPE_IDENTITY();



END
