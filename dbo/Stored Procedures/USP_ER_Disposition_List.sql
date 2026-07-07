CREATE     PROCEDURE [dbo].[USP_ER_Disposition_List]

AS
BEGIN


SELECT

EmergencyDispositionId,
DispositionCode,
DispositionName


FROM dbo.EmergencyDisposition


WHERE IsActive=1;


END
