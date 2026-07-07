CREATE TABLE [dbo].[ICUAdmission] (
    [ICUAdmissionId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [PatientId]         BIGINT          NOT NULL,
    [AdmissionId]       BIGINT          NULL,
    [EncounterId]       BIGINT          NULL,
    [ICUUnitId]         BIGINT          NOT NULL,
    [ICUBedId]          BIGINT          NOT NULL,
    [AdmittedOn]        DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [DischargedOn]      DATETIME2 (7)   NULL,
    [AdmissionReason]   NVARCHAR (1000) NOT NULL,
    [SeverityLevel]     NVARCHAR (30)   NOT NULL,
    [AttendingDoctorId] BIGINT          NULL,
    [Status]            NVARCHAR (30)   DEFAULT ('ACTIVE') NOT NULL,
    [CreatedOn]         DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ICUAdmissionId] ASC),
    CONSTRAINT [FK_ICUAdmission_Bed] FOREIGN KEY ([ICUBedId]) REFERENCES [dbo].[ICUBed] ([ICUBedId]),
    CONSTRAINT [FK_ICUAdmission_Unit] FOREIGN KEY ([ICUUnitId]) REFERENCES [dbo].[ICUUnit] ([ICUUnitId])
);


GO
CREATE NONCLUSTERED INDEX [IX_ICUAdmission_Patient]
    ON [dbo].[ICUAdmission]([PatientId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ICUAdmission_Status]
    ON [dbo].[ICUAdmission]([Status] ASC);

