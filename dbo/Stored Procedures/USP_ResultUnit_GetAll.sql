


CREATE     PROCEDURE [dbo].[USP_ResultUnit_GetAll]
AS
BEGIN

SELECT *

FROM ResultUnit

WHERE IsActive=1

END
