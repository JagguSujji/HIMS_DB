


--------------------------------------------------------------
-- 5. Search Radiology Procedure
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyProcedure_Search]
(
    @SearchText VARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;


    SELECT
        RadiologyProcedureId,
        ProcedureCode,
        ProcedureName,
        EstimatedDuration
    FROM dbo.RadiologyProcedure
    WHERE ProcedureName LIKE '%'+@SearchText+'%'
       OR ProcedureCode LIKE '%'+@SearchText+'%';

END
