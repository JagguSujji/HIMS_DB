


/***********************************************************
 Insurance Claim Create
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_InsuranceClaim_Create]
(
 @PolicyId INT,
 @ClaimDate DATE
)
AS
BEGIN


INSERT INTO InsuranceClaim
(
 PolicyId,
 ClaimDate
)
VALUES
(
 @PolicyId,
 @ClaimDate
)


SELECT SCOPE_IDENTITY() ClaimId;

END
