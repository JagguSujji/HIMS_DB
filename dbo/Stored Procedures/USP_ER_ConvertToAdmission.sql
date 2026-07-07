CREATE     PROCEDURE [dbo].[USP_ER_ConvertToAdmission]

(
 @PatientId BIGINT,
 @AdmissionTypeId BIGINT,
 @DoctorId BIGINT,
 @BedId BIGINT,

 @AdmissionId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Admission

(
PatientId,
AdmissionDate,
AdmissionStatusId,
AdmissionTypeId,
AdmittingDoctorId,
BedId
)

VALUES

(
@PatientId,
GETDATE(),
1,
@AdmissionTypeId,
@DoctorId,
@BedId
);



SET @AdmissionId=SCOPE_IDENTITY();



END
