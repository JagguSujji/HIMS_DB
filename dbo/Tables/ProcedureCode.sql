CREATE TABLE [dbo].[ProcedureCode] (
    [ProcedureCodeId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProcedureCode]   VARCHAR (20)   NOT NULL,
    [ProcedureName]   NVARCHAR (300) NOT NULL,
    [Category]        NVARCHAR (100) NULL,
    [IsSurgical]      BIT            DEFAULT ((0)) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    [CreatedOn]       DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ProcedureCodeId] ASC),
    UNIQUE NONCLUSTERED ([ProcedureCode] ASC)
);

