


CREATE     PROCEDURE [dbo].[USP_Admission_Cancel]
(
 @AdmissionId BIGINT
)
AS
BEGIN

UPDATE dbo.Admission
SET AdmissionStatusId =
(
 SELECT AdmissionStatusId
 FROM dbo.AdmissionStatus
 WHERE StatusCode='CANCELLED'
)
WHERE AdmissionId=@AdmissionId;

END
