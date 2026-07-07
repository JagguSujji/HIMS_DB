CREATE TABLE [dbo].[PreAuthorization] (
    [PreAuthId]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [PatientId]       BIGINT          NOT NULL,
    [PolicyId]        BIGINT          NOT NULL,
    [RequestedAmount] DECIMAL (18, 2) NOT NULL,
    [ApprovedAmount]  DECIMAL (18, 2) NULL,
    [Status]          NVARCHAR (30)   NOT NULL,
    [RequestedOn]     DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [ApprovedOn]      DATETIME2 (7)   NULL,
    PRIMARY KEY CLUSTERED ([PreAuthId] ASC)
);

