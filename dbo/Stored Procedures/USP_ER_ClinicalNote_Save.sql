CREATE     PROCEDURE [dbo].[USP_ER_ClinicalNote_Save]


(
 @PatientId BIGINT,

 @EncounterId BIGINT,

 @NoteText VARCHAR(MAX),

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
'ER_NOTE',
@NoteText,
@CreatedBy,
GETDATE()
);



END
