CREATE     PROCEDURE [dbo].[USP_Discharge_Patient]


(
 @AdmissionId BIGINT,
 @DischargeDoctorId BIGINT
)

AS
BEGIN


DECLARE @BedId BIGINT;



SELECT

@BedId=BedId

FROM dbo.Admission

WHERE AdmissionId=@AdmissionId;



UPDATE dbo.Admission

SET

DischargeDate=GETDATE(),

DischargeDoctorId=@DischargeDoctorId,

AdmissionStatusId=3


WHERE AdmissionId=@AdmissionId;



EXEC dbo.USP_Bed_Release
@BedId;



END
