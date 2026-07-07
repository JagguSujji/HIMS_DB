CREATE TABLE [dbo].[Qualification] (
    [QualificationId]   INT            IDENTITY (1, 1) NOT NULL,
    [QualificationCode] VARCHAR (20)   NULL,
    [QualificationName] NVARCHAR (150) NULL,
    [Description]       NVARCHAR (300) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    [CreatedOn]         DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [RowVersion]        ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([QualificationId] ASC),
    UNIQUE NONCLUSTERED ([QualificationCode] ASC)
);

