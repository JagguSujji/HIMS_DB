


--------------------------------------------------------------
-- 10. Get Service Catalog
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ServiceCatalog_GetAll]
AS
BEGIN


    SELECT

        ServiceId,
        ServiceCode,
        ServiceName,
        BasePrice

    FROM dbo.ServiceCatalog

    ORDER BY ServiceName;


END
