


CREATE     PROCEDURE [dbo].[USP_PatientContact_Delete]
(
 @PatientContactId BIGINT
)
AS
BEGIN

DELETE FROM dbo.PatientContact
WHERE PatientContactId=@PatientContactId;

END
