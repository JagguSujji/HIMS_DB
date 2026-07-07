


-------------------------------------------------------------
-- 17. Slot Block Delete
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentSlotBlock_Delete]
(
 @BlockId INT
)
AS
BEGIN

DELETE
FROM dbo.AppointmentSlotBlock
WHERE BlockId=@BlockId;

END
