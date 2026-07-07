


/***********************************************************
 Tariff Plan Get
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_TariffPlan_Get]
AS
BEGIN

SELECT *

FROM TariffPlan

WHERE IsActive=1;

END
