CREATE TABLE [dbo].[ShiftPattern] (
    [ShiftPatternId]     INT            IDENTITY (1, 1) NOT NULL,
    [PatternCode]        VARCHAR (20)   NULL,
    [PatternName]        NVARCHAR (100) NULL,
    [WorkingDaysPerWeek] INT            NULL,
    [WeeklyHours]        DECIMAL (6, 2) NULL,
    [IsNightRotation]    BIT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ShiftPatternId] ASC)
);

