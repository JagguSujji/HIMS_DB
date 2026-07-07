CREATE     PROCEDURE [dbo].[USP_Patient_Create]


(
 @FirstName VARCHAR(100),

 @LastName VARCHAR(100),

 @GenderId BIGINT,

 @DOB DATE,

 @Mobile VARCHAR(20),

 @Email VARCHAR(150),

 @BloodGroupId BIGINT,

 @MaritalStatusId BIGINT,

 @NationalityId BIGINT,

 @LanguageId BIGINT,


 @PatientId BIGINT OUTPUT

)

AS
BEGIN


DECLARE @UHID VARCHAR(50);



EXEC dbo.USP_Patient_GenerateUHID

@UHID OUTPUT;



INSERT INTO dbo.Patient

(
UHID,
FirstName,
LastName,
GenderId,
DateOfBirth,
Mobile,
Email,
BloodGroupId,
MaritalStatusId,
NationalityId,
PreferredLanguageId,
RegistrationDate,
IsActive
)


VALUES

(
@UHID,
@FirstName,
@LastName,
@GenderId,
@DOB,
@Mobile,
@Email,
@BloodGroupId,
@MaritalStatusId,
@NationalityId,
@LanguageId,
GETDATE(),
1
);



SET @PatientId=SCOPE_IDENTITY();



END
