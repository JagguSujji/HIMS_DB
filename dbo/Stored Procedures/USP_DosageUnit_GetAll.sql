


CREATE     PROCEDURE [dbo].[USP_DosageUnit_GetAll]
AS
BEGIN

SELECT *

FROM DosageUnit

WHERE IsActive=1

END
