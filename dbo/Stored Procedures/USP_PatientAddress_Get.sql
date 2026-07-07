

CREATE     PROCEDURE [dbo].[USP_PatientAddress_Get]
(
 @PatientId BIGINT
)
AS
BEGIN

SELECT *
FROM dbo.PatientAddress
WHERE PatientId=@PatientId;

END
