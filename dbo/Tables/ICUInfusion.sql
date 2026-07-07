CREATE TABLE [dbo].[ICUInfusion] (
    [InfusionId]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [ICUAdmissionId] BIGINT        NOT NULL,
    [DrugId]         BIGINT        NOT NULL,
    [Dose]           NVARCHAR (50) NOT NULL,
    [Rate]           NVARCHAR (50) NULL,
    [StartTime]      DATETIME2 (7) NOT NULL,
    [EndTime]        DATETIME2 (7) NULL,
    [PrescribedBy]   BIGINT        NULL,
    [Status]         NVARCHAR (30) DEFAULT ('RUNNING') NOT NULL,
    PRIMARY KEY CLUSTERED ([InfusionId] ASC),
    CONSTRAINT [FK_ICUInfusion_ICUAdmission] FOREIGN KEY ([ICUAdmissionId]) REFERENCES [dbo].[ICUAdmission] ([ICUAdmissionId])
);

