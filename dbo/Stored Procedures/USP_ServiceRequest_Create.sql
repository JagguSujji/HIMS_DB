



CREATE     PROCEDURE [dbo].[USP_ServiceRequest_Create]
(
 @RequestType VARCHAR(100),
 @RequestedBy INT
)
AS
BEGIN


INSERT INTO ServiceRequest
(
 RequestType,
 RequestedBy,
 Status,
 CreatedOn
)
VALUES
(
 @RequestType,
 @RequestedBy,
 'OPEN',
 GETDATE()
)


SELECT SCOPE_IDENTITY() RequestId


END
