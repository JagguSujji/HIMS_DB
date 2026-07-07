/* =========================================================
   APPOINTMENT MANAGEMENT MODULE
   ========================================================= */


-------------------------------------------------------------
-- 1. Appointment Get By Id
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Appointment_GetById]
(
    @AppointmentId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        A.*,
        P.UHID,
        P.FirstName,
        P.LastName,
        P.Mobile,
        D.EmployeeId AS DoctorEmployeeId
    FROM dbo.Appointment A

    INNER JOIN dbo.Patient P
        ON P.PatientId=A.PatientId

    LEFT JOIN dbo.Provider PR
        ON PR.ProviderId=A.DoctorId

    LEFT JOIN dbo.Employee D
        ON D.EmployeeId=PR.EmployeeId

    WHERE A.AppointmentId=@AppointmentId;

END
