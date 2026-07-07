


CREATE     PROCEDURE [dbo].[USP_EmployeeLeave_Get]
(
 @EmployeeId INT
)
AS
BEGIN

SELECT *

FROM EmployeeLeave

WHERE EmployeeId=@EmployeeId

ORDER BY CreatedOn DESC;

END
