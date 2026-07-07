


/***********************************************************
 Item Category
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_ItemCategory_GetAll]
AS
BEGIN

SELECT *
FROM ItemCategory
WHERE IsActive=1;

END
