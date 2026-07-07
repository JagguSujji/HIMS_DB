


-------------------------------------------------------------
-- 7. Token Status Update
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentToken_UpdateStatus]
(
 @TokenId INT,
 @Status VARCHAR(50)
)
AS
BEGIN

UPDATE dbo.AppointmentToken
SET Status=@Status
WHERE TokenId=@TokenId;


END
