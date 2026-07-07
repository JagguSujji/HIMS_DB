CREATE TABLE [dbo].[PayrollComponent] (
    [PayrollComponentId]     INT            IDENTITY (1, 1) NOT NULL,
    [PayrollComponentTypeId] INT            NOT NULL,
    [ComponentCode]          VARCHAR (20)   NULL,
    [ComponentName]          NVARCHAR (100) NULL,
    [IsTaxable]              BIT            NULL,
    [IsActive]               BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PayrollComponentId] ASC),
    FOREIGN KEY ([PayrollComponentTypeId]) REFERENCES [dbo].[PayrollComponentType] ([PayrollComponentTypeId])
);

