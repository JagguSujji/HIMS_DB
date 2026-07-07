CREATE     PROCEDURE [dbo].[USP_SurgeryType_Get]

AS
BEGIN

SELECT

SurgeryTypeId,
SurgeryTypeCode,
SurgeryTypeName,
IsEmergency

FROM dbo.SurgeryType

WHERE IsActive=1;

END
