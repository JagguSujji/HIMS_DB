CREATE     PROCEDURE [dbo].[USP_ER_GetSeverityLevels]

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
