CREATE     PROCEDURE [dbo].[USP_Country_GetAll]

AS
BEGIN

SELECT

CountryId,
CountryCode,
CountryName,
IsActive

FROM Country

ORDER BY CountryName;

END
