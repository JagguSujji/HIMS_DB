






CREATE     PROCEDURE [dbo].[USP_ProcedureType_GetAll]
AS
BEGIN

SELECT *

FROM ProcedureType

WHERE IsActive=1

END
