


/***********************************************************
 Store Management
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_Store_GetAll]
AS
BEGIN

SELECT *

FROM PharmacyStore

WHERE IsActive=1;

END
