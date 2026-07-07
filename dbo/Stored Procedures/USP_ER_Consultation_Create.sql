CREATE     PROCEDURE [dbo].[USP_ER_Consultation_Create]

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
