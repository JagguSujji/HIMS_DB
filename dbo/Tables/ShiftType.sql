CREATE TABLE [dbo].[ShiftType] (
    [ShiftTypeId]     INT            IDENTITY (1, 1) NOT NULL,
    [ShiftCode]       VARCHAR (20)   NOT NULL,
    [ShiftName]       NVARCHAR (100) NOT NULL,
    [StartTime]       TIME (7)       NOT NULL,
    [EndTime]         TIME (7)       NOT NULL,
    [BreakStartTime]  TIME (7)       NULL,
    [BreakEndTime]    TIME (7)       NULL,
    [GraceInMinutes]  INT            DEFAULT ((0)) NOT NULL,
    [GraceOutMinutes] INT            DEFAULT ((0)) NOT NULL,
    [IsNightShift]    BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]        BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]       INT            NULL,
    [CreatedOn]       DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]      INT            NULL,
    [ModifiedOn]      DATETIME2 (7)  NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([ShiftTypeId] ASC),
    UNIQUE NONCLUSTERED ([ShiftCode] ASC)
);

