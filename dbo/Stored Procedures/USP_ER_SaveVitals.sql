CREATE     PROCEDURE [dbo].[USP_ER_SaveVitals]

(
 @PatientId BIGINT,
 @EncounterId BIGINT,
 @VitalTypeId BIGINT,
 @Value VARCHAR(50),
 @UnitOfMeasureId BIGINT,
 @RecordedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.VitalSigns

(
PatientId,
EncounterId,
VitalTypeId,
Value,
UnitOfMeasureId,
RecordedOn,
RecordedBy
)

VALUES

(
@PatientId,
@EncounterId,
@VitalTypeId,
@Value,
@UnitOfMeasureId,
GETDATE(),
@RecordedBy
);


END
