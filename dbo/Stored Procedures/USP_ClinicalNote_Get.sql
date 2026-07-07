


/*--------------------------------------------------------
  Clinical Note Get
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_ClinicalNote_Get]
(
    @EncounterId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        ClinicalNoteId,
        EncounterId,
        PatientId,
        NoteType,
        NoteText,
        CreatedOn,
        CreatedBy
    FROM ClinicalNote
    WHERE EncounterId=@EncounterId
    ORDER BY CreatedOn DESC;

END
