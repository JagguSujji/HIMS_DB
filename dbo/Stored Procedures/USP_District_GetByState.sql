CREATE     PROCEDURE [dbo].[USP_District_GetByState]

(
 @StateId INT
)

AS
BEGIN


SELECT

DistrictId,
DistrictName

FROM District

WHERE

StateId=@StateId

AND IsActive=1;


END
