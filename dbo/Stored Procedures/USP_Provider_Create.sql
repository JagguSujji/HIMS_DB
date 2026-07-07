CREATE     PROCEDURE [dbo].[USP_Provider_Create]

(
 @EmployeeId BIGINT,
 @ProviderType VARCHAR(50),
 @LicenseNumber VARCHAR(100),
 @SpecializationId BIGINT,
 @CreatedOn DATETIME
)

AS
BEGIN


INSERT INTO dbo.Provider
(
EmployeeId,
ProviderType,
LicenseNumber,
SpecializationId,
IsActive,
CreatedOn
)

VALUES
(
@EmployeeId,
@ProviderType,
@LicenseNumber,
@SpecializationId,
1,
@CreatedOn
);


END
