


-------------------------------------------------------------
-- 15. Doctor Leave Get
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_DoctorLeave_Get]
(
 @DoctorId INT
)
AS
BEGIN

SELECT *
FROM dbo.DoctorLeave
WHERE DoctorId=@DoctorId
ORDER BY FromDate DESC;

END
