


CREATE     PROCEDURE [dbo].[USP_ExternalSystem_Save]
(
 @SystemName VARCHAR(100),
 @BaseUrl VARCHAR(500),
 @ApiKey VARCHAR(500)
)
AS
BEGIN

INSERT INTO ExternalSystemRegistry
(
SystemName,
BaseUrl,
ApiKey,
IsActive
)

VALUES
(
@SystemName,
@BaseUrl,
@ApiKey,
1
)

END
