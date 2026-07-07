


/*--------------------------------------------------------
 Consent Create
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_Consent_Create]
(
 @PatientId INT,
 @EncounterId INT,
 @ConsentType VARCHAR(100),
 @ConsentText NVARCHAR(MAX),
 @SignedBy INT
)
AS
BEGIN

INSERT INTO Consent
(
 PatientId,
 EncounterId,
 ConsentType,
 ConsentText,
 SignedBy,
 SignedOn
)
VALUES
(
 @PatientId,
 @EncounterId,
 @ConsentType,
 @ConsentText,
 @SignedBy,
 GETDATE()
);


SELECT SCOPE_IDENTITY() ConsentId;

END
