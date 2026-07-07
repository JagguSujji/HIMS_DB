


---------------------------------------------------------------
-- 15. Episode Get
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Episode_Get]
(
 @PatientId INT
)
AS
BEGIN

SELECT *
FROM dbo.EpisodeOfCare
WHERE PatientId=@PatientId
ORDER BY StartDate DESC;

END
