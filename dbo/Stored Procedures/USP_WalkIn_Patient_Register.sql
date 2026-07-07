CREATE     PROCEDURE [dbo].[USP_WalkIn_Patient_Register]

(
 @FirstName VARCHAR(100),
 @LastName VARCHAR(100),
 @GenderId BIGINT,
 @DateOfBirth DATE,
 @Mobile VARCHAR(20),
 @Email VARCHAR(150),
 @PatientId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Patient
(
UHID,
FirstName,
LastName,
GenderId,
DateOfBirth,
Mobile,
Email,
RegistrationDate,
IsActive
)

VALUES
(
'TEMP',
@FirstName,
@LastName,
@GenderId,
@DateOfBirth,
@Mobile,
@Email,
GETDATE(),
1
);


SET @PatientId=SCOPE_IDENTITY();


UPDATE dbo.Patient

SET UHID='UH'+RIGHT('000000'+CAST(@PatientId AS VARCHAR),6)

WHERE PatientId=@PatientId;


END
