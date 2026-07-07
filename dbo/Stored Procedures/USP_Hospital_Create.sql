CREATE     PROCEDURE [dbo].[USP_Hospital_Create]
(
    @HospitalCode VARCHAR(50),
    @HospitalName VARCHAR(200),
    @LicenseNumber VARCHAR(100),
    @RegistrationNumber VARCHAR(100),
    @PhoneNumber VARCHAR(20),
    @EmailAddress VARCHAR(200),
    @Website VARCHAR(200),
    @TaxNumber VARCHAR(100),
    @TimeZone VARCHAR(100),
    @CurrencyCode VARCHAR(10),
    @LogoPath VARCHAR(500),
    @CreatedBy BIGINT,
    @HospitalId BIGINT OUTPUT
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY

INSERT INTO dbo.Hospital
(
HospitalCode,
HospitalName,
LicenseNumber,
RegistrationNumber,
PhoneNumber,
EmailAddress,
Website,
TaxNumber,
TimeZone,
CurrencyCode,
LogoPath,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@HospitalCode,
@HospitalName,
@LicenseNumber,
@RegistrationNumber,
@PhoneNumber,
@EmailAddress,
@Website,
@TaxNumber,
@TimeZone,
@CurrencyCode,
@LogoPath,
1,
@CreatedBy,
GETDATE()
);


SET @HospitalId=SCOPE_IDENTITY();


END TRY

BEGIN CATCH
THROW;
END CATCH

END
