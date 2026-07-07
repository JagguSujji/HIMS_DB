


/***********************************************************
 Claim Submission
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_ClaimSubmission_Create]
(
 @ClaimId INT,
 @InvoiceId INT
)
AS
BEGIN

INSERT INTO ClaimSubmission
(
 ClaimId,
 InvoiceId,
 SubmissionDate,
 Status
)
VALUES
(
 @ClaimId,
 @InvoiceId,
 GETDATE(),
 'SUBMITTED'
)

END
