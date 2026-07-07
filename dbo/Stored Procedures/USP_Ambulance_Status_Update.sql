CREATE     PROCEDURE [dbo].[USP_Ambulance_Status_Update]


(
 @DispatchId BIGINT,

 @Status VARCHAR(50)

)

AS
BEGIN


UPDATE dbo.AmbulanceDispatch

SET

Status=@Status


WHERE

DispatchId=@DispatchId;



END
