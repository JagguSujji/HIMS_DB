CREATE TABLE [dbo].[VitalSigns] (
    [VitalSignId]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [PatientId]       BIGINT          NOT NULL,
    [EncounterId]     BIGINT          NULL,
    [VitalTypeId]     INT             NOT NULL,
    [Value]           DECIMAL (10, 2) NOT NULL,
    [UnitOfMeasureId] INT             NULL,
    [RecordedOn]      DATETIME2 (7)   DEFAULT (getutcdate()) NOT NULL,
    [RecordedBy]      BIGINT          NULL,
    [IsAbnormal]      BIT             DEFAULT ((0)) NULL,
    [Remarks]         NVARCHAR (500)  NULL,
    PRIMARY KEY CLUSTERED ([VitalSignId] ASC)
);

