


/*******************************************************
 21. Pharmacy Dashboard
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Pharmacy_Dashboard]
AS
BEGIN


SELECT

(SELECT COUNT(*) FROM dbo.Drug) TotalDrugs,

(SELECT COUNT(*) 
 FROM dbo.DrugStockBatch
 WHERE ExpiryDate < GETDATE()) ExpiredBatches,

(SELECT COUNT(*)
 FROM dbo.Prescription
 WHERE Status='CREATED') PendingPrescription;


END
