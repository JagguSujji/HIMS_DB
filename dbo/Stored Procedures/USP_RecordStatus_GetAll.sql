


CREATE     PROCEDURE [dbo].[USP_RecordStatus_GetAll]
AS
BEGIN

SELECT *

FROM RecordStatus

WHERE IsActive=1

END
