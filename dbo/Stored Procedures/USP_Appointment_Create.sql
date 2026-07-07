CREATE     PROCEDURE [dbo].[USP_Appointment_Create]


(
 @PatientId BIGINT,

 @DoctorId BIGINT,

 @SlotId BIGINT,

 @PriorityLevelId BIGINT,


 @AppointmentId BIGINT OUTPUT
)

AS
BEGIN


BEGIN TRANSACTION;



IF EXISTS

(
SELECT 1

FROM dbo.AppointmentSlot

WHERE SlotId=@SlotId

AND IsBooked=1
)

BEGIN

RAISERROR
(
'Slot Already Booked',
16,
1
);


ROLLBACK;

RETURN;

END



INSERT INTO dbo.Appointment

(
PatientId,
DoctorId,
AppointmentDate,
AppointmentStatusId,
PriorityLevelId
)

SELECT

@PatientId,

@DoctorId,

SlotDate,

1,

@PriorityLevelId


FROM dbo.AppointmentSlot


WHERE SlotId=@SlotId;



SET @AppointmentId=SCOPE_IDENTITY();



UPDATE dbo.AppointmentSlot

SET

IsBooked=1


WHERE SlotId=@SlotId;



COMMIT;


END
