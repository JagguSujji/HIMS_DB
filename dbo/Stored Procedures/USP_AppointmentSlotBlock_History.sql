


CREATE     PROCEDURE [dbo].[USP_AppointmentSlotBlock_History]
(
 @DoctorId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.AppointmentSlotBlock
WHERE DoctorId=@DoctorId
ORDER BY CreatedOn DESC;

END
