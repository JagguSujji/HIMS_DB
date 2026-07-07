CREATE     PROCEDURE [dbo].[USP_Admission_UpdateStatus]

(
 @AdmissionId BIGINT,
 @AdmissionStatusId BIGINT
)

AS
BEGIN


UPDATE dbo.Admission

SET

AdmissionStatusId=@AdmissionStatusId


WHERE AdmissionId=@AdmissionId;


END
