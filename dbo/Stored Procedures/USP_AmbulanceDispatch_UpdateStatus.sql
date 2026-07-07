CREATE     PROCEDURE [dbo].[USP_AmbulanceDispatch_UpdateStatus]

(
 @DispatchId BIGINT,
 @Status VARCHAR(50)
)

AS
BEGIN


UPDATE dbo.AmbulanceDispatch

SET

Status=@Status


WHERE DispatchId=@DispatchId;


END
