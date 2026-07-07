


/***********************************************************
 Emergency Contact
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_EmployeeEmergencyContact_Save]
(
 @EmployeeId INT,
 @ContactName VARCHAR(100),
 @Relationship VARCHAR(50),
 @MobileNumber VARCHAR(20)
)
AS
BEGIN

INSERT INTO EmployeeEmergencyContact
(
EmployeeId,
ContactName,
Relationship,
MobileNumber,
IsPrimary
)

VALUES
(
@EmployeeId,
@ContactName,
@Relationship,
@MobileNumber,
1
)

END
