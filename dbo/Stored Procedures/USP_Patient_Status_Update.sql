

CREATE     PROCEDURE [dbo].[USP_Patient_Status_Update]
(
    @PatientId BIGINT,
    @Status NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Patient
    SET PatientStatus = @Status
    WHERE PatientId=@PatientId;

END
