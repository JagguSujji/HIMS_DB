CREATE     PROCEDURE [dbo].[USP_EmergencyType_Get]

AS
BEGIN

SELECT

EmergencyTypeId,
EmergencyTypeCode,
EmergencyTypeName

FROM dbo.EmergencyType

WHERE IsActive=1;

END
