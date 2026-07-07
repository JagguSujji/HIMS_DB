


/*******************************************************
 20. Lab Dashboard
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Lab_Dashboard]
AS
BEGIN


SELECT

(
SELECT COUNT(*)
FROM dbo.LabOrder
) TotalOrders,


(
SELECT COUNT(*)
FROM dbo.LabSampleCollection
WHERE Status='PENDING'
) PendingSamples,


(
SELECT COUNT(*)
FROM dbo.LabResult
WHERE ResultStatus='FINAL'
) CompletedResults,


(
SELECT COUNT(*)
FROM dbo.CriticalLabAlertLog
WHERE IsAcknowledged=0
) CriticalAlerts;


END
