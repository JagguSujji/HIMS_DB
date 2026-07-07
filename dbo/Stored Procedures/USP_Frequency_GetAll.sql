


CREATE     PROCEDURE [dbo].[USP_Frequency_GetAll]
AS
BEGIN

SELECT *

FROM Frequency

WHERE IsActive=1

END
