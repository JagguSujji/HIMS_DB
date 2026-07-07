


--------------------------------------------------------------
-- 9. Create Service Catalog
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ServiceCatalog_Create]
(
    @ServiceCode VARCHAR(50),
    @ServiceName VARCHAR(200),
    @BasePrice DECIMAL(18,2)
)
AS
BEGIN


    INSERT INTO dbo.ServiceCatalog
    (
        ServiceCode,
        ServiceName,
        BasePrice
    )
    VALUES
    (
        @ServiceCode,
        @ServiceName,
        @BasePrice
    );


    SELECT SCOPE_IDENTITY()
    AS ServiceId;


END
