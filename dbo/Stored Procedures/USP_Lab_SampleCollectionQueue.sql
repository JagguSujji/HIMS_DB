CREATE     PROCEDURE [dbo].[USP_Lab_SampleCollectionQueue]


AS
BEGIN


SELECT


LO.LabOrderId,

P.UHID,

P.FirstName,

LO.OrderDate


FROM dbo.LabOrder LO


INNER JOIN dbo.Patient P

ON LO.PatientId=P.PatientId



WHERE NOT EXISTS

(
SELECT 1

FROM LabSampleCollection LSC

WHERE LSC.LabOrderId=LO.LabOrderId
);



END
