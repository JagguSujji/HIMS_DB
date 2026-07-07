CREATE TABLE [dbo].[Weekday] (
    [WeekdayId]   INT           IDENTITY (1, 1) NOT NULL,
    [WeekdayCode] VARCHAR (10)  NOT NULL,
    [WeekdayName] NVARCHAR (50) NOT NULL,
    [DayNumber]   INT           NOT NULL,
    [IsActive]    BIT           DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([WeekdayId] ASC),
    UNIQUE NONCLUSTERED ([WeekdayCode] ASC)
);

