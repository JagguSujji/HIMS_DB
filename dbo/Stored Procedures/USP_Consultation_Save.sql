CREATE     PROCEDURE [dbo].[USP_Consultation_Save]

(
 @EncounterId BIGINT,
 @DoctorId BIGINT,
 @Notes NVARCHAR(MAX)
)

AS
BEGIN


INSERT INTO dbo.Consultation
(
EncounterId,
DoctorId,
Notes
)

VALUES
(
@EncounterId,
@DoctorId,
@Notes
);


END
