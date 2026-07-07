CREATE TABLE [dbo].[PayrollComponentType] (
    [PayrollComponentTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [ComponentTypeCode]      VARCHAR (20)   NULL,
    [ComponentTypeName]      NVARCHAR (100) NULL,
    [IsActive]               BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PayrollComponentTypeId] ASC)
);

