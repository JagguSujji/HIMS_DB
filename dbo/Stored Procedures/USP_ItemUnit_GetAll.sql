


CREATE     PROCEDURE [dbo].[USP_ItemUnit_GetAll]
AS
BEGIN

SELECT *
FROM ItemUnit
WHERE IsActive=1;

END
