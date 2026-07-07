


--------------------------------------------------------------
-- 8. Save Radiology Report
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyReport_Save]
(
    @RadiologyResultId INT,
    @ReportText NVARCHAR(MAX)
)
AS
BEGIN


    UPDATE dbo.RadiologyResult

    SET ResultDate=GETDATE()

    WHERE RadiologyResultId=
          @RadiologyResultId;


    SELECT
        @RadiologyResultId AS RadiologyResultId,
        'Report Saved' AS Message;

END
