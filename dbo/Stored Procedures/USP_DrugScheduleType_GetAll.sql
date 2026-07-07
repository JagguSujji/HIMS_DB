


CREATE     PROCEDURE [dbo].[USP_DrugScheduleType_GetAll]
AS
BEGIN

SELECT *

FROM DrugScheduleType

WHERE IsActive=1

END
