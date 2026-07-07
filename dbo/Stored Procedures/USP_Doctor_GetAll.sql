CREATE     PROCEDURE [dbo].[USP_Doctor_GetAll]

AS
BEGIN


SELECT

P.ProviderId,
E.EmployeeId,
E.FirstName+' '+E.LastName AS DoctorName,
S.SpecializationName,
P.LicenseNumber

FROM dbo.Provider P

INNER JOIN dbo.Employee E
ON P.EmployeeId=E.EmployeeId

LEFT JOIN dbo.Specialization S
ON P.SpecializationId=S.SpecializationId


WHERE

P.IsActive=1;


END
