


---------------------------------------------------------------
-- 3. Finalize Clinical Document
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ClinicalDocument_Finalize]
(
 @DocumentId INT
)
AS
BEGIN

UPDATE dbo.ClinicalDocument
SET IsFinal=1
WHERE DocumentId=@DocumentId;

END
