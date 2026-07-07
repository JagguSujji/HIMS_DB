CREATE     PROCEDURE [dbo].[USP_OTType_Get]

AS
BEGIN


SELECT

OTTypeId,
OTTypeCode,
OTTypeName


FROM dbo.OTType


WHERE IsActive=1;


END
