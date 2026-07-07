CREATE     PROCEDURE [dbo].[USP_Lab_Worklist]

AS
BEGIN


SELECT

LS.LabSampleId,
LS.Barcode,
P.UHID,
P.FirstName,
LS.Status

FROM dbo.LabSampleCollection LS


INNER JOIN dbo.LabOrder LO

ON LS.LabOrderId=LO.LabOrderId


INNER JOIN dbo.Patient P

ON LO.PatientId=P.PatientId


WHERE

LS.Status <> 'COMPLETED';


END
