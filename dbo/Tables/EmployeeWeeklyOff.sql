CREATE TABLE [dbo].[EmployeeWeeklyOff] (
    [EmployeeWeeklyOffId] BIGINT IDENTITY (1, 1) NOT NULL,
    [EmployeeId]          BIGINT NOT NULL,
    [WeekdayId]           INT    NOT NULL,
    [EffectiveFrom]       DATE   NOT NULL,
    [EffectiveTo]         DATE   NULL,
    [IsActive]            BIT    DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeWeeklyOffId] ASC),
    CONSTRAINT [FK_WeeklyOff_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_WeeklyOff_Weekday] FOREIGN KEY ([WeekdayId]) REFERENCES [dbo].[Weekday] ([WeekdayId])
);

