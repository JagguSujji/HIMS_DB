CREATE     PROCEDURE [dbo].[USP_ER_Queue_Get]


AS
BEGIN


SELECT


ER.ERVisitId,

P.UHID,

P.FirstName,

ER.ArrivalTime,

ER.SeverityLevel,

ER.Status


FROM dbo.ERVisit ER


INNER JOIN dbo.Patient P

ON ER.PatientId=P.PatientId


WHERE

ER.Status NOT IN
(
'DISCHARGED',
'ADMITTED'
)


ORDER BY

ER.ArrivalTime;



END
