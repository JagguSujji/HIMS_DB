CREATE     PROCEDURE [dbo].[USP_DoctorSchedule_Get]

(
 @DoctorId BIGINT
)

AS
BEGIN


SELECT

ScheduleId,

DoctorId,

DayOfWeek,

StartTime,

EndTime


FROM dbo.DoctorSchedule


WHERE

DoctorId=@DoctorId;


END
