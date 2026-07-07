


CREATE     PROCEDURE [dbo].[USP_HL7_Dashboard]
AS
BEGIN


SELECT

Status,

COUNT(*) MessageCount


FROM HL7MessageQueue


GROUP BY Status


END
