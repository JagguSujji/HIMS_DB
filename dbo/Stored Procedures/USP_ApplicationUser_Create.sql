CREATE     PROCEDURE [dbo].[USP_ApplicationUser_Create]
(
    @UserTypeId BIGINT,
    @EmployeeId BIGINT = NULL,
    @Username NVARCHAR(100),
    @PasswordHash NVARCHAR(MAX),
    @PasswordSalt NVARCHAR(MAX),
    @EmailAddress NVARCHAR(200),
    @MobileNumber NVARCHAR(20),
    @CreatedBy BIGINT,
    @UserId BIGINT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        IF EXISTS
        (
            SELECT 1
            FROM dbo.ApplicationUser
            WHERE Username=@Username
        )
        BEGIN
            RAISERROR('Username already exists',16,1);
            RETURN;
        END


        INSERT INTO dbo.ApplicationUser
        (
            UserTypeId,
            EmployeeId,
            Username,
            PasswordHash,
            PasswordSalt,
            EmailAddress,
            MobileNumber,
            FailedLoginCount,
            IsLocked,
            IsActive,
            CreatedBy,
            CreatedOn
        )
        VALUES
        (
            @UserTypeId,
            @EmployeeId,
            @Username,
            @PasswordHash,
            @PasswordSalt,
            @EmailAddress,
            @MobileNumber,
            0,
            0,
            1,
            @CreatedBy,
            GETDATE()
        );


        SET @UserId=SCOPE_IDENTITY();


    END TRY
    BEGIN CATCH

        THROW;

    END CATCH

END
