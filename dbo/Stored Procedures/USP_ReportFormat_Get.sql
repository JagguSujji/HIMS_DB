


--------------------------------------------------------------
-- 12. Report Format Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ReportFormat_Get]
AS
BEGIN


    SELECT

        ReportFormatId,
        FormatCode,
        FormatName,
        FileExtension,
        MimeType


    FROM dbo.ReportFormat

    WHERE IsActive=1;


END
