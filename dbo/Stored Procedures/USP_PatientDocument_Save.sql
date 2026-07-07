CREATE     PROCEDURE [dbo].[USP_PatientDocument_Save]
(
    @PatientDocumentId INT = NULL,
    @PatientId INT,
    @DocumentTypeId INT,
    @FilePath VARCHAR(500)
)
AS
BEGIN
    SET NOCOUNT ON;


    BEGIN TRY

        IF EXISTS
        (
            SELECT 1
            FROM dbo.PatientDocument
            WHERE PatientDocumentId=@PatientDocumentId
        )
        BEGIN

            UPDATE dbo.PatientDocument
            SET
                PatientId=@PatientId,
                DocumentTypeId=@DocumentTypeId,
                FilePath=@FilePath
            WHERE PatientDocumentId=@PatientDocumentId;

        END
        ELSE
        BEGIN

            INSERT INTO dbo.PatientDocument
            (
                PatientId,
                DocumentTypeId,
                FilePath
            )
            VALUES
            (
                @PatientId,
                @DocumentTypeId,
                @FilePath
            );

            SET @PatientDocumentId=SCOPE_IDENTITY();

        END


        SELECT @PatientDocumentId AS PatientDocumentId;


    END TRY
    BEGIN CATCH

        THROW;

    END CATCH
END
