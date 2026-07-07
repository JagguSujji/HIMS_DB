CREATE     PROCEDURE [dbo].[USP_PatientCategory_GetAll]
(
    @IsActive BIT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            PatientCategoryId,
            CategoryCode,
            CategoryName,
            Description,
            IsActive,
            CreatedOn
        FROM dbo.PatientCategory
        WHERE 
            (@IsActive IS NULL OR IsActive = @IsActive)
        ORDER BY CategoryName;

    END TRY
    BEGIN CATCH

        THROW;

    END CATCH
END
