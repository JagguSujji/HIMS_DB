CREATE TABLE [dbo].[ProcedureType] (
    [ProcedureTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ProcedureTypeCode] VARCHAR (20)   NULL,
    [ProcedureTypeName] NVARCHAR (100) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ProcedureTypeId] ASC)
);

