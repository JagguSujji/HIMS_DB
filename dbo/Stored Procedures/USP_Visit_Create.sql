CREATE     PROCEDURE [dbo].[USP_Visit_Create]

(
 @PatientId BIGINT,
 @DoctorId BIGINT,
 @DepartmentId BIGINT,
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
DepartmentId,
ChiefComplaintId,
VisitSource,
CheckInTime
)

VALUES

(
@PatientId,
GETDATE(),
'OPD',
1,
@DoctorId,
@DepartmentId,
@ChiefComplaintId,
'APPOINTMENT',
GETDATE()
);



SET @VisitId=SCOPE_IDENTITY();


END
