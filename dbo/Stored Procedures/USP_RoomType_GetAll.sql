


CREATE     PROCEDURE [dbo].[USP_RoomType_GetAll]
AS
BEGIN

SELECT *

FROM RoomType

WHERE IsActive=1

END
