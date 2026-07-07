CREATE     PROCEDURE [dbo].[USP_ClaimProcessing_Update]


(
 @ClaimId BIGINT,

 @ProcessedBy BIGINT,

 @Status VARCHAR(50),

 @Remarks VARCHAR(MAX)

)

AS
BEGIN


INSERT INTO dbo.ClaimProcessing

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
@Status,
@Remarks
);



END
