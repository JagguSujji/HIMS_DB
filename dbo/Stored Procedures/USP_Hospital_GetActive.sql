



/************************************************************
 ORGANIZATION MASTER
************************************************************/


CREATE     PROCEDURE [dbo].[USP_Hospital_GetActive]
AS
BEGIN

SELECT *

FROM Hospital

WHERE IsActive=1

END
