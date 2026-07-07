


CREATE     PROCEDURE [dbo].[USP_ItemGroup_GetAll]
AS
BEGIN

SELECT *
FROM ItemGroup
WHERE IsActive=1;

END
