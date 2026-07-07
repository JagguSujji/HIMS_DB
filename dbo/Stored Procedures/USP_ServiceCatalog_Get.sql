CREATE     PROCEDURE [dbo].[USP_ServiceCatalog_Get]

AS
BEGIN


SELECT

ServiceId,

ServiceCode,

ServiceName,

BasePrice


FROM dbo.ServiceCatalog;


END
