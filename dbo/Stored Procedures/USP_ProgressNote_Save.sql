


---------------------------------------------------------------
-- 17. Progress Note Save
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ProgressNote_Save]
(
 @EncounterId INT,
 @PatientId INT,
 @Assessment NVARCHAR(MAX),
 @Plan NVARCHAR(MAX)
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
@Assessment,
@Plan,
GETDATE()
);


SELECT SCOPE_IDENTITY() ProgressNoteId;

END
