


CREATE     PROCEDURE [dbo].[USP_Nationality_GetAll]
AS
BEGIN

SELECT *
FROM Nationality
WHERE IsActive=1

END
