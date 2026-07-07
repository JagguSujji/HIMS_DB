CREATE     PROCEDURE [dbo].[USP_PatientCategory_Create]
(
    @CategoryCode VARCHAR(50),
    @CategoryName VARCHAR(100),
    @Description VARCHAR(500),
    @CreatedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        INSERT INTO dbo.PatientCategory
        (
            CategoryCode,
            CategoryName,
            Description,
            IsActive,
            CreatedOn
        )
        VALUES
        (
            @CategoryCode,
            @CategoryName,
            @Description,
            1,
            GETDATE()
        );

        SELECT SCOPE_IDENTITY() AS PatientCategoryId;

    END TRY
    BEGIN CATCH

        THROW;

    END CATCH
END
