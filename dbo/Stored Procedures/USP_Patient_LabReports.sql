


/*******************************************************
 22. Get Patient Lab Reports
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Patient_LabReports]
(
 @PatientId INT
)
AS
BEGIN


SELECT

LO.PatientId,
LO.LabOrderId,
LR.LabResultId,
LR.ResultDate,
LR.ResultStatus

FROM dbo.LabOrder LO

INNER JOIN dbo.LabResult LR
ON LO.LabOrderId=LR.LabOrderId

WHERE LO.PatientId=@PatientId;


END
