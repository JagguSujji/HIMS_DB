CREATE TABLE [dbo].[ItemUnit] (
    [ItemUnitId]       INT             IDENTITY (1, 1) NOT NULL,
    [UnitCode]         VARCHAR (20)    NULL,
    [UnitName]         NVARCHAR (100)  NULL,
    [ConversionFactor] DECIMAL (18, 4) NULL,
    [IsActive]         BIT             DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ItemUnitId] ASC)
);

