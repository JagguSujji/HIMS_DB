


/***********************************************************
 Payroll Component
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_PayrollComponent_GetAll]
AS
BEGIN

SELECT *

FROM PayrollComponent

WHERE IsActive=1;

END
