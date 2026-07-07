



/************************************************************
 BED / FACILITY MASTER
************************************************************/


CREATE     PROCEDURE [dbo].[USP_BedType_GetAll]
AS
BEGIN

SELECT *

FROM BedType

WHERE IsActive=1

END
