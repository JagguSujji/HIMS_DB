


/*******************************************************
 10. Lab Work Queue
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Lab_WorkQueue]
AS
BEGIN


SELECT

LSC.LabSampleId,
LO.PatientId,
LSC.Barcode,
LSC.Status,
LO.OrderDate

FROM dbo.LabSampleCollection LSC

INNER JOIN dbo.LabOrder LO
ON LSC.LabOrderId=LO.LabOrderId

WHERE LSC.Status <> 'COMPLETED'

ORDER BY LO.OrderDate;

END
