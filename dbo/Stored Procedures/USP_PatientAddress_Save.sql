CREATE     PROCEDURE [dbo].[USP_PatientAddress_Save]


(
 @PatientId BIGINT,

 @AddressTypeId BIGINT,

 @AddressLine1 VARCHAR(250),

 @AddressLine2 VARCHAR(250),

 @CityId BIGINT,

 @PostalCode VARCHAR(20)

)

AS
BEGIN


INSERT INTO dbo.PatientAddress

(
PatientId,
AddressTypeId,
AddressLine1,
AddressLine2,
CityId,
PostalCode
)


VALUES

(
@PatientId,
@AddressTypeId,
@AddressLine1,
@AddressLine2,
@CityId,
@PostalCode
);



END
