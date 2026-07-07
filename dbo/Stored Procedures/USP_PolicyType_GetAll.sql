


CREATE     PROCEDURE [dbo].[USP_PolicyType_GetAll]
AS
BEGIN

SELECT *

FROM PolicyType

WHERE IsActive=1

END
