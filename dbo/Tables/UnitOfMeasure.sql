CREATE TABLE [dbo].[UnitOfMeasure] (
    [UnitOfMeasureId] INT            IDENTITY (1, 1) NOT NULL,
    [UnitCode]        VARCHAR (20)   NULL,
    [UnitName]        NVARCHAR (100) NULL,
    [Symbol]          VARCHAR (20)   NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([UnitOfMeasureId] ASC),
    UNIQUE NONCLUSTERED ([UnitCode] ASC)
);

