


CREATE     PROCEDURE [dbo].[USP_Language_GetAll]
AS
BEGIN

SELECT *
FROM Language
WHERE IsActive=1

END
