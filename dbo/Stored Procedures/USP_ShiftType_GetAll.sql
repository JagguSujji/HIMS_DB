


/***********************************************************
 Shift Master
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_ShiftType_GetAll]
AS
BEGIN

SELECT *

FROM ShiftType

WHERE IsActive=1;

END
