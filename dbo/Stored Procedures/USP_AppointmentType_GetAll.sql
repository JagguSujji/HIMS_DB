


-------------------------------------------------------------
-- 8. Appointment Type Master
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentType_GetAll]
AS
BEGIN

SELECT *
FROM dbo.AppointmentType
WHERE IsActive=1
ORDER BY AppointmentTypeName;

END
