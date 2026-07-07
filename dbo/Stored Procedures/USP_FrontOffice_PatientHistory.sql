CREATE     PROCEDURE [dbo].[USP_FrontOffice_PatientHistory]


(
 @PatientId BIGINT
)

AS
BEGIN


SELECT


V.VisitId,

V.VisitDate,

V.VisitType,

V.CheckInTime,

V.CheckOutTime,

D.DepartmentName


FROM dbo.Visit V


LEFT JOIN dbo.Department D

ON V.DepartmentId=D.DepartmentId


WHERE

V.PatientId=@PatientId


ORDER BY

V.VisitDate DESC;



END
