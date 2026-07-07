CREATE     PROCEDURE [dbo].[USP_DischargeStatus_Update]
(
 @AdmissionId INT,
 @DischargeStatusId INT
)
AS
BEGIN

SET NOCOUNT ON;


UPDATE dbo.Admission
SET AdmissionStatusId=@DischargeStatusId,
    DischargeDate=GETDATE()
WHERE AdmissionId=@AdmissionId;


SELECT @AdmissionId AdmissionId;


END
