


/*--------------------------------------------------------
 Progress Note Create
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_ProgressNote_Create]
(
    @EncounterId INT,
    @PatientId INT,
    @Assessment NVARCHAR(MAX),
    @Plan NVARCHAR(MAX),
    @CreatedBy INT
)
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO ProgressNote
    (
        EncounterId,
        PatientId,
        Assessment,
        [Plan],
        CreatedOn
    )
    VALUES
    (
        @EncounterId,
        @PatientId,
        @Assessment,
        @Plan,
        GETDATE()
    );


    SELECT SCOPE_IDENTITY() AS ProgressNoteId;

END
