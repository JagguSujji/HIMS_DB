CREATE     PROCEDURE [dbo].[USP_Doctor_Consultation_Dashboard]


(
 @DoctorId BIGINT
)

AS
BEGIN


SELECT


(
SELECT COUNT(*)

FROM Visit

WHERE DoctorId=@DoctorId

AND CAST(VisitDate AS DATE)=CAST(GETDATE() AS DATE)

)

TodaysPatients,



(
SELECT COUNT(*)

FROM Encounter E

INNER JOIN Visit V

ON E.VisitId=V.VisitId

WHERE V.DoctorId=@DoctorId

AND E.EncounterStatus='OPEN'

)

PendingConsultations;



END
