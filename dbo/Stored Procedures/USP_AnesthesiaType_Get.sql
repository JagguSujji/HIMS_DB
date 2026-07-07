CREATE     PROCEDURE [dbo].[USP_AnesthesiaType_Get]


AS
BEGIN


SELECT

AnesthesiaTypeId,
AnesthesiaTypeCode,
AnesthesiaTypeName


FROM dbo.AnesthesiaType


WHERE IsActive=1;


END
