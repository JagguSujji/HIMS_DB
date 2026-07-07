CREATE     PROCEDURE [dbo].[USP_Service_GetAll]

AS
BEGIN

SELECT

ServiceId,
ServiceCode,
ServiceName,
BasePrice

FROM dbo.ServiceCatalog;

END
