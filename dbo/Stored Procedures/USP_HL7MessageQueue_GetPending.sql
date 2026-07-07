


CREATE     PROCEDURE [dbo].[USP_HL7MessageQueue_GetPending]
AS
BEGIN

SELECT *
FROM HL7MessageQueue
WHERE Status='PENDING'
ORDER BY CreatedOn

END
