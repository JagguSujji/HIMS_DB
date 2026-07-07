


-------------------------------------------------------------
-- 10. Slot Status Master
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentSlotStatus_GetAll]
AS
BEGIN

SELECT *
FROM dbo.AppointmentSlotStatus
WHERE IsActive=1;

END
