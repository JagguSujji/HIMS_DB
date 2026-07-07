

CREATE     PROCEDURE [dbo].[USP_PatientAddress_Delete]
(
 @PatientAddressId BIGINT
)
AS
BEGIN

DELETE FROM dbo.PatientAddress
WHERE PatientAddressId=@PatientAddressId;

END
