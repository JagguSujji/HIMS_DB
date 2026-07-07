


/***********************************************************
 Create Pre Authorization
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PreAuthorization_Create]
(
 @PatientId INT,
 @PolicyId INT,
 @RequestedAmount DECIMAL(18,2)
)
AS
BEGIN


INSERT INTO PreAuthorization
(
 PatientId,
 PolicyId,
 RequestedAmount,
 Status
)
VALUES
(
 @PatientId,
 @PolicyId,
 @RequestedAmount,
 'PENDING'
)


SELECT SCOPE_IDENTITY() PreAuthId;

END
