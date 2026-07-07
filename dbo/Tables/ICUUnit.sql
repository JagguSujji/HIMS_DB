CREATE TABLE [dbo].[ICUUnit] (
    [ICUUnitId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [UnitCode]  NVARCHAR (30)  NOT NULL,
    [UnitName]  NVARCHAR (150) NOT NULL,
    [UnitType]  NVARCHAR (50)  NOT NULL,
    [BranchId]  BIGINT         NULL,
    [FloorId]   BIGINT         NULL,
    [TotalBeds] INT            DEFAULT ((0)) NOT NULL,
    [IsActive]  BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn] DATETIME2 (7)  CONSTRAINT [DF_ICUUnit_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ICUUnitId] ASC),
    CONSTRAINT [UQ_ICUUnit_Code] UNIQUE NONCLUSTERED ([UnitCode] ASC)
);

