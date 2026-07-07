


CREATE     PROCEDURE [dbo].[USP_CoverageType_GetAll]
AS
BEGIN

SELECT *

FROM CoverageType

WHERE IsActive=1

END
