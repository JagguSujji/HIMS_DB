


CREATE     PROCEDURE [dbo].[USP_ExternalSystem_UpdateStatus]
(
 @SystemId INT,
 @IsActive BIT
)
AS
BEGIN

UPDATE ExternalSystemRegistry

SET IsActive=@IsActive

WHERE SystemId=@SystemId

END
