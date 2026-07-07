CREATE     PROCEDURE [dbo].[USP_Visit_CreateFromAppointment]

(
 @AppointmentId BIGINT,
 @VisitId BIGINT OUTPUT
)

AS
BEGIN


DECLARE

@PatientId BIGINT,
@DoctorId BIGINT;



SELECT

@PatientId=PatientId,
@DoctorId=DoctorId

FROM dbo.Appointment

WHERE AppointmentId=@AppointmentId;



INSERT INTO dbo.Visit
(
PatientId,
VisitDate,
VisitType,
VisitStatusId,
DoctorId
)

VALUES
(
@PatientId,
GETDATE(),
'OP',
1,
@DoctorId
);



SET @VisitId=SCOPE_IDENTITY();



END
