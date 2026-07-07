


CREATE     PROCEDURE [dbo].[USP_ResultFlag_GetAll]
AS
BEGIN

SELECT *

FROM ResultFlag

WHERE IsActive=1

END
