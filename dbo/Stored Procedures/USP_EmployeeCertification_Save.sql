


/***********************************************************
 Certification
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_EmployeeCertification_Save]
(
 @EmployeeId INT,
 @CertificationTypeId INT,
 @CertificateNumber VARCHAR(100),
 @IssueDate DATE,
 @ExpiryDate DATE
)
AS
BEGIN

INSERT INTO EmployeeCertification
(
EmployeeId,
CertificationTypeId,
CertificateNumber,
IssueDate,
ExpiryDate
)

VALUES
(
@EmployeeId,
@CertificationTypeId,
@CertificateNumber,
@IssueDate,
@ExpiryDate
)

END
