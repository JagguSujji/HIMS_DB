


--------------------------------------------------------------
-- 8. Create Report Schedule
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_ReportSchedule_Create]
(
    @ScheduleCode VARCHAR(50),
    @ScheduleName VARCHAR(100),
    @CronExpression VARCHAR(100)
)
AS
BEGIN


    INSERT INTO dbo.ReportSchedule
    (
        ScheduleCode,
        ScheduleName,
        CronExpression,
        IsActive
    )
    VALUES
    (
        @ScheduleCode,
        @ScheduleName,
        @CronExpression,
        1
    );


    SELECT SCOPE_IDENTITY()
    AS ReportScheduleId;


END
