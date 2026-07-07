


--------------------------------------------------------------
-- 11. Get Service Pricing
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Service_GetPricing]
(
    @ServiceId INT
)
AS
BEGIN


    SELECT

        ServiceId,
        ServiceCode,
        ServiceName,
        BasePrice

    FROM dbo.ServiceCatalog

    WHERE ServiceId=@ServiceId;


END
