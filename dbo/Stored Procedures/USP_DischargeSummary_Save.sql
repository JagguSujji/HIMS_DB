CREATE     PROCEDURE [dbo].[USP_DischargeSummary_Save]


(
 @AdmissionId BIGINT,
 @PatientId BIGINT,
 @SummaryText VARCHAR(MAX),
 @FollowUpInstructions VARCHAR(MAX)
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
