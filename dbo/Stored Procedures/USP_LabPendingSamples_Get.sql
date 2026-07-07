


/*******************************************************
 18. Pending Lab Samples
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabPendingSamples_Get]
AS
BEGIN


SELECT *

FROM dbo.LabSampleCollection

WHERE Status NOT IN
(
'COMPLETED',
'CANCELLED'
);


END
