


-------------------------------------------------------------
-- 13. Doctor Availability Get
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_DoctorAvailability_Get]
(
 @DoctorId INT
)
AS
BEGIN

SELECT *
FROM dbo.DoctorAvailability
WHERE DoctorId=@DoctorId
AND IsActive=1;

END
