


---------------------------------------------------------------
-- 6. Clinical Observation Save
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ClinicalObservation_Save]
(
 @PatientId INT,
 @EncounterId INT,
 @ObservationType VARCHAR(100),
 @ObservationValue VARCHAR(500),
 @RecordedBy INT
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


SELECT SCOPE_IDENTITY() ObservationId;

END
