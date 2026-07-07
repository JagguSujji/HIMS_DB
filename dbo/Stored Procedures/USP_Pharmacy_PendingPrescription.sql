CREATE     PROCEDURE [dbo].[USP_Pharmacy_PendingPrescription]


AS
BEGIN


SELECT


P.PrescriptionId,

PT.UHID,

PT.FirstName,

P.PrescriptionDate


FROM dbo.Prescription P


INNER JOIN dbo.Encounter E

ON P.EncounterId=E.EncounterId


INNER JOIN dbo.Visit V

ON E.VisitId=V.VisitId


INNER JOIN dbo.Patient PT

ON V.PatientId=PT.PatientId



WHERE


P.Status='ACTIVE';



END
