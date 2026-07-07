CREATE     PROCEDURE [dbo].[USP_EmergencySeverity_Get]

AS
BEGIN

SELECT

EmergencySeverityId,
SeverityCode,
SeverityName,
DisplayOrder

FROM dbo.EmergencySeverity

WHERE IsActive=1

ORDER BY DisplayOrder;

END
