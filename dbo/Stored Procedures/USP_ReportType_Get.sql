


--------------------------------------------------------------
-- 10. Report Type Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ReportType_Get]
AS
BEGIN


    SELECT

        ReportTypeId,
        ReportTypeCode,
        ReportTypeName,
        Description


    FROM dbo.ReportType

    WHERE IsActive=1;


END
