CREATE     PROCEDURE [dbo].[USP_Surgery_Notes_Save]


(
 @PatientId BIGINT,
 @EncounterId BIGINT,
 @Notes NVARCHAR(MAX),
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
'OPERATIVE NOTE',
@Notes,
@CreatedBy,
GETDATE()
);


END
