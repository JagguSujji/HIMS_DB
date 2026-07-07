


CREATE     PROCEDURE [dbo].[USP_HL7MessageQueue_UpdateStatus]
(
 @MessageId INT,
 @Status VARCHAR(50)
)
AS
BEGIN

UPDATE HL7MessageQueue

SET Status=@Status

WHERE MessageId=@MessageId

END
