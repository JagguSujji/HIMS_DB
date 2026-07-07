CREATE TABLE [dbo].[OTComplication] (
    [ComplicationId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [OTScheduleId]     BIGINT          NOT NULL,
    [ComplicationType] NVARCHAR (100)  NOT NULL,
    [Severity]         NVARCHAR (30)   NOT NULL,
    [Description]      NVARCHAR (1000) NOT NULL,
    [ActionTaken]      NVARCHAR (1000) NULL,
    [ReportedOn]       DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ComplicationId] ASC),
    CONSTRAINT [FK_OTComplication_Schedule] FOREIGN KEY ([OTScheduleId]) REFERENCES [dbo].[OTSchedule] ([OTScheduleId])
);

