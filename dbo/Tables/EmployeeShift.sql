CREATE TABLE [dbo].[EmployeeShift] (
    [EmployeeShiftId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [EmployeeId]      BIGINT        NOT NULL,
    [ShiftTypeId]     INT           NOT NULL,
    [EffectiveFrom]   DATE          NOT NULL,
    [EffectiveTo]     DATE          NULL,
    [IsCurrent]       BIT           DEFAULT ((1)) NOT NULL,
    [CreatedBy]       INT           NULL,
    [CreatedOn]       DATETIME2 (7) DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeShiftId] ASC),
    CONSTRAINT [FK_EmployeeShift_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EmployeeShift_Shift] FOREIGN KEY ([ShiftTypeId]) REFERENCES [dbo].[ShiftType] ([ShiftTypeId])
);

