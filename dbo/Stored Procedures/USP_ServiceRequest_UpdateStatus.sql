



CREATE     PROCEDURE [dbo].[USP_ServiceRequest_UpdateStatus]
(
 @RequestId INT,
 @Status VARCHAR(50)
)
AS
BEGIN


UPDATE ServiceRequest

SET Status=@Status

WHERE RequestId=@RequestId


END
