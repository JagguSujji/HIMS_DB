CREATE     PROCEDURE [dbo].[USP_State_GetByCountry]

(
 @CountryId INT
)

AS
BEGIN


SELECT

StateId,
StateCode,
StateName

FROM State

WHERE

CountryId=@CountryId

AND IsActive=1

ORDER BY StateName;


END
