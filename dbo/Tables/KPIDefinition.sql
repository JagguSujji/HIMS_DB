CREATE TABLE [dbo].[KPIDefinition] (
    [KPIDefinitionId]    INT             IDENTITY (1, 1) NOT NULL,
    [KPICode]            VARCHAR (30)    NULL,
    [KPIName]            NVARCHAR (200)  NULL,
    [UnitOfMeasureId]    INT             NULL,
    [FormulaDescription] NVARCHAR (1000) NULL,
    [TargetValue]        DECIMAL (18, 2) NULL,
    [WarningValue]       DECIMAL (18, 2) NULL,
    [CriticalValue]      DECIMAL (18, 2) NULL,
    [IsActive]           BIT             DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([KPIDefinitionId] ASC),
    FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [dbo].[UnitOfMeasure] ([UnitOfMeasureId])
);

