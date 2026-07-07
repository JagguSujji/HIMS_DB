CREATE     PROCEDURE [dbo].[USP_LabOrder_Pending]


AS
BEGIN


SELECT


LO.LabOrderId,
P.UHID,
P.FirstName,
LO.OrderDate,
LO.OrderPriority


FROM dbo.LabOrder LO


INNER JOIN dbo.Patient P

ON LO.PatientId=P.PatientId


WHERE

LO.LabOrderId NOT IN

(
SELECT LabOrderId
FROM LabResult
);



END
