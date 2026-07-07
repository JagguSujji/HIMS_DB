


CREATE     PROCEDURE [dbo].[USP_ImagingPosition_GetAll]
AS
BEGIN

SELECT *

FROM ImagingPosition

WHERE IsActive=1

END
