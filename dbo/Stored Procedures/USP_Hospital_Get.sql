CREATE     PROCEDURE [dbo].[USP_Hospital_Get]

AS
BEGIN

SELECT

HospitalId,
HospitalCode,
HospitalName,
PhoneNumber,
EmailAddress,
Website,
IsActive

FROM dbo.Hospital

ORDER BY HospitalName;

END
