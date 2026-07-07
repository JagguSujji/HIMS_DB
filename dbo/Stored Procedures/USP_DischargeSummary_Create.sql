CREATE     PROCEDURE [dbo].[USP_DischargeSummary_Create]


(
 @AdmissionId BIGINT,
 @PatientId BIGINT,
 @SummaryText NVARCHAR(MAX),
 @FollowUpInstructions NVARCHAR(MAX)
)

AS
BEGIN


INSERT INTO dbo.DischargeSummary

(
AdmissionId,
PatientId,
SummaryText,
FollowUpInstructions,
CreatedOn
)

VALUES

(
@AdmissionId,
@PatientId,
@SummaryText,
@FollowUpInstructions,
GETDATE()
);


END
