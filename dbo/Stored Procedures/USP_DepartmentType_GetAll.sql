


CREATE     PROCEDURE [dbo].[USP_DepartmentType_GetAll]
AS
BEGIN

SELECT *

FROM DepartmentType

WHERE IsActive=1

END
