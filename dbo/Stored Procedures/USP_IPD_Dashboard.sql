CREATE     PROCEDURE [dbo].[USP_IPD_Dashboard]


AS
BEGIN


SELECT


(
SELECT COUNT(*)

FROM Admission

WHERE DischargeDate IS NULL

)

CurrentAdmissions,



(
SELECT COUNT(*)

FROM Bed

WHERE IsOccupied=0

)

AvailableBeds,



(
SELECT COUNT(*)

FROM Admission

WHERE CAST(AdmissionDate AS DATE)=CAST(GETDATE() AS DATE)

)

TodaysAdmissions,



(
SELECT COUNT(*)

FROM DischargeSummary

WHERE CAST(CreatedOn AS DATE)=CAST(GETDATE() AS DATE)

)

TodaysDischarges;



END
