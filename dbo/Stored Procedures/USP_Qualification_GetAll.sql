


/***********************************************************
 Qualification Master
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_Qualification_GetAll]
AS
BEGIN

SELECT *

FROM Qualification

WHERE IsActive=1;

END
