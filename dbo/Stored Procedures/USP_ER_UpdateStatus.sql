CREATE     PROCEDURE [dbo].[USP_ER_UpdateStatus]

(
 @ERVisitId BIGINT,
 @Status VARCHAR(50)
)

AS
BEGIN


UPDATE dbo.ERVisit

SET

Status=@Status


WHERE ERVisitId=@ERVisitId;


END
