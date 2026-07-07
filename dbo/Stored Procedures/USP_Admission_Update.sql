CREATE     PROCEDURE [dbo].[USP_Admission_Update]
(
 @AdmissionId INT,
 @RoomId INT,
 @BedId INT,
 @AdmissionStatusId INT,
 @DischargeDate DATETIME=NULL
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY

UPDATE dbo.Admission
SET
 RoomId=@RoomId,
 BedId=@BedId,
 AdmissionStatusId=@AdmissionStatusId,
 DischargeDate=@DischargeDate
WHERE AdmissionId=@AdmissionId;


SELECT @AdmissionId AS AdmissionId;


END TRY
BEGIN CATCH
THROW;
END CATCH

END
