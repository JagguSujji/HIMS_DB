CREATE     PROCEDURE [dbo].[USP_Surgery_PreOpNote_Save]


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
'PRE-OP',
@NoteText,
@CreatedBy,
GETDATE()
);


END
