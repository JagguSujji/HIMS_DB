CREATE     PROCEDURE [dbo].[USP_Today_Registration_Count]


AS
BEGIN


SELECT


COUNT(*) TotalRegistrations


FROM dbo.Patient


WHERE

CAST(RegistrationDate AS DATE)=CAST(GETDATE() AS DATE);



END
