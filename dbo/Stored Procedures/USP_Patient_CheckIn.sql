CREATE     PROCEDURE [dbo].[USP_Patient_CheckIn]

(
 @PatientId BIGINT,
 @DoctorId BIGINT,
 @DepartmentId BIGINT,
 @VisitType VARCHAR(50),
 @VisitId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Visit

(
PatientId,
VisitDate,
VisitType,
DoctorId,
DepartmentId,
VisitStatusId,
CheckInTime
)

VALUES

(
@PatientId,
GETDATE(),
@VisitType,
@DoctorId,
@DepartmentId,
1,
GETDATE()
);


SET @VisitId=SCOPE_IDENTITY();


END
