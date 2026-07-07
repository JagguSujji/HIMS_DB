


CREATE     PROCEDURE [dbo].[USP_Currency_GetAll]
AS
BEGIN

SELECT *

FROM Currency

WHERE IsActive=1

END
