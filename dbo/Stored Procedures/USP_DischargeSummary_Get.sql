CREATE     PROCEDURE [dbo].[USP_DischargeSummary_Get]
(
 @AdmissionId INT
)
AS
BEGIN

SET NOCOUNT ON;


SELECT
 DischargeSummaryId,
 AdmissionId,
 PatientId,
 SummaryText,
 FollowUpInstructions,
 CreatedOn

FROM dbo.DischargeSummary

WHERE AdmissionId=@AdmissionId;


END
