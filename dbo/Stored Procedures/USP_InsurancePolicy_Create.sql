


/***********************************************************
 Create Insurance Policy
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_InsurancePolicy_Create]
(
 @PatientId INT,
 @PolicyNumber VARCHAR(100)
)
AS
BEGIN

INSERT INTO InsurancePolicy
(
 PatientId,
 PolicyNumber
)
VALUES
(
 @PatientId,
 @PolicyNumber
)

SELECT SCOPE_IDENTITY() PolicyId;

END
