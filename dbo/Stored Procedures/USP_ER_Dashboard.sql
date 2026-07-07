CREATE     PROCEDURE [dbo].[USP_ER_Dashboard]


AS
BEGIN


SELECT


(
SELECT COUNT(*)

FROM ERVisit

WHERE Status='WAITING'

)

WaitingPatients,



(
SELECT COUNT(*)

FROM ERVisit

WHERE Status='TREATMENT'

)

ActiveTreatment,



(
SELECT COUNT(*)

FROM ERVisit

WHERE Status='ADMITTED'

)

ConvertedAdmissions,



(
SELECT COUNT(*)

FROM AmbulanceDispatch

WHERE Status='DISPATCHED'

)

ActiveAmbulance;



END
