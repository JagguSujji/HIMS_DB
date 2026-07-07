


CREATE     PROCEDURE [dbo].[USP_PatientContact_Get]
(
 @PatientId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.PatientContact
WHERE PatientId=@PatientId;

END
