


/***********************************************************
 Update Pre Authorization Status
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PreAuthorization_UpdateStatus]
(
 @PreAuthId INT,
 @Status VARCHAR(50)
)
AS
BEGIN

UPDATE PreAuthorization

SET Status=@Status

WHERE PreAuthId=@PreAuthId;


END
