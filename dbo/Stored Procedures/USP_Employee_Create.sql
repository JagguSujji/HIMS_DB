CREATE     PROCEDURE [dbo].[USP_Employee_Create]
(
    @EmployeeNumber VARCHAR(50),
    @FirstName VARCHAR(100),
    @MiddleName VARCHAR(100),
    @LastName VARCHAR(100),
    @GenderId BIGINT,
    @DateOfBirth DATE,
    @EmploymentTypeId BIGINT,
    @DesignationId BIGINT,
    @JoiningDate DATE,
    @EmailAddress VARCHAR(200),
    @MobileNumber VARCHAR(20),
    @BloodGroup VARCHAR(20),
    @CreatedBy BIGINT,
    @EmployeeId BIGINT OUTPUT
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY


INSERT INTO dbo.Employee
(
EmployeeNumber,
FirstName,
MiddleName,
LastName,
GenderId,
DateOfBirth,
EmploymentTypeId,
DesignationId,
JoiningDate,
EmailAddress,
MobileNumber,
BloodGroup,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@EmployeeNumber,
@FirstName,
@MiddleName,
@LastName,
@GenderId,
@DateOfBirth,
@EmploymentTypeId,
@DesignationId,
@JoiningDate,
@EmailAddress,
@MobileNumber,
@BloodGroup,
1,
@CreatedBy,
GETDATE()
);


SET @EmployeeId=SCOPE_IDENTITY();


END TRY

BEGIN CATCH
THROW;
END CATCH

END
