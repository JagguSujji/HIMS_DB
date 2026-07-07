



/************************************************************
 GENERAL LOOKUP MASTERS
************************************************************/


CREATE     PROCEDURE [dbo].[USP_Gender_GetAll]
AS
BEGIN

SELECT *
FROM Gender
WHERE IsActive=1

END
