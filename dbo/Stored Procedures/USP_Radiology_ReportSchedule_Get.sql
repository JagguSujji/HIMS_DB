


--------------------------------------------------------------
-- 9. Get Report Schedule
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_ReportSchedule_Get]
AS
BEGIN


    SELECT

        ReportScheduleId,
        ScheduleCode,
        ScheduleName,
        CronExpression,
        IsActive


    FROM dbo.ReportSchedule

    WHERE IsActive=1;


END
