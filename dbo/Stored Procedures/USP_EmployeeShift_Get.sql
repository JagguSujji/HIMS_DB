


CREATE     PROCEDURE [dbo].[USP_EmployeeShift_Get]
(
 @EmployeeId INT
)
AS
BEGIN

SELECT *

FROM EmployeeShift

WHERE EmployeeId=@EmployeeId
AND IsCurrent=1;

END
