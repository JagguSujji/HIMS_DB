



/************************************************************
 INTEGRATION MONITORING
************************************************************/


CREATE     PROCEDURE [dbo].[USP_Integration_Status_Dashboard]
AS
BEGIN


SELECT

SystemName,

CASE
WHEN IsActive=1 THEN 'ONLINE'
ELSE 'OFFLINE'
END Status


FROM ExternalSystemRegistry


END
