CREATE     PROCEDURE [dbo].[USP_DischargeStatus_GetAll]
(
    @IsActive BIT=NULL
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRY

SELECT
    DischargeStatusId,
    StatusCode,
    StatusName,
    IsActive
FROM dbo.DischargeStatus
WHERE (@IsActive IS NULL OR IsActive=@IsActive)
ORDER BY StatusName;


END TRY
BEGIN CATCH
THROW;
END CATCH

END
