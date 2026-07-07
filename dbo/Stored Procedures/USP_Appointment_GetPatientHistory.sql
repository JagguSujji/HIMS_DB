


-------------------------------------------------------------
-- 2. Patient Appointment History
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Appointment_GetPatientHistory]
(
    @PatientId INT
)
AS
BEGIN

SET NOCOUNT ON;


SELECT

A.AppointmentId,
A.AppointmentDate,
A.ReasonForVisit,
A.Remarks,
S.StatusName AppointmentStatus,
A.BookedOn

FROM dbo.Appointment A

LEFT JOIN dbo.AppointmentStatus S
ON S.AppointmentStatusId=A.AppointmentStatusId

WHERE A.PatientId=@PatientId

ORDER BY A.AppointmentDate DESC;


END
