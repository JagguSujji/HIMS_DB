CREATE TABLE [dbo].[CertificationType] (
    [CertificationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CertificationCode]   VARCHAR (20)   NULL,
    [CertificationName]   NVARCHAR (100) NULL,
    [Description]         NVARCHAR (300) NULL,
    [IsActive]            BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([CertificationTypeId] ASC),
    UNIQUE NONCLUSTERED ([CertificationCode] ASC)
);

