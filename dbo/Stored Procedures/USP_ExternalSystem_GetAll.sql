


CREATE     PROCEDURE [dbo].[USP_ExternalSystem_GetAll]
AS
BEGIN

SELECT
SystemId,
SystemName,
BaseUrl,
IsActive

FROM ExternalSystemRegistry

END
