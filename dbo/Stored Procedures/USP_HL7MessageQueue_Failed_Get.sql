


CREATE     PROCEDURE [dbo].[USP_HL7MessageQueue_Failed_Get]
AS
BEGIN

SELECT *
FROM HL7MessageQueue
WHERE Status='FAILED'

END
