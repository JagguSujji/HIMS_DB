


CREATE     PROCEDURE [dbo].[USP_Occupation_GetAll]
AS
BEGIN

SELECT *
FROM Occupation
WHERE IsActive=1

END
