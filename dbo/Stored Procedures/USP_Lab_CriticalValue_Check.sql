


/*******************************************************
 16. Critical Alert Check
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Lab_CriticalValue_Check]
(
 @LabResultId INT
)
AS
BEGIN


SELECT *

FROM dbo.CriticalLabAlertLog

WHERE LabResultId=@LabResultId

ORDER BY CreatedOn DESC;


END
