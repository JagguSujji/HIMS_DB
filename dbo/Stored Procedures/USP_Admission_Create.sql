CREATE     PROCEDURE [dbo].[USP_Admission_Create]


(
 @PatientId BIGINT,

 @AdmissionTypeId BIGINT,

 @AdmittingDoctorId BIGINT,

 @RoomId BIGINT,

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
RoomId,
BedId
)


VALUES

(
@PatientId,
GETDATE(),
1,
@AdmissionTypeId,
@AdmittingDoctorId,
@RoomId,
@BedId
);



SET @AdmissionId=SCOPE_IDENTITY();



UPDATE dbo.Bed

SET

IsOccupied=1


WHERE BedId=@BedId;



INSERT INTO dbo.BedAllocation

(
AdmissionId,
BedId,
FromDate
)


VALUES

(
@AdmissionId,
@BedId,
GETDATE()
);



END
