CREATE     PROCEDURE [dbo].[USP_Patient_VisitHistory]


(
 @PatientId BIGINT
)

AS
BEGIN


SELECT


V.VisitId,

V.VisitDate,

V.VisitType,

V.VisitStatusId,

E.FirstName+' '+E.LastName DoctorName


FROM dbo.Visit V


LEFT JOIN dbo.Provider PR

ON V.DoctorId=PR.ProviderId


LEFT JOIN dbo.Employee E

ON PR.EmployeeId=E.EmployeeId



WHERE

V.PatientId=@PatientId



ORDER BY

V.VisitDate DESC;


END
