


CREATE     PROCEDURE [dbo].[USP_Application_Update]
(
 @ApplicationId INT,
 @ApplicationName VARCHAR(100)
)
AS
BEGIN

UPDATE Application

SET ApplicationName=@ApplicationName

WHERE ApplicationId=@ApplicationId;

END
