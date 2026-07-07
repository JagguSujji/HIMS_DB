CREATE TABLE [dbo].[DiagnosisType] (
    [DiagnosisTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [DiagnosisTypeCode] VARCHAR (20)   NULL,
    [DiagnosisTypeName] NVARCHAR (100) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DiagnosisTypeId] ASC),
    UNIQUE NONCLUSTERED ([DiagnosisTypeCode] ASC)
);

