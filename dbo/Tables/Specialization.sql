CREATE TABLE [dbo].[Specialization] (
    [SpecializationId]   INT            IDENTITY (1, 1) NOT NULL,
    [SpecializationCode] VARCHAR (20)   NULL,
    [SpecializationName] NVARCHAR (150) NULL,
    [Description]        NVARCHAR (300) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    [CreatedOn]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [RowVersion]         ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([SpecializationId] ASC),
    UNIQUE NONCLUSTERED ([SpecializationCode] ASC)
);

