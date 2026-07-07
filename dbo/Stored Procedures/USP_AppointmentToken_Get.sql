


-------------------------------------------------------------
-- 6. Appointment Token Get
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentToken_Get]
(
 @DoctorId INT,
 @Date DATE=NULL
)
AS
BEGIN

SET NOCOUNT ON;


IF @Date IS NULL
SET @Date=CAST(GETDATE() AS DATE);


SELECT

AT.TokenId,
AT.TokenNumber,
AT.Status,
P.UHID,
P.FirstName,
P.LastName

FROM dbo.AppointmentToken AT

INNER JOIN dbo.Appointment A
ON A.AppointmentId=AT.AppointmentId

INNER JOIN dbo.Patient P
ON P.PatientId=A.PatientId


WHERE

AT.DoctorId=@DoctorId

AND CAST(AT.IssuedOn AS DATE)=@Date

ORDER BY AT.TokenNumber;


END
