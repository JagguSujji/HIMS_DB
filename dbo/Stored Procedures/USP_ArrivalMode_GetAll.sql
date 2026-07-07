CREATE     PROCEDURE [dbo].[USP_ArrivalMode_GetAll]
AS
BEGIN

SET NOCOUNT ON;

SELECT
    ArrivalModeId,
    ArrivalModeCode,
    ArrivalModeName,
    IsActive
FROM dbo.ArrivalMode
WHERE IsActive=1
ORDER BY ArrivalModeName;

END
