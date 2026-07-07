


CREATE     PROCEDURE [dbo].[USP_AppointmentSlot_Delete]
(
 @SlotId BIGINT
)
AS
BEGIN

DELETE FROM dbo.AppointmentSlot
WHERE SlotId=@SlotId;

END
