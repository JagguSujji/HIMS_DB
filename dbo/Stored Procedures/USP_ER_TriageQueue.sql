CREATE     PROCEDURE [dbo].[USP_ER_TriageQueue]


AS
BEGIN


SELECT


E.ERVisitId,

P.UHID,

P.FirstName,

E.ArrivalTime,

E.SeverityLevel



FROM ERVisit E


INNER JOIN Patient P

ON E.PatientId=P.PatientId



WHERE


E.Status='WAITING'



ORDER BY

E.ArrivalTime;



END
