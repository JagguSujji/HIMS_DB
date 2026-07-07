


--------------------------------------------------------------
-- 11. Report Category Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ReportCategory_Get]
AS
BEGIN


    SELECT

        ReportCategoryId,
        ReportCategoryCode,
        ReportCategoryName


    FROM dbo.ReportCategory

    WHERE IsActive=1;


END
