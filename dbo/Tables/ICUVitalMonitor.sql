CREATE TABLE [dbo].[ICUVitalMonitor] (
    [MonitorId]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [ICUAdmissionId] BIGINT        NOT NULL,
    [VitalTypeId]    BIGINT        NOT NULL,
    [Value]          NVARCHAR (50) NOT NULL,
    [Unit]           NVARCHAR (20) NULL,
    [RecordedAt]     DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    [IsAbnormal]     BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([MonitorId] ASC),
    CONSTRAINT [FK_ICUVital_ICUAdmission] FOREIGN KEY ([ICUAdmissionId]) REFERENCES [dbo].[ICUAdmission] ([ICUAdmissionId])
);


GO
CREATE NONCLUSTERED INDEX [IX_ICUVital_Admission]
    ON [dbo].[ICUVitalMonitor]([ICUAdmissionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ICUVital_Time]
    ON [dbo].[ICUVitalMonitor]([RecordedAt] ASC);

