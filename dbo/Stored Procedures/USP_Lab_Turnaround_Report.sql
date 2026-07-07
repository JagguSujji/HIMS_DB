


/*******************************************************
 19. Lab Turnaround Time Report
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Lab_Turnaround_Report]
AS
BEGIN


SELECT

AVG(
DATEDIFF
(
MINUTE,
LO.OrderDate,
LR.ResultDate
)
)
AverageMinutes

FROM dbo.LabOrder LO

INNER JOIN dbo.LabResult LR

ON LO.LabOrderId=LR.LabOrderId;


END
