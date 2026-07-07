CREATE     PROCEDURE [dbo].[USP_PreAuthorization_Pending]


AS
BEGIN


SELECT


PA.PreAuthId,

P.UHID,

P.FirstName,

PA.RequestedAmount,

PA.Status


FROM PreAuthorization PA


INNER JOIN Patient P

ON PA.PatientId=P.PatientId



WHERE

PA.Status='PENDING';



END
