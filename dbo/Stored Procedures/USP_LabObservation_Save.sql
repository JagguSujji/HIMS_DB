CREATE     PROCEDURE [dbo].[USP_LabObservation_Save]


(
 @PatientId BIGINT,
 @EncounterId BIGINT,
 @ObservationType VARCHAR(100),
 @ObservationValue VARCHAR(200),
 @RecordedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.ClinicalObservation

(
PatientId,
EncounterId,
ObservationType,
ObservationValue,
RecordedOn,
RecordedBy
)

VALUES

(
@PatientId,
@EncounterId,
@ObservationType,
@ObservationValue,
GETDATE(),
@RecordedBy
);



END
