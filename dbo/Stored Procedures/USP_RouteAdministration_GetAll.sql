


CREATE     PROCEDURE [dbo].[USP_RouteAdministration_GetAll]
AS
BEGIN

SELECT *

FROM RouteOfAdministration

WHERE IsActive=1

END
