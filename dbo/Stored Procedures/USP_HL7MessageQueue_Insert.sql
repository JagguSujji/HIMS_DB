
/************************************************************
 HL7 MESSAGE QUEUE MANAGEMENT
************************************************************/


CREATE     PROCEDURE [dbo].[USP_HL7MessageQueue_Insert]
(
 @MessageType VARCHAR(100),
 @Payload NVARCHAR(MAX)
)
AS
BEGIN

INSERT INTO HL7MessageQueue
(
 MessageType,
 Payload,
 Status,
 CreatedOn
)
VALUES
(
 @MessageType,
 @Payload,
 'PENDING',
 GETDATE()
)

SELECT SCOPE_IDENTITY() MessageId

END
