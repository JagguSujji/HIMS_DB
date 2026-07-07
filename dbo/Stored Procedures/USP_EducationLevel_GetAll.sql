


CREATE     PROCEDURE [dbo].[USP_EducationLevel_GetAll]
AS
BEGIN

SELECT *
FROM EducationLevel
WHERE IsActive=1

END
