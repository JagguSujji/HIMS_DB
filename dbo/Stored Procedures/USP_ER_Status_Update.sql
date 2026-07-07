CREATE     PROCEDURE [dbo].[USP_ER_Status_Update]


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
