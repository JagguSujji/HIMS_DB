


-------------------------------------------------------------
-- 9. Appointment Mode Master
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentMode_GetAll]
AS
BEGIN

SELECT *
FROM dbo.AppointmentMode
WHERE IsActive=1
ORDER BY ModeName;

END
