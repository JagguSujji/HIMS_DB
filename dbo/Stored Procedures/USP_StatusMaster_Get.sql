


/************************************************************
 SYSTEM CONFIG MASTER
************************************************************/


CREATE     PROCEDURE [dbo].[USP_StatusMaster_Get]
(
 @ModuleName VARCHAR(100)
)
AS
BEGIN

SELECT *

FROM StatusMaster

WHERE ModuleName=@ModuleName

AND IsActive=1

END
