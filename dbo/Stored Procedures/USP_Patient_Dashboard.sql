CREATE     PROCEDURE [dbo].[USP_Patient_Dashboard]


AS
BEGIN


SELECT


(
SELECT COUNT(*)

FROM Patient

WHERE CAST(RegistrationDate AS DATE)
=
CAST(GETDATE() AS DATE)

)

TodayRegistrations,



(
SELECT COUNT(*)

FROM Patient

)

TotalPatients,



(
SELECT COUNT(*)

FROM Patient

WHERE IsActive=1

)

ActivePatients;



END
