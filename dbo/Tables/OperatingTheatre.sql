CREATE TABLE [dbo].[OperatingTheatre] (
    [OTId]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [OTCode]           NVARCHAR (30)  NOT NULL,
    [OTName]           NVARCHAR (150) NOT NULL,
    [BranchId]         BIGINT         NULL,
    [FloorId]          BIGINT         NULL,
    [OTTypeId]         BIGINT         NULL,
    [IsLaminarFlow]    BIT            DEFAULT ((0)) NOT NULL,
    [IsRoboticEnabled] BIT            DEFAULT ((0)) NOT NULL,
    [Status]           NVARCHAR (30)  DEFAULT ('AVAILABLE') NOT NULL,
    [IsActive]         BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]        DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([OTId] ASC),
    CONSTRAINT [UQ_OT_Code] UNIQUE NONCLUSTERED ([OTCode] ASC)
);

