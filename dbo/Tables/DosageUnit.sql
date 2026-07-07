CREATE TABLE [dbo].[DosageUnit] (
    [DosageUnitId] INT            IDENTITY (1, 1) NOT NULL,
    [UnitCode]     VARCHAR (20)   NULL,
    [UnitName]     NVARCHAR (100) NULL,
    [Symbol]       VARCHAR (20)   NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DosageUnitId] ASC)
);

