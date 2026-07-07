CREATE     PROCEDURE [dbo].[USP_ER_CurrentPatients]


AS
BEGIN


SELECT


E.ERVisitId,

P.UHID,

P.FirstName,

E.ArrivalTime,

E.SeverityLevel,

E.Status



FROM dbo.ERVisit E


INNER JOIN dbo.Patient P

ON E.PatientId=P.PatientId



WHERE


E.Status NOT IN ('DISCHARGED','ADMITTED')



ORDER BY

E.ArrivalTime;



END
