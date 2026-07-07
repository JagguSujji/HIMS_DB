CREATE     PROCEDURE [dbo].[USP_QueueToken_UpdateStatus]


(
 @TokenId BIGINT,

 @Status VARCHAR(50)

)

AS
BEGIN


UPDATE dbo.QueueToken

SET

Status=@Status


WHERE TokenId=@TokenId;



END
