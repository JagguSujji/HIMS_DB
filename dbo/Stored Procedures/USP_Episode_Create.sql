


---------------------------------------------------------------
-- 13. Episode Create
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Episode_Create]
(
 @PatientId INT,
 @EpisodeType VARCHAR(100),
 @PrimaryDoctorId INT
)
AS
BEGIN

INSERT INTO dbo.EpisodeOfCare
(
PatientId,
StartDate,
EpisodeType,
PrimaryDoctorId,
Status,
CreatedOn
)
VALUES
(
@PatientId,
GETDATE(),
@EpisodeType,
@PrimaryDoctorId,
'ACTIVE',
GETDATE()
);


SELECT SCOPE_IDENTITY() EpisodeId;

END
