



/************************************************************
 BED / FACILITY MASTER
************************************************************/




CREATE     PROCEDURE [dbo].[USP_BedStatus_GetAll]
AS
BEGIN

SELECT *

FROM BedStatus

WHERE IsActive=1

END
