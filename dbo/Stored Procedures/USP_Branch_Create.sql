CREATE     PROCEDURE [dbo].[USP_Branch_Create]
(
 @HospitalId BIGINT,
 @BranchCode VARCHAR(50),
 @BranchName VARCHAR(200),
 @PhoneNumber VARCHAR(20),
 @EmailAddress VARCHAR(200),
 @AddressLine1 VARCHAR(200),
 @City VARCHAR(100),
 @State VARCHAR(100),
 @Country VARCHAR(100),
 @ZipCode VARCHAR(20),
 @CreatedBy BIGINT,
 @BranchId BIGINT OUTPUT
)

AS
BEGIN

INSERT INTO dbo.Branch
(
HospitalId,
BranchCode,
BranchName,
PhoneNumber,
EmailAddress,
AddressLine1,
City,
State,
Country,
ZipCode,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@HospitalId,
@BranchCode,
@BranchName,
@PhoneNumber,
@EmailAddress,
@AddressLine1,
@City,
@State,
@Country,
@ZipCode,
1,
@CreatedBy,
GETDATE()
);


SET @BranchId=SCOPE_IDENTITY();

END
