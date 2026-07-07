CREATE     PROCEDURE [dbo].[USP_Surgery_PostOp_Save]


(
 @PatientId BIGINT,
 @EncounterId BIGINT,
 @Notes NVARCHAR(MAX)
)

AS
BEGIN


INSERT INTO dbo.ProgressNote

(
EncounterId,
PatientId,
Assessment,
[Plan],
CreatedOn
)

VALUES

(
@EncounterId,
@PatientId,
'POST OPERATIVE ASSESSMENT',
@Notes,
GETDATE()
);


END
