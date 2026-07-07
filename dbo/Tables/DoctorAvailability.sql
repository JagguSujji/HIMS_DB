CREATE TABLE [dbo].[DoctorAvailability] (
    [AvailabilityId]      INT           IDENTITY (1, 1) NOT NULL,
    [DoctorId]            BIGINT        NOT NULL,
    [BranchId]            INT           NOT NULL,
    [DepartmentId]        INT           NOT NULL,
    [WeekdayId]           INT           NOT NULL,
    [StartTime]           TIME (7)      NOT NULL,
    [EndTime]             TIME (7)      NOT NULL,
    [BreakStartTime]      TIME (7)      NULL,
    [BreakEndTime]        TIME (7)      NULL,
    [SlotDurationMinutes] INT           NOT NULL,
    [MaxPatientsPerSlot]  INT           DEFAULT ((1)) NOT NULL,
    [EffectiveFrom]       DATE          NOT NULL,
    [EffectiveTo]         DATE          NULL,
    [IsActive]            BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]           DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [ModifiedOn]          DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([AvailabilityId] ASC),
    CONSTRAINT [FK_DoctorAvailability_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_DoctorAvailability_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_DoctorAvailability_Provider] FOREIGN KEY ([DoctorId]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_DoctorAvailability_Weekday] FOREIGN KEY ([WeekdayId]) REFERENCES [dbo].[Weekday] ([WeekdayId])
);

