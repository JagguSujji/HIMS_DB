CREATE     PROCEDURE [dbo].[USP_Patient_Statistics_Report]


AS
BEGIN


SELECT


GenderId,

COUNT(*) TotalPatients


FROM Patient


GROUP BY

GenderId;



END
