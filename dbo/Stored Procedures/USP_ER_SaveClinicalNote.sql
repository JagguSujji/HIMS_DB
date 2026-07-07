CREATE     PROCEDURE [dbo].[USP_ER_SaveClinicalNote]

(
 @PatientId BIGINT,
 @EncounterId BIGINT,
 @NoteText NVARCHAR(MAX),
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.ClinicalNote

(
PatientId,
EncounterId,
NoteType,
NoteText,
CreatedBy,
CreatedOn
)

VALUES

(
@PatientId,
@EncounterId,
'ER',
@NoteText,
@CreatedBy,
GETDATE()
);


END
