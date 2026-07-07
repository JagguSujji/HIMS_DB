


CREATE     PROCEDURE [dbo].[USP_Religion_GetAll]
AS
BEGIN

SELECT *
FROM Religion
WHERE IsActive=1

END
