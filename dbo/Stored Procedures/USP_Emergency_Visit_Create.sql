CREATE     PROCEDURE [dbo].[USP_Emergency_Visit_Create]


(
 @PatientId BIGINT,
 @DoctorId BIGINT,
 @ChiefComplaintId BIGINT,

 @VisitId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Visit

(
PatientId,
VisitDate,
VisitType,
VisitStatusId,
DoctorId,
ChiefComplaintId,
VisitSource,
CheckInTime
)

VALUES

(
@PatientId,
GETDATE(),
'EMERGENCY',
1,
@DoctorId,
@ChiefComplaintId,
'ER',
GETDATE()
);



SET @VisitId=SCOPE_IDENTITY();



END
