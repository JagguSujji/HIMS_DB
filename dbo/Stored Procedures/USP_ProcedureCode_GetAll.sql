


CREATE     PROCEDURE [dbo].[USP_ProcedureCode_GetAll]
AS
BEGIN

SELECT *

FROM ProcedureCode

WHERE IsActive=1

END
