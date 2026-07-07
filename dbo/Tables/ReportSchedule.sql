CREATE TABLE [dbo].[ReportSchedule] (
    [ReportScheduleId] INT            IDENTITY (1, 1) NOT NULL,
    [ScheduleCode]     VARCHAR (20)   NULL,
    [ScheduleName]     NVARCHAR (100) NULL,
    [CronExpression]   VARCHAR (100)  NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ReportScheduleId] ASC)
);

