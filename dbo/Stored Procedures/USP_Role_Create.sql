CREATE     PROCEDURE [dbo].[USP_Role_Create]
(
    @RoleCode VARCHAR(50),
    @RoleName VARCHAR(100),
    @Description VARCHAR(500),
    @IsSystemRole BIT,
    @CreatedBy BIGINT,
    @RoleId BIGINT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        IF EXISTS
        (
            SELECT 1 
            FROM dbo.Role
            WHERE RoleCode=@RoleCode
        )
        BEGIN
            RAISERROR('Role Code already exists',16,1);
            RETURN;
        END


        INSERT INTO dbo.Role
        (
            RoleCode,
            RoleName,
            Description,
            IsSystemRole,
            IsActive,
            CreatedBy,
            CreatedOn
        )
        VALUES
        (
            @RoleCode,
            @RoleName,
            @Description,
            @IsSystemRole,
            1,
            @CreatedBy,
            GETDATE()
        );


        SET @RoleId=SCOPE_IDENTITY();

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
