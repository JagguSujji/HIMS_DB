


/*******************************************************
 17. Patient Lab History
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Patient_LabHistory]
(
 @PatientId INT
)
AS
BEGIN


SELECT

LO.LabOrderId,
LO.OrderDate,
LR.ResultDate,
LR.ResultStatus

FROM dbo.LabOrder LO

LEFT JOIN dbo.LabResult LR
ON LO.LabOrderId=LR.LabOrderId

WHERE LO.PatientId=@PatientId

ORDER BY LO.OrderDate DESC;


END
