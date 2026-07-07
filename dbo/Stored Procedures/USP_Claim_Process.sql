


/***********************************************************
 Claim Processing
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Claim_Process]
(
 @ClaimId INT,
 @ProcessedBy INT,
 @Remarks VARCHAR(500)
)
AS
BEGIN


INSERT INTO ClaimProcessing
(
 ClaimId,
 ProcessedBy,
 Status,
 Remarks
)
VALUES
(
 @ClaimId,
 @ProcessedBy,
 'PROCESSED',
 @Remarks
)


END
