CREATE     PROCEDURE [dbo].[USP_PatientCategory_Update]
(
    @PatientCategoryId INT,
    @CategoryName VARCHAR(100),
    @Description VARCHAR(500),
    @IsActive BIT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE dbo.PatientCategory
        SET
            CategoryName = @CategoryName,
            Description = @Description,
            IsActive = @IsActive
        WHERE PatientCategoryId = @PatientCategoryId;


        SELECT 
            @PatientCategoryId AS PatientCategoryId;

    END TRY
    BEGIN CATCH

        THROW;

    END CATCH
END
