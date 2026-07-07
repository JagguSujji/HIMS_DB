CREATE     PROCEDURE [dbo].[USP_AdmissionStatus_GetAll]
(
    @IsActive BIT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            AdmissionStatusId,
            StatusCode,
            StatusName,
            IsActive
        FROM dbo.AdmissionStatus
        WHERE (@IsActive IS NULL OR IsActive=@IsActive)
        ORDER BY StatusName;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
