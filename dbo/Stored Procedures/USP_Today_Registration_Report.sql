CREATE     PROCEDURE [dbo].[USP_Today_Registration_Report]


AS
BEGIN


SELECT


P.UHID,

P.FirstName,

P.LastName,

P.Mobile,

P.RegistrationDate


FROM dbo.Patient P


WHERE


CAST(P.RegistrationDate AS DATE)=CAST(GETDATE() AS DATE)


ORDER BY

P.RegistrationDate DESC;



END
