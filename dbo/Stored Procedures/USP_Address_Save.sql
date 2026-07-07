


CREATE     PROCEDURE [dbo].[USP_Address_Save]
(
 @AddressTypeId INT,
 @CityId INT,
 @AddressLine1 VARCHAR(250),
 @AddressLine2 VARCHAR(250),
 @Landmark VARCHAR(200),
 @PostalCode VARCHAR(20),
 @Latitude DECIMAL(10,6),
 @Longitude DECIMAL(10,6)
)
AS
BEGIN

INSERT INTO Address
(
 AddressTypeId,
 CityId,
 AddressLine1,
 AddressLine2,
 Landmark,
 PostalCode,
 Latitude,
 Longitude,
 IsActive,
 CreatedOn
)
VALUES
(
 @AddressTypeId,
 @CityId,
 @AddressLine1,
 @AddressLine2,
 @Landmark,
 @PostalCode,
 @Latitude,
 @Longitude,
 1,
 GETDATE()
)

END
