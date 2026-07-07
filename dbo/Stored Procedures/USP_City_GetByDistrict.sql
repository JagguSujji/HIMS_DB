CREATE     PROCEDURE [dbo].[USP_City_GetByDistrict]


(
 @DistrictId INT
)

AS
BEGIN


SELECT

CityId,
CityName,
PostalCode

FROM City

WHERE

DistrictId=@DistrictId

AND IsActive=1;



END
