/*========================================================
  MODULE 2 - PART 2A
  CLINICAL DOCUMENTATION STORED PROCEDURES
========================================================*/




/*--------------------------------------------------------
  Clinical Note Save
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_ClinicalNote_Save]
(
    @EncounterId INT,
    @PatientId INT,
    @NoteType VARCHAR(50),
    @NoteText NVARCHAR(MAX),
    @CreatedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        INSERT INTO ClinicalNote
        (
            EncounterId,
            PatientId,
            NoteType,
            NoteText,
            CreatedOn,
            CreatedBy
        )
        VALUES
        (
            @EncounterId,
            @PatientId,
            @NoteType,
            @NoteText,
            GETDATE(),
            @CreatedBy
        );

        SELECT SCOPE_IDENTITY() AS ClinicalNoteId;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
