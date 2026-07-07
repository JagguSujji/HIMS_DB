CREATE     PROCEDURE [dbo].[USP_ER_GetTypes]

AS
BEGIN


SELECT

EmergencyTypeId,
EmergencyTypeCode,
EmergencyTypeName


FROM dbo.EmergencyType


WHERE IsActive=1;


END
