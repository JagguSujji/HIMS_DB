CREATE     PROCEDURE [dbo].[USP_ER_Vital_Save]


(
 @PatientId BIGINT,
 @EncounterId BIGINT,
 @VitalTypeId BIGINT,
 @Value VARCHAR(100),
 @UnitId BIGINT,
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
@UnitId,
GETDATE(),
@RecordedBy
);



END
