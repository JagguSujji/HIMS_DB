CREATE TABLE [dbo].[DoctorSchedule] (
    [ScheduleId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [DoctorId]   INT      NULL,
    [DayOfWeek]  INT      NULL,
    [StartTime]  TIME (7) NULL,
    [EndTime]    TIME (7) NULL,
    PRIMARY KEY CLUSTERED ([ScheduleId] ASC)
);

