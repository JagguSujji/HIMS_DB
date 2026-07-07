


--------------------------------------------------------------
-- 14. Service Location Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ServiceLocation_GetAll]
AS
BEGIN


    SELECT

        ServiceLocationId,
        ServiceLocationCode,
        ServiceLocationName,
        ServiceLocationTypeId

    FROM dbo.ServiceLocation

    WHERE IsActive=1;


END
