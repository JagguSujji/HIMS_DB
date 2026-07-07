


/***********************************************************
 Employee Update
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Employee_Update]
(
 @EmployeeId INT,
 @FirstName VARCHAR(100),
 @LastName VARCHAR(100),
 @EmailAddress VARCHAR(150),
 @MobileNumber VARCHAR(20)
)
AS
BEGIN

UPDATE Employee

SET
FirstName=@FirstName,
LastName=@LastName,
EmailAddress=@EmailAddress,
MobileNumber=@MobileNumber,
ModifiedOn=GETDATE()

WHERE EmployeeId=@EmployeeId;

END
