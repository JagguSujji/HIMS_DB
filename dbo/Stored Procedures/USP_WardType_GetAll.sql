


CREATE     PROCEDURE [dbo].[USP_WardType_GetAll]
AS
BEGIN

SELECT *

FROM WardType

WHERE IsActive=1

END
